// GET /api/v1/issues/ — list of all published issues (newest first).

import { jsonResponse } from "../../../_lib.js";

export async function onRequestGet(context) {
  const { env } = context;
  const { results } = await env.DB.prepare(
    `SELECT id, issue_number, slug, title, publish_date, masthead_state
       FROM issues
      WHERE deleted_at IS NULL
      ORDER BY issue_number DESC`
  ).all();
  return jsonResponse({ version: "v1", issues: results });
}
