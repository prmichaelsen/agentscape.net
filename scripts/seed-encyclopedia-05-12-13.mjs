// One-shot seed: encyclopedia entries #05 (skill), #12 (eval), #13 (benchmark).
// Adapted from seed-encyclopedia-14-17.mjs (same parser, same SQL shape).
import { readFileSync, writeFileSync } from "node:fs";
import { createHash, randomUUID } from "node:crypto";

const DRAFT_BASE =
  "/mnt/storage/prmichaelsen/projects/reflection/agent/runtime/tracks/agentscape-drafter/state/drafts/encyclopedia";

const ENTRIES = [
  { slug: "skill",     title: "Skill",     entry_number: 5,  draft: `${DRAFT_BASE}/05-skill.md`,     related: ["agent","tool","mcp","permission"] },
  { slug: "eval",      title: "Eval",      entry_number: 12, draft: `${DRAFT_BASE}/12-eval.md`,      related: ["benchmark","model","agent","prompt"] },
  { slug: "benchmark", title: "Benchmark", entry_number: 13, draft: `${DRAFT_BASE}/13-benchmark.md`, related: ["eval","model","leaderboard","dataset"] },
];

function parse9Section(path) {
  const raw = readFileSync(path, "utf8");
  const lines = raw.split("\n");
  const sections = {};
  let i = 0;
  const citationsIdx = lines.findIndex((l) => /^## Citations\s*$/.test(l));
  let citationsBlock = "";
  if (citationsIdx >= 0) {
    const end = lines.findIndex((l, k) => k > citationsIdx && /^---\s*$/.test(l));
    citationsBlock = "\n\n" + lines.slice(citationsIdx + 1, end > 0 ? end : lines.length).join("\n").trim();
  }
  while (i < lines.length) {
    const m = lines[i].match(/^##\s+(\d+)\.\s+(.+?)\s*$/);
    if (!m) { i++; continue; }
    const sectionNum = parseInt(m[1], 10);
    const body = [];
    i++;
    while (i < lines.length) {
      if (/^##\s/.test(lines[i])) break;
      if (/^---\s*$/.test(lines[i])) break;
      body.push(lines[i]);
      i++;
    }
    sections[sectionNum] = body.join("\n").trim() + citationsBlock;
  }
  return {
    definition: sections[1] || "",
    first_appearance: sections[2] || "",
    etymology: sections[3] || null,
    current_meaning: sections[4] || "",
    divergent_meanings: sections[5] || null,
    supersession_note: sections[9] && !/^Not applicable\.?/i.test(sections[9]) ? sections[9] : null,
  };
}

const sha256Short = (s) => createHash("sha256").update(s).digest("hex").slice(0,16);
const sqlEscape = (v) => (v===null||v===undefined) ? "NULL" : "'" + String(v).replace(/'/g, "''") + "'";
const now = new Date().toISOString();
const stmts = [];

for (const e of ENTRIES) {
  const sections = parse9Section(e.draft);
  if (!sections.definition || !sections.first_appearance || !sections.current_meaning) {
    console.error(`SKIP ${e.slug}: missing required section`);
    continue;
  }
  const canonical = JSON.stringify({ slug:e.slug, title:e.title, ...sections });
  const content_hash = sha256Short(canonical);
  const id = randomUUID();
  stmts.push(`INSERT OR IGNORE INTO entries (id, slug, title, content_hash, definition, first_appearance, etymology, current_meaning, divergent_meanings, supersession_note, superseded_by_id, version, state, published_at) VALUES (${sqlEscape(id)}, ${sqlEscape(e.slug)}, ${sqlEscape(e.title)}, ${sqlEscape(content_hash)}, ${sqlEscape(sections.definition)}, ${sqlEscape(sections.first_appearance)}, ${sqlEscape(sections.etymology)}, ${sqlEscape(sections.current_meaning)}, ${sqlEscape(sections.divergent_meanings)}, ${sqlEscape(sections.supersession_note)}, NULL, 1, 'active', ${sqlEscape(now)});`);
  for (const target of e.related) {
    stmts.push(`INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at) VALUES (${sqlEscape(randomUUID())}, ${sqlEscape(e.slug)}, ${sqlEscape(target)}, ${sqlEscape(now)});`);
  }
  console.log(`SLUG ${e.slug} content_hash=${content_hash} id=${id}`);
}

writeFileSync("/tmp/seed-enc-05-12-13.sql", stmts.join("\n\n") + "\n");
console.log(`Wrote ${stmts.length} SQL stmts → /tmp/seed-enc-05-12-13.sql`);
