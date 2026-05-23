// GET /sections/<section-row-id> — per-section HTML deep-link.
// section-row-id is the sections.id (e.g. "sec-issue-1-C1"). Reuses the
// same chrome as the issue page; renders one section as its own page.

import {
  htmlEscape,
  renderMarkdown,
  layoutHtml,
  htmlResponse,
} from "../_lib.js";

export async function onRequestGet(context) {
  const { params, env, request } = context;
  const id = params.id;

  const s = await env.DB.prepare(
    `SELECT
        s.id, s.section_id, s.issue_id, s.title, s.frame, s.structural_argument,
        spine.label AS spine_label,
        cat.label   AS cat_label,
        lf.body     AS body,
        i.issue_number, i.title AS issue_title, i.slug AS issue_slug
      FROM sections s
      JOIN spine_tags    spine ON s.spine_tag_id    = spine.id
      JOIN category_tags cat   ON s.category_tag_id = cat.id
      LEFT JOIN longform lf    ON s.longform_id     = lf.id
      JOIN issues i           ON s.issue_id        = i.id
      WHERE s.id = ?
        AND s.deleted_at IS NULL
        AND s.superseded_by_id IS NULL
      LIMIT 1`
  )
    .bind(id)
    .first();

  if (!s) {
    return htmlResponse(
      layoutHtml({
        title: "Section not found — agentscape.net",
        description: "No such section.",
        body: "<h1>Section not found</h1>",
      }),
      { status: 404 }
    );
  }

  const { results: cites } = await env.DB.prepare(
    `SELECT label, url, kind FROM citations
       WHERE section_id = ? AND deleted_at IS NULL ORDER BY id`
  )
    .bind(s.id)
    .all();

  // Prev/next section within the parent issue (publication order = section_id ASC).
  const prevSection = await env.DB.prepare(
    `SELECT id, title FROM sections
       WHERE issue_id = ? AND deleted_at IS NULL AND superseded_by_id IS NULL
         AND section_id < ?
       ORDER BY section_id DESC LIMIT 1`
  )
    .bind(s.issue_id, s.section_id)
    .first();
  const nextSection = await env.DB.prepare(
    `SELECT id, title FROM sections
       WHERE issue_id = ? AND deleted_at IS NULL AND superseded_by_id IS NULL
         AND section_id > ?
       ORDER BY section_id ASC LIMIT 1`
  )
    .bind(s.issue_id, s.section_id)
    .first();

  const navParts = [];
  if (prevSection) {
    navParts.push(`<a href="/sections/${htmlEscape(prevSection.id)}">← Previous section</a>`);
  }
  navParts.push(`<a href="/issues/${s.issue_number}">Read full issue</a>`);
  if (nextSection) {
    navParts.push(`<a href="/sections/${htmlEscape(nextSection.id)}">Next section →</a>`);
  }
  const navHtml = `<nav class="page-nav">${navParts.join(" · ")}</nav>`;

  const body = s.body ? renderMarkdown(s.body) : "";
  const citesHtml = cites.length
    ? `<div class="sources"><h3>Sources</h3><ul>${cites
        .map(
          (c) =>
            `<li><a href="${htmlEscape(c.url)}">${htmlEscape(c.label)}</a> · <span>${htmlEscape(c.kind)}</span></li>`
        )
        .join("")}</ul></div>`
    : "";

  const url = new URL(request.url);
  return htmlResponse(
    layoutHtml({
      title: `${s.title} — agentscape.net`,
      description: s.frame || s.title,
      canonical: `${url.origin}/sections/${s.id}`,
      body: `
        <p class="frame"><a href="/issues/${s.issue_number}">${htmlEscape(s.issue_title)}</a> · section ${htmlEscape(s.section_id)}</p>
        <div class="spine-anchor">spine · ${htmlEscape(s.spine_label)}</div>
        <h1>${htmlEscape(s.title)}</h1>
        <p class="frame">${htmlEscape(s.frame)}</p>
        ${body}
        ${citesHtml}
        ${navHtml}
      `,
    })
  );
}
