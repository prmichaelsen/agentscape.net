// GET /c/<slug>            — current view of an entry (latest active version)
// GET /c/<slug>~<hash>     — historical view of a specific content-hash version
//
// Renders the 9-section canonical shape per
// design.agentscape-encyclopedia-charter~fdd18e57 C2. Related entries,
// citation history, and amendment history are projected at request-time
// (no inline storage).

import {
  htmlEscape,
  renderMarkdown,
  layoutHtml,
  htmlResponse,
} from "../_lib.js";

export async function onRequestGet(context) {
  const { params, env, request } = context;
  const raw = params.slug || "";

  // Parse slug~hash form. ~ is the historical-version separator.
  let slug = raw;
  let hash = null;
  const tildeIdx = raw.indexOf("~");
  if (tildeIdx >= 0) {
    slug = raw.slice(0, tildeIdx);
    hash = raw.slice(tildeIdx + 1);
  }

  // Look up the entry row.
  let entry;
  if (hash) {
    entry = await env.DB.prepare(
      `SELECT * FROM entries
         WHERE slug = ? AND content_hash = ? AND deleted_at IS NULL
         LIMIT 1`
    )
      .bind(slug, hash)
      .first();
  } else {
    entry = await env.DB.prepare(
      `SELECT * FROM entries
         WHERE slug = ?
           AND superseded_by_id IS NULL
           AND deleted_at IS NULL
         LIMIT 1`
    )
      .bind(slug)
      .first();
  }

  if (!entry) {
    return htmlResponse(
      layoutHtml({
        title: "Entry not found — agentscape.net",
        description: "No such encyclopedia entry.",
        body: "<h1>Entry not found</h1><p>No encyclopedia entry by that slug.</p>",
      }),
      { status: 404 }
    );
  }

  // Related entries (bidirectional; from_slug = this slug).
  const { results: related } = await env.DB.prepare(
    `SELECT r.to_slug AS slug, e.title
       FROM entry_related r
       LEFT JOIN entries e
         ON e.slug = r.to_slug
        AND e.superseded_by_id IS NULL
        AND e.deleted_at IS NULL
      WHERE r.from_slug = ?
      ORDER BY r.to_slug ASC`
  )
    .bind(slug)
    .all();

  // Citation history — every issue/longform that cites any version of
  // this entry (denormalized via entry_slug).
  const { results: citations } = await env.DB.prepare(
    `SELECT
        ec.id,
        ec.amendment_bearing,
        ec.cited_at,
        ec.source_section_id,
        ec.source_longform_id,
        s.section_id   AS s_section_id,
        s.title        AS s_title,
        i.issue_number AS i_issue_number,
        i.title        AS i_title,
        lf.slug        AS lf_slug,
        lf.title       AS lf_title
       FROM entry_citations ec
       LEFT JOIN sections s ON s.id = ec.source_section_id
       LEFT JOIN issues   i ON i.id = s.issue_id
       LEFT JOIN longform lf ON lf.id = ec.source_longform_id
      WHERE ec.entry_slug = ?
      ORDER BY ec.cited_at DESC`
  )
    .bind(slug)
    .all();

  // Amendment history — every amendment of this entry, newest first.
  const { results: amendments } = await env.DB.prepare(
    `SELECT
        a.id, a.trigger_type, a.summary, a.editor_id, a.approved_at,
        prev.content_hash AS prev_hash,
        next.content_hash AS next_hash,
        i.issue_number AS source_issue_number,
        i.title        AS source_issue_title
       FROM entry_amendments a
       JOIN entries prev ON prev.id = a.previous_entry_id
       JOIN entries next ON next.id = a.new_entry_id
       LEFT JOIN issues i ON i.id = a.source_issue_id
      WHERE a.slug = ?
      ORDER BY a.approved_at DESC`
  )
    .bind(slug)
    .all();

  // Prev / next entries alphabetically.
  const prevEntry = await env.DB.prepare(
    `SELECT slug, title FROM entries
       WHERE slug < ? AND state='active'
         AND superseded_by_id IS NULL AND deleted_at IS NULL
       ORDER BY slug DESC LIMIT 1`
  )
    .bind(slug)
    .first();
  const nextEntry = await env.DB.prepare(
    `SELECT slug, title FROM entries
       WHERE slug > ? AND state='active'
         AND superseded_by_id IS NULL AND deleted_at IS NULL
       ORDER BY slug ASC LIMIT 1`
  )
    .bind(slug)
    .first();

  // Build 9-section body.
  const section = (label, content) => {
    if (!content) return "";
    return `<h2>${htmlEscape(label)}</h2>${renderMarkdown(content)}`;
  };

  const relatedHtml = related.length
    ? `<ul>${related
        .map(
          (r) =>
            `<li><a href="/c/${htmlEscape(r.slug)}">${htmlEscape(
              r.title || r.slug
            )}</a></li>`
        )
        .join("")}</ul>`
    : "<p><em>No related entries.</em></p>";

  const citationsHtml = citations.length
    ? `<ul>${citations
        .map((c) => {
          const flag = c.amendment_bearing
            ? ' <span class="spine-anchor">amendment-bearing</span>'
            : "";
          if (c.source_section_id) {
            return `<li><a href="/issues/${c.i_issue_number}">${htmlEscape(
              c.i_title || "Issue " + c.i_issue_number
            )}</a> · <a href="/sections/${htmlEscape(
              c.source_section_id
            )}">${htmlEscape(c.s_title || c.s_section_id)}</a>${flag}</li>`;
          } else if (c.source_longform_id) {
            return `<li><a href="/longform/${htmlEscape(
              c.lf_slug
            )}">${htmlEscape(c.lf_title || c.lf_slug)}</a>${flag}</li>`;
          }
          return `<li>(unknown source)${flag}</li>`;
        })
        .join("")}</ul>`
    : "<p><em>No citations recorded.</em></p>";

  const amendmentsHtml = amendments.length
    ? `<ul>${amendments
        .map((a) => {
          const src =
            a.trigger_type === "issue-sourced" && a.source_issue_number
              ? ` · sourced by <a href="/issues/${a.source_issue_number}">${htmlEscape(
                  a.source_issue_title || "Issue " + a.source_issue_number
                )}</a>`
              : ` · ${htmlEscape(a.trigger_type)}`;
          return `<li><strong>${htmlEscape(
            a.approved_at
          )}</strong> — ${htmlEscape(a.summary)}${src} · <a href="/c/${htmlEscape(
            slug
          )}~${htmlEscape(a.prev_hash)}">prev version</a> → <a href="/c/${htmlEscape(
            slug
          )}~${htmlEscape(a.next_hash)}">new version</a></li>`;
        })
        .join("")}</ul>`
    : "<p><em>No amendments recorded.</em></p>";

  const navParts = [];
  if (prevEntry) {
    navParts.push(
      `<a href="/c/${htmlEscape(prevEntry.slug)}">← ${htmlEscape(
        prevEntry.title || prevEntry.slug
      )}</a>`
    );
  }
  navParts.push(`<a href="/c/">All entries</a>`);
  if (nextEntry) {
    navParts.push(
      `<a href="/c/${htmlEscape(nextEntry.slug)}">${htmlEscape(
        nextEntry.title || nextEntry.slug
      )} →</a>`
    );
  }
  const navHtml = `<nav class="page-nav">${navParts.join(" · ")}</nav>`;

  const versionBanner = hash
    ? `<p class="frame"><em>Historical version (content-hash <code>${htmlEscape(
        hash
      )}</code>). <a href="/c/${htmlEscape(slug)}">View current.</a></em></p>`
    : "";

  const body = `
    <div class="spine-anchor">encyclopedia · v${htmlEscape(
      String(entry.version)
    )} · ${htmlEscape(entry.state)}</div>
    <h1>${htmlEscape(entry.title)}</h1>
    ${versionBanner}
    ${section("Definition", entry.definition)}
    ${section("First appearance", entry.first_appearance)}
    ${section("Etymology", entry.etymology)}
    ${section("Current meaning", entry.current_meaning)}
    ${section("Divergent meanings", entry.divergent_meanings)}
    <h2>Related entries</h2>
    ${relatedHtml}
    <h2>Citation history</h2>
    ${citationsHtml}
    <h2>Amendment history</h2>
    ${amendmentsHtml}
    ${entry.supersession_note ? section("Supersession note", entry.supersession_note) : ""}
    ${navHtml}
  `;

  const url = new URL(request.url);
  const canonical = hash
    ? `${url.origin}/c/${slug}~${hash}`
    : `${url.origin}/c/${slug}`;

  return htmlResponse(
    layoutHtml({
      title: `${entry.title} — agentscape.net encyclopedia`,
      description: (entry.definition || "").slice(0, 200),
      canonical,
      body,
    })
  );
}
