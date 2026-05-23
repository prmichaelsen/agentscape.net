// GET /issues/<n> — full-issue HTML render projecting from D1.
// Implements SPP-2 (projection-engine pattern) for issue projection.

import {
  htmlEscape,
  renderMarkdown,
  layoutHtml,
  htmlResponse,
} from "../_lib.js";

export async function onRequestGet(context) {
  const { params, env, request } = context;
  const n = parseInt(params.n, 10);
  if (!Number.isInteger(n) || n <= 0) {
    return htmlResponse(
      layoutHtml({
        title: "Issue not found — agentscape.net",
        description: "No such issue.",
        body: "<h1>Issue not found</h1><p>That issue number isn't valid.</p>",
      }),
      { status: 404 }
    );
  }

  const issue = await env.DB.prepare(
    "SELECT id, issue_number, slug, title, publish_date, masthead_state " +
      "FROM issues WHERE issue_number = ? AND deleted_at IS NULL"
  )
    .bind(n)
    .first();

  if (!issue) {
    return htmlResponse(
      layoutHtml({
        title: "Issue not found — agentscape.net",
        description: "No such issue.",
        body: "<h1>Issue not found</h1><p>That issue hasn't been published.</p>",
      }),
      { status: 404 }
    );
  }

  // Sections with their longform body + spine/category labels. Only the
  // latest version of each section (superseded_by_id IS NULL).
  const { results: sections } = await env.DB.prepare(
    `SELECT
        s.id            AS s_id,
        s.section_id    AS s_section_id,
        s.title         AS s_title,
        s.frame         AS s_frame,
        s.structural_argument AS s_struct,
        spine.slug      AS spine_slug,
        spine.label     AS spine_label,
        cat.slug        AS cat_slug,
        cat.label       AS cat_label,
        lf.id           AS lf_id,
        lf.slug         AS lf_slug,
        lf.body         AS lf_body
      FROM sections s
      JOIN spine_tags    spine ON s.spine_tag_id    = spine.id
      JOIN category_tags cat   ON s.category_tag_id = cat.id
      LEFT JOIN longform lf    ON s.longform_id     = lf.id
      WHERE s.issue_id = ?
        AND s.deleted_at IS NULL
        AND s.superseded_by_id IS NULL
      ORDER BY s.section_id ASC`
  )
    .bind(issue.id)
    .all();

  // Citations grouped by section.
  const { results: citationRows } = await env.DB.prepare(
    `SELECT section_id, label, url, kind FROM citations
      WHERE section_id IN (SELECT id FROM sections WHERE issue_id = ?)
        AND deleted_at IS NULL
      ORDER BY id`
  )
    .bind(issue.id)
    .all();
  const citationsBySection = {};
  for (const c of citationRows) {
    (citationsBySection[c.section_id] = citationsBySection[c.section_id] || []).push(c);
  }

  // Prev/next issue lookup for bottom-of-page nav.
  const prevIssue = await env.DB.prepare(
    "SELECT issue_number FROM issues WHERE issue_number < ? AND deleted_at IS NULL " +
      "ORDER BY issue_number DESC LIMIT 1"
  )
    .bind(n)
    .first();
  const nextIssue = await env.DB.prepare(
    "SELECT issue_number FROM issues WHERE issue_number > ? AND deleted_at IS NULL " +
      "ORDER BY issue_number ASC LIMIT 1"
  )
    .bind(n)
    .first();

  const sectionsHtml = sections
    .map((s) => {
      const body = s.lf_body ? renderMarkdown(s.lf_body) : "";
      const cites = (citationsBySection[s.s_id] || [])
        .map(
          (c) =>
            `<li><a href="${htmlEscape(c.url)}">${htmlEscape(c.label)}</a> · <span>${htmlEscape(c.kind)}</span></li>`
        )
        .join("");
      const citesBlock = cites
        ? `<div class="sources"><h3>Sources</h3><ul>${cites}</ul></div>`
        : "";
      return `<section id="${htmlEscape(s.s_section_id)}">
  <div class="spine-anchor">spine · ${htmlEscape(s.spine_label)}</div>
  <p class="frame">${htmlEscape(s.s_frame)}</p>
  ${body}
  ${citesBlock}
  <hr class="section-divider" />
</section>`;
    })
    .join("\n");

  const tocHtml = sections.length
    ? `<h2>In this issue</h2><ul>${sections
        .map(
          (s) =>
            `<li><strong>${htmlEscape(s.s_section_id)}</strong> · <a href="#${htmlEscape(s.s_section_id)}">${htmlEscape(s.s_title)}</a></li>`
        )
        .join("")}</ul>`
    : "<p><em>No sections published yet.</em></p>";

  const navParts = [];
  if (prevIssue) {
    navParts.push(`<a href="/issues/${prevIssue.issue_number}">← Previous issue</a>`);
  }
  navParts.push(`<a href="/issues/">All issues</a>`);
  if (nextIssue) {
    navParts.push(`<a href="/issues/${nextIssue.issue_number}">Next issue →</a>`);
  }
  const navHtml = `<nav class="page-nav">${navParts.join(" · ")}</nav>`;

  const body = `
  <h1>${htmlEscape(issue.title)}</h1>
  <p class="frame">Issue ${issue.issue_number} · ${htmlEscape(issue.publish_date)}</p>
  ${tocHtml}
  <hr class="section-divider" />
  ${sectionsHtml}
  ${navHtml}
  `;

  const url = new URL(request.url);
  return htmlResponse(
    layoutHtml({
      title: `${issue.title} — agentscape.net`,
      description: `Issue ${issue.issue_number} of agentscape.net.`,
      body,
      canonical: `${url.origin}/issues/${issue.issue_number}`,
    })
  );
}
