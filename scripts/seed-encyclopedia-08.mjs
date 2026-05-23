// One-shot seed: encyclopedia entry #08 (memory).
// Parses the canonical 9-section draft, computes content_hash, emits
// a SQL migration applied via `wrangler d1 execute --file`. Idempotent
// at the (slug, content_hash) UNIQUE constraint — re-running is a no-op.

import { readFileSync, writeFileSync } from "node:fs";
import { createHash, randomUUID } from "node:crypto";

const DRAFT_BASE =
  "/mnt/storage/prmichaelsen/projects/reflection/agent/runtime/tracks/agentscape-drafter/state/drafts/encyclopedia";

const ENTRIES = [
  {
    slug: "memory",
    title: "memory",
    entry_number: 8,
    draft: `${DRAFT_BASE}/08-memory.md`,
    related: ["context-window", "rag", "retrieval", "embedding", "agent"],
  },
];

function parse9Section(path) {
  const raw = readFileSync(path, "utf8");
  const lines = raw.split("\n");
  const sections = {};
  let i = 0;
  const citationsIdx = lines.findIndex((l) => /^## Citations\s*$/.test(l));
  let citationsBlock = "";
  if (citationsIdx >= 0) {
    const end = lines.findIndex(
      (l, k) => k > citationsIdx && /^---\s*$/.test(l)
    );
    citationsBlock =
      "\n\n" +
      lines
        .slice(citationsIdx + 1, end > 0 ? end : lines.length)
        .join("\n")
        .trim();
  }

  while (i < lines.length) {
    const m = lines[i].match(/^##\s+(\d+)\.\s+(.+?)\s*$/);
    if (!m) {
      i++;
      continue;
    }
    const sectionNum = parseInt(m[1], 10);
    const body = [];
    i++;
    while (i < lines.length) {
      if (/^##\s/.test(lines[i])) break;
      if (/^---\s*$/.test(lines[i])) break;
      body.push(lines[i]);
      i++;
    }
    const text = body.join("\n").trim();
    sections[sectionNum] = text + citationsBlock;
  }

  return {
    definition: sections[1] || "",
    first_appearance: sections[2] || "",
    etymology: sections[3] || null,
    current_meaning: sections[4] || "",
    divergent_meanings: sections[5] || null,
    supersession_note:
      sections[9] && !/^No supersession\.?/i.test(sections[9])
        ? sections[9]
        : null,
  };
}

function sha256Short(input) {
  return createHash("sha256").update(input).digest("hex").slice(0, 16);
}

function sqlEscape(v) {
  if (v === null || v === undefined) return "NULL";
  return "'" + String(v).replace(/'/g, "''") + "'";
}

const now = new Date().toISOString();
const stmts = [];

for (const e of ENTRIES) {
  const sections = parse9Section(e.draft);
  const canonical = JSON.stringify({
    slug: e.slug,
    title: e.title,
    ...sections,
  });
  const content_hash = sha256Short(canonical);
  const id = randomUUID();

  stmts.push(
    `INSERT OR IGNORE INTO entries (
      id, slug, title, content_hash,
      definition, first_appearance, etymology,
      current_meaning, divergent_meanings,
      supersession_note, superseded_by_id, version,
      state, published_at
    ) VALUES (
      ${sqlEscape(id)}, ${sqlEscape(e.slug)}, ${sqlEscape(e.title)}, ${sqlEscape(content_hash)},
      ${sqlEscape(sections.definition)}, ${sqlEscape(sections.first_appearance)}, ${sqlEscape(sections.etymology)},
      ${sqlEscape(sections.current_meaning)}, ${sqlEscape(sections.divergent_meanings)},
      ${sqlEscape(sections.supersession_note)}, NULL, 1,
      'active', ${sqlEscape(now)}
    );`
  );

  for (const target of e.related) {
    stmts.push(
      `INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at)
       VALUES (${sqlEscape(randomUUID())}, ${sqlEscape(e.slug)}, ${sqlEscape(target)}, ${sqlEscape(now)});`
    );
  }

  console.log(`SLUG ${e.slug} content_hash=${content_hash} id=${id}`);
}

writeFileSync("/tmp/seed-enc-08.sql", stmts.join("\n\n") + "\n");
console.log(`Wrote ${stmts.length} SQL stmts → /tmp/seed-enc-08.sql`);
