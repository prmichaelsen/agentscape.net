// GET /c/ — encyclopedia index page; lists all state='active' entries
// alphabetically by slug. Mirrors the chrome of /issues/<n> per
// design.agentscape-encyclopedia-charter~fdd18e57 (C5).

import { htmlEscape, layoutHtml, htmlResponse } from "../_lib.js";

export async function onRequestGet(context) {
  const { env, request } = context;

  const { results: entries } = await env.DB.prepare(
    `SELECT slug, title, definition, published_at, version
       FROM entries
      WHERE state = 'active'
        AND superseded_by_id IS NULL
        AND deleted_at IS NULL
      ORDER BY slug ASC`
  ).all();

  const listHtml = entries.length
    ? `<ul>${entries
        .map(
          (e) =>
            `<li><a href="/c/${htmlEscape(e.slug)}"><strong>${htmlEscape(e.title)}</strong></a> — ${htmlEscape(
              (e.definition || "").slice(0, 180)
            )}${(e.definition || "").length > 180 ? "…" : ""}</li>`
        )
        .join("")}</ul>`
    : "<p><em>No entries published yet.</em></p>";

  const body = `
    <h1>Encyclopedia</h1>
    <p class="frame">Standing definitions for terms agentscape uses. Each
    entry is a single canonical resolution; amendments are linked from
    the entry itself.</p>
    ${listHtml}
    <nav class="page-nav">
      <a href="/">← Home</a> ·
      <a href="/issues/">All issues</a> ·
      <a href="/feed/c.xml">RSS</a>
    </nav>
  `;

  const url = new URL(request.url);
  return htmlResponse(
    layoutHtml({
      title: "Encyclopedia — agentscape.net",
      description: "Standing definitions for terms agentscape uses.",
      canonical: `${url.origin}/c/`,
      body,
    })
  );
}
