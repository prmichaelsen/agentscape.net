-- agentscape D1 initial schema
-- Implements spec.agentscape-d1-schema~8bdda219 (FR1..FR15).
-- Forward-only per INV-5 / FR12; soft-delete only on archive-bearing
-- tables per FR13; supersession per FR5.

PRAGMA foreign_keys = ON;

-- ---------------------------------------------------------------------------
-- FR12 — schema_migrations bookkeeping
-- ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS schema_migrations (
  version    INTEGER PRIMARY KEY,
  name       TEXT    NOT NULL,
  applied_at TEXT    NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')),
  checksum   TEXT    NOT NULL
);

-- ---------------------------------------------------------------------------
-- FR9 — spine_tags + category_tags (controlled vocabularies)
-- ---------------------------------------------------------------------------
CREATE TABLE spine_tags (
  id          TEXT PRIMARY KEY,
  slug        TEXT NOT NULL UNIQUE,
  label       TEXT NOT NULL,
  description TEXT NOT NULL,
  created_at  TEXT NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now'))
);

CREATE TABLE category_tags (
  id          TEXT PRIMARY KEY,
  slug        TEXT NOT NULL UNIQUE,
  label       TEXT NOT NULL,
  description TEXT NOT NULL,
  created_at  TEXT NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now'))
);

-- ---------------------------------------------------------------------------
-- FR2 — issues
-- ---------------------------------------------------------------------------
CREATE TABLE issues (
  id                 TEXT    PRIMARY KEY,
  issue_number       INTEGER NOT NULL UNIQUE,
  slug               TEXT    NOT NULL UNIQUE,
  title              TEXT    NOT NULL,
  publish_date       TEXT    NOT NULL,
  masthead_state     TEXT    NOT NULL,
  archive_flag       INTEGER NOT NULL DEFAULT 0,
  deleted_at         TEXT,
  withdrawal_reason  TEXT,
  created_at         TEXT    NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')),
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
-- FR4 — longform (referenced by sections.longform_id, so created before sections)
-- ---------------------------------------------------------------------------
CREATE TABLE longform (
  id                 TEXT    PRIMARY KEY,
  slug               TEXT    NOT NULL,
  title              TEXT    NOT NULL,
  body               TEXT    NOT NULL,
  version            INTEGER NOT NULL DEFAULT 1,
  superseded_by_id   TEXT    REFERENCES longform(id) ON DELETE RESTRICT,
  published_at       TEXT    NOT NULL,
  deleted_at         TEXT,
  withdrawal_reason  TEXT,
  created_at         TEXT    NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')),
  UNIQUE (slug, version),
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
-- FR3 — sections
-- ---------------------------------------------------------------------------
CREATE TABLE sections (
  id                  TEXT    PRIMARY KEY,
  issue_id            TEXT    NOT NULL REFERENCES issues(id)        ON DELETE RESTRICT,
  section_id          TEXT    NOT NULL,
  title               TEXT    NOT NULL,
  frame               TEXT    NOT NULL,
  structural_argument TEXT    NOT NULL,
  spine_tag_id        TEXT    NOT NULL REFERENCES spine_tags(id)    ON DELETE RESTRICT,
  category_tag_id     TEXT    NOT NULL REFERENCES category_tags(id) ON DELETE RESTRICT,
  longform_id         TEXT             REFERENCES longform(id)      ON DELETE RESTRICT,
  version             INTEGER NOT NULL DEFAULT 1,
  superseded_by_id    TEXT             REFERENCES sections(id)      ON DELETE RESTRICT,
  published_at        TEXT    NOT NULL,
  deleted_at          TEXT,
  withdrawal_reason   TEXT,
  created_at          TEXT    NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')),
  UNIQUE (issue_id, section_id, version),
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
-- FR7 — citations (polymorphic via nullable FKs + CHECK)
-- ---------------------------------------------------------------------------
CREATE TABLE citations (
  id                 TEXT PRIMARY KEY,
  section_id         TEXT REFERENCES sections(id) ON DELETE RESTRICT,
  longform_id        TEXT REFERENCES longform(id) ON DELETE RESTRICT,
  label              TEXT NOT NULL,
  url                TEXT NOT NULL,
  archive_url        TEXT,
  kind               TEXT NOT NULL,
  verified_at        TEXT,
  deleted_at         TEXT,
  withdrawal_reason  TEXT,
  created_at         TEXT NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')),
  CHECK (
    (section_id IS NOT NULL AND longform_id IS NULL)
    OR
    (section_id IS NULL AND longform_id IS NOT NULL)
  ),
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
-- FR10 — submissions
-- ---------------------------------------------------------------------------
CREATE TABLE submissions (
  id              TEXT PRIMARY KEY,
  envelope        TEXT NOT NULL,
  api_key_hash    TEXT NOT NULL,
  idempotency_key TEXT NOT NULL UNIQUE,
  received_at     TEXT NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')),
  desk_verdict    TEXT,
  verdict_at      TEXT,
  verdict_note    TEXT
);

-- ---------------------------------------------------------------------------
-- FR14 — index set
-- ---------------------------------------------------------------------------
CREATE INDEX idx_sections_issue_id         ON sections(issue_id);
CREATE INDEX idx_sections_spine_tag_id     ON sections(spine_tag_id);
CREATE INDEX idx_sections_category_tag_id  ON sections(category_tag_id);
CREATE INDEX idx_sections_published_at     ON sections(published_at);
CREATE INDEX idx_sections_lineage_latest
  ON sections(issue_id, section_id)
  WHERE superseded_by_id IS NULL;

CREATE INDEX idx_citations_section_id
  ON citations(section_id)
  WHERE section_id IS NOT NULL;
CREATE INDEX idx_citations_longform_id
  ON citations(longform_id)
  WHERE longform_id IS NOT NULL;

CREATE INDEX idx_longform_lineage_latest
  ON longform(slug)
  WHERE superseded_by_id IS NULL;

-- ---------------------------------------------------------------------------
-- Bookkeeping
-- ---------------------------------------------------------------------------
INSERT INTO schema_migrations (version, name, checksum)
VALUES (1, '0001-initial-schema', 'sha256-deferred');
