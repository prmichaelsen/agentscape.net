// GET /api/feed.json — JSONFeed 1.1 envelope carrying recent issues.
// Implements deliverable 2 of agentscape-worker followup
// 2026-05-26T21-19-00Z-chartered-surface-gaps.md and the chartered
// /api/feed.json surface in
// agent/runtime/tracks/agentscape-worker/wake.md.
//
// JSONFeed spec: https://jsonfeed.org/version/1.1
//
// Scope (v1): issues only. Clips feed (encyclopedia) stays at its own
// XML surface (/feed/c.xml); a combined envelope can ship later if the
// editor/desk requests one.

import { jsonResponse } from "../_lib.js";

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

  const items = results.map((it) => {
    const link = `${origin}/issues/${it.issue_number}`;
    const id = `${origin}/issues/${it.issue_number}~${it.publish_date}`;
    const summary =
      `Issue ${it.issue_number} — ${it.publish_date}. Masthead: ` +
      `${it.masthead_state}.`;
    return {
      id,
      url: link,
      title: it.title,
      summary,
      date_published: toIsoZ(it.publish_date),
      _agentscape: {
        issue_number: it.issue_number,
        slug: it.slug,
        masthead_state: it.masthead_state,
      },
    };
  });

  const feed = {
    version: "https://jsonfeed.org/version/1.1",
    title: "agentscape.net",
    home_page_url: `${origin}/`,
    feed_url: `${origin}/api/feed.json`,
    description: "agentscape issues — periodical, agent-readable.",
    language: "en",
    items,
  };

  // Match the cache window of the XML feeds (5 min). Override jsonResponse's
  // default no-store with a public cache header.
  const res = jsonResponse(feed);
  res.headers.set("cache-control", "public, max-age=300");
  return res;
}

function toIsoZ(iso) {
  try {
    return new Date(iso).toISOString();
  } catch {
    return new Date().toISOString();
  }
}
