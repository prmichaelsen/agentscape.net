-- agentscape D1 migration 0003: encyclopedia schema
-- Implements design.agentscape-encyclopedia-charter~fdd18e57 (C2, C3, C5, C6).
-- Forward-only, soft-delete via deleted_at + withdrawal_reason (matches 0001
-- conventions). Content-hash versioning matches the agentprinciples pattern.
--
-- Tables added:
--   entries            — canonical entry rows (one row per content-hash version)
--   entry_amendments   — amendment audit trail (trigger source + editor + diff)
--   entry_citations    — cross-link from issue sections / longforms TO entries
--   entry_related      — bidirectional entry<->entry related-entries graph

PRAGMA foreign_keys = ON;

-- ---------------------------------------------------------------------------
-- entries — canonical entry, one row per content-hash version
-- ---------------------------------------------------------------------------
-- slug is the URL key (e.g. 'tool', 'context-window'); content_hash advances
-- on every amendment; (slug, content_hash) is unique. The latest unversioned
-- view of an entry is the row where superseded_by_id IS NULL for that slug.
CREATE TABLE entries (
  id                  TEXT    PRIMARY KEY,
  slug                TEXT    NOT NULL,
  title               TEXT    NOT NULL,
  content_hash        TEXT    NOT NULL,
  -- 9-section canonical shape (C2). Required sections are NOT NULL;
  -- optional sections allow NULL.
  definition          TEXT    NOT NULL,
  first_appearance    TEXT    NOT NULL,
  etymology           TEXT,
  current_meaning     TEXT    NOT NULL,
  divergent_meanings  TEXT,
  -- related_entries, citation_history, amendment_history are derived
  -- (entry_related, entry_citations, entry_amendments) — not stored
  -- inline on entries.
  supersession_note   TEXT,
  superseded_by_id    TEXT             REFERENCES entries(id) ON DELETE RESTRICT,
  version             INTEGER NOT NULL DEFAULT 1,
  state               TEXT    NOT NULL DEFAULT 'active',  -- draft|active|amended|superseded|deprecated
  published_at        TEXT    NOT NULL,
  deleted_at          TEXT,
  withdrawal_reason   TEXT,
  created_at          TEXT    NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')),
  UNIQUE (slug, content_hash),
  UNIQUE (slug, version),
  CHECK (state IN ('draft','active','amended','superseded','deprecated')),
  CHECK (
    (deleted_at IS NULL AND withdrawal_reason IS NULL)
    OR
    (deleted_at IS NOT NULL AND withdrawal_reason IN (
      'legal-takedown', 'editorial-retraction',
      'author-request', 'superseded-only'
    ))
  )
);

-- ---------------------------------------------------------------------------
-- entry_amendments — audit trail, one row per amendment event
-- ---------------------------------------------------------------------------
-- trigger_type per C3: issue-sourced | primary-source | correction.
-- source_issue_id is populated only for issue-sourced amendments.
-- previous_entry_id points at the entries row this amendment replaces;
-- new_entry_id points at the entries row that resulted.
CREATE TABLE entry_amendments (
  id                 TEXT    PRIMARY KEY,
  slug               TEXT    NOT NULL,
  previous_entry_id  TEXT    NOT NULL REFERENCES entries(id) ON DELETE RESTRICT,
  new_entry_id       TEXT    NOT NULL REFERENCES entries(id) ON DELETE RESTRICT,
  trigger_type       TEXT    NOT NULL,
  source_issue_id    TEXT             REFERENCES issues(id)  ON DELETE RESTRICT,
  source_section_id  TEXT             REFERENCES sections(id) ON DELETE RESTRICT,
  summary            TEXT    NOT NULL,
  editor_id          TEXT    NOT NULL,
  approved_at        TEXT    NOT NULL,
  created_at         TEXT    NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')),
  CHECK (trigger_type IN ('issue-sourced', 'primary-source', 'correction')),
  CHECK (
    (trigger_type = 'issue-sourced' AND source_issue_id IS NOT NULL)
    OR
    (trigger_type IN ('primary-source', 'correction') AND source_issue_id IS NULL)
  )
);

-- ---------------------------------------------------------------------------
-- entry_citations — issue OR longform cites an entry (C6 auto-logged)
-- ---------------------------------------------------------------------------
-- Polymorphic source via nullable FKs + CHECK (exactly one of
-- source_section_id / source_longform_id set). entry_id points at the
-- specific content-hash version cited (citation stability per C4).
CREATE TABLE entry_citations (
  id                  TEXT PRIMARY KEY,
  entry_id            TEXT NOT NULL REFERENCES entries(id)  ON DELETE RESTRICT,
  entry_slug          TEXT NOT NULL,                              -- denorm for fast index page
  source_section_id   TEXT          REFERENCES sections(id) ON DELETE RESTRICT,
  source_longform_id  TEXT          REFERENCES longform(id) ON DELETE RESTRICT,
  amendment_bearing   INTEGER NOT NULL DEFAULT 0,                 -- editor flag (C6)
  cited_at            TEXT NOT NULL,
  created_at          TEXT NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')),
  CHECK (
    (source_section_id IS NOT NULL AND source_longform_id IS NULL)
    OR
    (source_section_id IS NULL AND source_longform_id IS NOT NULL)
  )
);

-- ---------------------------------------------------------------------------
-- entry_related — bidirectional entry<->entry related-entries graph (C6)
-- ---------------------------------------------------------------------------
-- Bidirectional invariant enforced at write-time by the editor pipeline,
-- not by the schema (SQLite can't express "for every (A,B) there is a
-- (B,A)" as a constraint). The schema models the edges; the editor
-- guarantees the pairing.
CREATE TABLE entry_related (
  id           TEXT PRIMARY KEY,
  from_slug    TEXT NOT NULL,
  to_slug      TEXT NOT NULL,
  approved_at  TEXT NOT NULL,
  created_at   TEXT NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')),
  UNIQUE (from_slug, to_slug),
  CHECK (from_slug <> to_slug)
);

-- ---------------------------------------------------------------------------
-- Indexes
-- ---------------------------------------------------------------------------
CREATE INDEX idx_entries_slug_latest
  ON entries(slug)
  WHERE superseded_by_id IS NULL AND deleted_at IS NULL;

CREATE INDEX idx_entries_published_at ON entries(published_at);
CREATE INDEX idx_entries_state         ON entries(state);

CREATE INDEX idx_entry_amendments_slug         ON entry_amendments(slug);
CREATE INDEX idx_entry_amendments_approved_at  ON entry_amendments(approved_at);

CREATE INDEX idx_entry_citations_entry_id   ON entry_citations(entry_id);
CREATE INDEX idx_entry_citations_entry_slug ON entry_citations(entry_slug);
CREATE INDEX idx_entry_citations_section
  ON entry_citations(source_section_id)
  WHERE source_section_id IS NOT NULL;
CREATE INDEX idx_entry_citations_longform
  ON entry_citations(source_longform_id)
  WHERE source_longform_id IS NOT NULL;

CREATE INDEX idx_entry_related_from ON entry_related(from_slug);
CREATE INDEX idx_entry_related_to   ON entry_related(to_slug);

-- ---------------------------------------------------------------------------
-- Bookkeeping
-- ---------------------------------------------------------------------------
INSERT INTO schema_migrations (version, name, checksum)
VALUES (3, '0003-encyclopedia-schema', 'sha256-deferred');
