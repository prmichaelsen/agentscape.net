// GET /api/v1/sections/<id> — JSON projection of a single section by row id.

import { jsonResponse } from "../../../_lib.js";

export async function onRequestGet(context) {
  const { params, env } = context;
  const id = params.id;

  const s = await env.DB.prepare(
    `SELECT
        s.id, s.section_id, s.issue_id, s.title, s.frame, s.structural_argument,
        s.version, s.published_at,
        spine.slug AS spine_tag, spine.label AS spine_label,
        cat.slug   AS category_tag, cat.label AS category_label,
        lf.id AS longform_id, lf.slug AS longform_slug, lf.body AS body
      FROM sections s
      JOIN spine_tags    spine ON s.spine_tag_id    = spine.id
      JOIN category_tags cat   ON s.category_tag_id = cat.id
      LEFT JOIN longform lf    ON s.longform_id     = lf.id
      WHERE s.id = ?
        AND s.deleted_at IS NULL
        AND s.superseded_by_id IS NULL
      LIMIT 1`
  )
    .bind(id)
    .first();

  if (!s) return jsonResponse({ error: "section not found" }, { status: 404 });

  const { results: citations } = await env.DB.prepare(
    `SELECT id, label, url, archive_url, kind, verified_at
       FROM citations WHERE section_id = ? AND deleted_at IS NULL ORDER BY id`
  )
    .bind(s.id)
    .all();

  return jsonResponse({
    version: "v1",
    section: {
      id: s.id,
      section_id: s.section_id,
      issue_id: s.issue_id,
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
      citations,
    },
  });
}
