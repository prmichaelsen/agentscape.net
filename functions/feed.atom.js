// GET /feed.atom — Atom 1.0 feed of published issues, newest first.
// Companion to /feed.xml (RSS 2.0); implements deliverable 1 of
// agentscape-worker followup
// 2026-05-26T21-19-00Z-chartered-surface-gaps.md.

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

  const updated = results.length
    ? isoZ(results[0].publish_date)
    : isoZ(new Date().toISOString());

  const entries = results
    .map((it) => {
      const link = `${origin}/issues/${it.issue_number}`;
      const id = `${origin}/issues/${it.issue_number}~${it.publish_date}`;
      const summary =
        `Issue ${it.issue_number} — ${it.publish_date}. Masthead: ` +
        `${it.masthead_state}.`;
      return `  <entry>
    <title>${htmlEscape(it.title)}</title>
    <link href="${link}" />
    <id>${id}</id>
    <updated>${isoZ(it.publish_date)}</updated>
    <summary>${htmlEscape(summary)}</summary>
  </entry>`;
    })
    .join("\n");

  const xml = `<?xml version="1.0" encoding="UTF-8"?>
<feed xmlns="http://www.w3.org/2005/Atom">
  <title>agentscape.net</title>
  <link href="${origin}/" />
  <link href="${origin}/feed.atom" rel="self" type="application/atom+xml" />
  <id>${origin}/</id>
  <updated>${updated}</updated>
  <subtitle>agentscape issues — periodical, agent-readable.</subtitle>
${entries}
</feed>`;

  return new Response(xml, {
    headers: {
      "content-type": "application/atom+xml; charset=utf-8",
      "cache-control": "public, max-age=300",
    },
  });
}

function isoZ(iso) {
  try {
    return new Date(iso).toISOString();
  } catch {
    return new Date().toISOString();
  }
}
