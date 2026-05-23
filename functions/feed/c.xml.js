// GET /feed/c.xml — RSS feed of encyclopedia entries (new + amended both
// surface) ordered by published_at desc. Per
// design.agentscape-encyclopedia-charter~fdd18e57 C5.

import { htmlEscape } from "../_lib.js";

export async function onRequestGet(context) {
  const { env, request } = context;
  const url = new URL(request.url);
  const origin = url.origin;

  const { results } = await env.DB.prepare(
    `SELECT slug, title, content_hash, version, state, definition, published_at
       FROM entries
      WHERE deleted_at IS NULL
        AND state IN ('active','amended')
      ORDER BY published_at DESC
      LIMIT 100`
  ).all();

  const items = results
    .map((e) => {
      const link = `${origin}/c/${e.slug}`;
      const guid = `${origin}/c/${e.slug}~${e.content_hash}`;
      const titleSuffix = e.version > 1 ? ` (v${e.version})` : "";
      const desc = (e.definition || "").slice(0, 500);
      return `    <item>
      <title>${htmlEscape(e.title)}${titleSuffix}</title>
      <link>${link}</link>
      <guid isPermaLink="false">${guid}</guid>
      <pubDate>${rfc822(e.published_at)}</pubDate>
      <description>${htmlEscape(desc)}</description>
    </item>`;
    })
    .join("\n");

  const xml = `<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0">
  <channel>
    <title>agentscape.net — encyclopedia</title>
    <link>${origin}/c/</link>
    <description>Standing definitions for terms agentscape uses.</description>
    <language>en</language>
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
  // ISO 8601 → RFC 822 date string for RSS.
  try {
    return new Date(iso).toUTCString();
  } catch {
    return new Date().toUTCString();
  }
}
