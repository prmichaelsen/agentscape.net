// GET /api/v1/c/ — JSON index of all active entries.

import { jsonResponse } from "../../../_lib.js";

export async function onRequestGet(context) {
  const { env } = context;
  const { results } = await env.DB.prepare(
    `SELECT id, slug, title, content_hash, version, state, published_at
       FROM entries
      WHERE state = 'active'
        AND superseded_by_id IS NULL
        AND deleted_at IS NULL
      ORDER BY slug ASC`
  ).all();
  return jsonResponse({ version: "v1", entries: results });
}
