// GET /api/v1/issues/<n> — JSON projection of full issue from D1.
// Versioned per SPP-5/agent-consumer-surface spec. Caches at the edge for
// 60s.

import { jsonResponse } from "../../../_lib.js";

export async function onRequestGet(context) {
  const { params, env } = context;
  const n = parseInt(params.n, 10);
  if (!Number.isInteger(n) || n <= 0) {
    return jsonResponse({ error: "invalid issue number" }, { status: 400 });
  }

  const issue = await env.DB.prepare(
    "SELECT id, issue_number, slug, title, publish_date, masthead_state, archive_flag, created_at " +
      "FROM issues WHERE issue_number = ? AND deleted_at IS NULL"
  )
    .bind(n)
    .first();

  if (!issue) {
    return jsonResponse({ error: "issue not found" }, { status: 404 });
  }

  const { results: sections } = await env.DB.prepare(
    `SELECT
        s.id, s.section_id, s.title, s.frame, s.structural_argument,
        s.published_at, s.version,
        spine.slug AS spine_tag, spine.label AS spine_label,
        cat.slug   AS category_tag, cat.label AS category_label,
        lf.id AS longform_id, lf.slug AS longform_slug, lf.body AS body
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

  const sectionIds = sections.map((s) => s.id);
  let citations = [];
  if (sectionIds.length) {
    const placeholders = sectionIds.map(() => "?").join(",");
    const stmt = env.DB.prepare(
      `SELECT id, section_id, label, url, archive_url, kind, verified_at
         FROM citations
        WHERE section_id IN (${placeholders})
          AND deleted_at IS NULL
        ORDER BY id`
    ).bind(...sectionIds);
    const cr = await stmt.all();
    citations = cr.results;
  }

  return jsonResponse({
    version: "v1",
    issue: {
      id: issue.id,
      issue_number: issue.issue_number,
      slug: issue.slug,
      title: issue.title,
      publish_date: issue.publish_date,
      masthead_state: issue.masthead_state,
      archive_flag: !!issue.archive_flag,
      created_at: issue.created_at,
    },
    sections: sections.map((s) => ({
      id: s.id,
      section_id: s.section_id,
      title: s.title,
      frame: s.frame,
      structural_argument: s.structural_argument,
      spine_tag: s.spine_tag,
      spine_label: s.spine_label,
      category_tag: s.category_tag,
      category_label: s.category_label,
      version: s.version,
      published_at: s.published_at,
      longform: s.longform_id
        ? { id: s.longform_id, slug: s.longform_slug, body: s.body }
        : null,
      citations: citations
        .filter((c) => c.section_id === s.id)
        .map((c) => ({
          id: c.id,
          label: c.label,
          url: c.url,
          archive_url: c.archive_url,
          kind: c.kind,
          verified_at: c.verified_at,
        })),
    })),
  });
}
