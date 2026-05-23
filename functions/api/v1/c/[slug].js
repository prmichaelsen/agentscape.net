// GET /api/v1/c/<slug>           — JSON projection of current entry
// GET /api/v1/c/<slug>~<hash>    — JSON projection of historical version
//
// Mirrors /api/v1/issues/<n> shape per the agent-consumer-surface spec.

import { jsonResponse } from "../../../_lib.js";

export async function onRequestGet(context) {
  const { params, env } = context;
  const raw = params.slug || "";

  let slug = raw;
  let hash = null;
  const tildeIdx = raw.indexOf("~");
  if (tildeIdx >= 0) {
    slug = raw.slice(0, tildeIdx);
    hash = raw.slice(tildeIdx + 1);
  }

  let entry;
  if (hash) {
    entry = await env.DB.prepare(
      `SELECT * FROM entries
         WHERE slug = ? AND content_hash = ? AND deleted_at IS NULL
         LIMIT 1`
    )
      .bind(slug, hash)
      .first();
  } else {
    entry = await env.DB.prepare(
      `SELECT * FROM entries
         WHERE slug = ?
           AND superseded_by_id IS NULL
           AND deleted_at IS NULL
         LIMIT 1`
    )
      .bind(slug)
      .first();
  }

  if (!entry) {
    return jsonResponse({ error: "entry not found" }, { status: 404 });
  }

  const { results: related } = await env.DB.prepare(
    `SELECT to_slug AS slug FROM entry_related WHERE from_slug = ? ORDER BY to_slug`
  )
    .bind(slug)
    .all();

  const { results: citations } = await env.DB.prepare(
    `SELECT id, entry_id, source_section_id, source_longform_id,
            amendment_bearing, cited_at
       FROM entry_citations
      WHERE entry_slug = ?
      ORDER BY cited_at DESC`
  )
    .bind(slug)
    .all();

  const { results: amendments } = await env.DB.prepare(
    `SELECT id, trigger_type, source_issue_id, source_section_id,
            previous_entry_id, new_entry_id, summary, editor_id, approved_at
       FROM entry_amendments
      WHERE slug = ?
      ORDER BY approved_at DESC`
  )
    .bind(slug)
    .all();

  return jsonResponse({
    version: "v1",
    entry: {
      id: entry.id,
      slug: entry.slug,
      title: entry.title,
      content_hash: entry.content_hash,
      version: entry.version,
      state: entry.state,
      published_at: entry.published_at,
      created_at: entry.created_at,
      definition: entry.definition,
      first_appearance: entry.first_appearance,
      etymology: entry.etymology,
      current_meaning: entry.current_meaning,
      divergent_meanings: entry.divergent_meanings,
      supersession_note: entry.supersession_note,
      superseded_by_id: entry.superseded_by_id,
    },
    related: related.map((r) => r.slug),
    citations: citations.map((c) => ({
      id: c.id,
      entry_id: c.entry_id,
      source_section_id: c.source_section_id,
      source_longform_id: c.source_longform_id,
      amendment_bearing: !!c.amendment_bearing,
      cited_at: c.cited_at,
    })),
    amendments: amendments.map((a) => ({
      id: a.id,
      trigger_type: a.trigger_type,
      source_issue_id: a.source_issue_id,
      source_section_id: a.source_section_id,
      previous_entry_id: a.previous_entry_id,
      new_entry_id: a.new_entry_id,
      summary: a.summary,
      editor_id: a.editor_id,
      approved_at: a.approved_at,
    })),
  });
}
