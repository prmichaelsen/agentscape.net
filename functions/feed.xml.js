// GET /feed.xml — RSS 2.0 feed of published issues, newest first.
// Implements deliverable 1 of agentscape-worker followup
// 2026-05-26T21-19-00Z-chartered-surface-gaps.md and the chartered
// /feed.xml surface in
// agent/runtime/tracks/agentscape-worker/wake.md (publish surface).
//
// Canonical item link: /issues/<issue_number>. GUIDs include the
// publish_date so amendments to a re-stamped issue surface as a new
// item (consistent with the encyclopedia feed pattern).

import { htmlEscape } from "./_lib.js";

export async function onRequestGet(context) {
  const { env, request } = context;
  const url = new URL(request.url);
  const origin = url.origin;

  const { results } = await env.DB.prepare(
    `SELECT issue_number, slug, title, publish_date, masthead_state
       FROM issues
      WHERE deleted_at IS NULL
      ORDER BY issue_number DESC
      LIMIT 100`
  ).all();

  const lastBuildDate = results.length
    ? rfc822(results[0].publish_date)
    : new Date().toUTCString();

  const items = results
    .map((it) => {
      const link = `${origin}/issues/${it.issue_number}`;
      const guid = `${origin}/issues/${it.issue_number}~${it.publish_date}`;
      const desc =
        `Issue ${it.issue_number} — ${it.publish_date}. Masthead: ` +
        `${it.masthead_state}.`;
      return `    <item>
      <title>${htmlEscape(it.title)}</title>
      <link>${link}</link>
      <guid isPermaLink="false">${guid}</guid>
      <pubDate>${rfc822(it.publish_date)}</pubDate>
      <description>${htmlEscape(desc)}</description>
    </item>`;
    })
    .join("\n");

  const xml = `<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
  <channel>
    <title>agentscape.net</title>
    <link>${origin}/</link>
    <atom:link href="${origin}/feed.xml" rel="self" type="application/rss+xml" />
    <description>agentscape issues — periodical, agent-readable.</description>
    <language>en</language>
    <lastBuildDate>${lastBuildDate}</lastBuildDate>
${items}
  </channel>
</rss>`;

  return new Response(xml, {
    headers: {
      "content-type": "application/rss+xml; charset=utf-8",
      "cache-control": "public, max-age=300",
    },
  });
}

function rfc822(iso) {
  try {
    return new Date(iso).toUTCString();
  } catch {
    return new Date().toUTCString();
  }
}
