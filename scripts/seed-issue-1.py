#!/usr/bin/env python3
"""
Generate migrations/0002-seed-issue-1.sql from editor-stamped section
sources. Reads the editor outputs from the reflection workspace (not
copied into this repo per P10 boundaries — sections are pulled at
assembly time), emits an idempotent forward-only migration that seeds
the minimum controlled-vocabulary entries plus issue #1 with
approved sections C1 and C2 and their primary-source citations.

Run from repo root:
    python3 scripts/seed-issue-1.py

Writes to migrations/0002-seed-issue-1.sql.
"""
from __future__ import annotations

import pathlib
import sys

REPO = pathlib.Path(__file__).resolve().parent.parent
EDITOR_OUT = pathlib.Path(
    "/mnt/storage/prmichaelsen/projects/reflection/agent/runtime/"
    "tracks/agentscape-editor/output/issue-1"
)
OUT = REPO / "migrations" / "0002-seed-issue-1.sql"


def sq(s: str) -> str:
    """SQL-quote a string for inline insert. Doubles single quotes."""
    return "'" + s.replace("'", "''") + "'"


def read_body(path: pathlib.Path) -> str:
    """Read editor-stamped section, strip the leading scry-marker
    comment and any leading whitespace, return the rest verbatim."""
    raw = path.read_text(encoding="utf-8")
    # Strip <!-- @scry.entry ... @scry.entry.end --> block(s)
    while "<!-- @scry.entry" in raw:
        start = raw.index("<!-- @scry.entry")
        end = raw.index("@scry.entry.end -->", start) + len("@scry.entry.end -->")
        raw = raw[:start] + raw[end:]
    # Strip <!-- @scry.bind ... --> single-line binds
    out_lines = []
    for ln in raw.splitlines():
        if ln.lstrip().startswith("<!-- @scry.bind"):
            continue
        out_lines.append(ln)
    return "\n".join(out_lines).strip() + "\n"


# Controlled vocabulary minimums. agentscape charter spine sub-questions
# at issue 1: (1) what runtimes converge on; (2) what they diverge on;
# (3) what the field has not yet named. Categories: convergence, frame,
# retraction-watch, etc. We seed the entries actually referenced by C1
# and C2; downstream sections add as they ship.
SPINE = [
    ("spine-convergence-vocab", "What the field has converged on (vocabulary)",
     "Sub-question: where has the vocabulary of agentic systems settled?"),
    ("spine-convergence-mech", "What the field has converged on (mechanic)",
     "Sub-question: where has the runtime mechanic settled?"),
]
CATEGORY = [
    ("cat-convergence", "Convergence",
     "Pieces that establish the field has settled on a shared shape."),
    ("cat-frame", "Frame",
     "Pieces that name a concept or vocabulary the field shares."),
]


def main() -> int:
    c1 = read_body(EDITOR_OUT / "C1-mcp-spec-to-substrate.md")
    c2 = read_body(EDITOR_OUT / "C2-agent-loop-invariant.md")

    publish_date = "2026-05-23"

    lines: list[str] = []
    add = lines.append

    add("-- migrations/0002-seed-issue-1.sql")
    add("-- Forward-only seed for issue #1 (C1 + C2) + minimum controlled")
    add("-- vocabularies. Implements directive 2026-05-23T13-54-05Z (worker).")
    add("PRAGMA foreign_keys = ON;")
    add("-- NOTE: BEGIN/COMMIT omitted — D1 rejects explicit transactions in")
    add("-- script form (uses storage transaction API instead). The wrangler")
    add("-- d1 execute --file invocation atomically replays the whole batch.")
    add("")

    # Spine tags
    add("-- FR9 — spine_tags seed (minimum for issue #1)")
    for sid, label, desc in SPINE:
        add(
            f"INSERT OR IGNORE INTO spine_tags (id, slug, label, description) "
            f"VALUES ({sq(sid)}, {sq(sid)}, {sq(label)}, {sq(desc)});"
        )
    add("")
    add("-- FR9 — category_tags seed (minimum for issue #1)")
    for cid, label, desc in CATEGORY:
        add(
            f"INSERT OR IGNORE INTO category_tags (id, slug, label, description) "
            f"VALUES ({sq(cid)}, {sq(cid)}, {sq(label)}, {sq(desc)});"
        )
    add("")

    # Issue
    add("-- FR2 — issues row for issue #1")
    add(
        "INSERT OR IGNORE INTO issues "
        "(id, issue_number, slug, title, publish_date, masthead_state, archive_flag) "
        f"VALUES ('issue-1', 1, 'issue-1', "
        f"{sq('Issue 1 — convergence in 2026')}, "
        f"{sq(publish_date)}, {sq('published')}, 0);"
    )
    add("")

    # Sections
    add("-- FR3 — sections rows (verbatim editor-stamped bodies)")
    c1_title = "MCP went from spec to substrate in nine months"
    c1_frame = (
        "Vocabulary diff: 2025-Q3 vs 2026-Q1. Three independent runtimes "
        "now carry MCP as a load-bearing noun."
    )
    c1_struct = (
        "Convergence-on-vocabulary, field-level evidence floor (3 runtimes), "
        "G6 COI disclosure inline."
    )
    add(
        "INSERT OR IGNORE INTO sections "
        "(id, issue_id, section_id, title, frame, structural_argument, "
        "spine_tag_id, category_tag_id, published_at) "
        f"VALUES ('sec-issue-1-C1', 'issue-1', 'C1', "
        f"{sq(c1_title)}, {sq(c1_frame)}, {sq(c1_struct)}, "
        f"'spine-convergence-vocab', 'cat-convergence', {sq(publish_date)});"
    )
    add("")
    # longform body lives in `longform` table per spec; but C1/C2 are
    # section-scoped, body inline via... wait, sections table does not
    # store body. Re-read spec: sections.frame + sections.structural_argument
    # are short fields; section body goes into `longform` and is linked
    # via sections.longform_id. C1/C2 are *issue sections*, not longform
    # pieces — but the spec only models a body in longform. For projection
    # we need the body. Path: store body in longform with a synthetic slug
    # mirroring the section, link via longform_id. This is the canonical
    # shape for "section bearing prose."
    add("-- FR4 — longform bodies for C1/C2 (linked via sections.longform_id)")
    add(
        "INSERT OR IGNORE INTO longform "
        "(id, slug, title, body, version, published_at) "
        f"VALUES ('lf-issue-1-C1', 'mcp-spec-to-substrate', "
        f"{sq(c1_title)}, {sq(c1)}, 1, {sq(publish_date)});"
    )
    add(
        "UPDATE sections SET longform_id = 'lf-issue-1-C1' "
        "WHERE id = 'sec-issue-1-C1' AND longform_id IS NULL;"
    )
    add("")

    c2_title = "The loop that shipped"
    c2_frame = (
        "Five shipped runtimes carry the same outer-loop mechanic. The "
        "literature's alternatives are themselves loops; the production "
        "stance is blending, not replacement."
    )
    c2_struct = (
        "Convergence-on-mechanic, primary-source per runtime, alternative "
        "cohort named at field-level resolution, G6 COI on Reflect inline."
    )
    add(
        "INSERT OR IGNORE INTO sections "
        "(id, issue_id, section_id, title, frame, structural_argument, "
        "spine_tag_id, category_tag_id, published_at) "
        f"VALUES ('sec-issue-1-C2', 'issue-1', 'C2', "
        f"{sq(c2_title)}, {sq(c2_frame)}, {sq(c2_struct)}, "
        f"'spine-convergence-mech', 'cat-convergence', {sq(publish_date)});"
    )
    add(
        "INSERT OR IGNORE INTO longform "
        "(id, slug, title, body, version, published_at) "
        f"VALUES ('lf-issue-1-C2', 'agent-loop-invariant', "
        f"{sq(c2_title)}, {sq(c2)}, 1, {sq(publish_date)});"
    )
    add(
        "UPDATE sections SET longform_id = 'lf-issue-1-C2' "
        "WHERE id = 'sec-issue-1-C2' AND longform_id IS NULL;"
    )
    add("")

    # Citations
    add("-- FR7 — citations (primary sources per section)")
    c1_cites = [
        ("Model Context Protocol — specification site",
         "https://modelcontextprotocol.io", "spec"),
        ("MCP specification — GitHub releases",
         "https://github.com/modelcontextprotocol/modelcontextprotocol/releases",
         "spec"),
        ("Claude Code — MCP documentation",
         "https://code.claude.com/docs/en/mcp", "runtime-doc"),
        ("Cursor — MCP documentation",
         "https://cursor.com/docs/context/mcp", "runtime-doc"),
        ("LangChain MCP adapters — GitHub repository",
         "https://github.com/langchain-ai/langchain-mcp-adapters",
         "runtime-repo"),
    ]
    for i, (label, url, kind) in enumerate(c1_cites, 1):
        add(
            "INSERT OR IGNORE INTO citations "
            "(id, section_id, label, url, kind) "
            f"VALUES ('cit-issue-1-C1-{i}', 'sec-issue-1-C1', "
            f"{sq(label)}, {sq(url)}, {sq(kind)});"
        )
    add("")

    c2_cites = [
        ("OpenAI Agents SDK — running-agents reference",
         "https://openai.github.io/openai-agents-python/running_agents/",
         "runtime-doc"),
        ("OpenAI Responses API — guide",
         "https://platform.openai.com/docs/guides/responses",
         "runtime-doc"),
        ("Hugging Face smolagents — conceptual guide",
         "https://huggingface.co/docs/smolagents/conceptual_guides/intro_agents",
         "runtime-doc"),
        ("Anthropic Claude Code — overview",
         "https://docs.claude.com/en/docs/agents-and-tools/claude-code/overview",
         "runtime-doc"),
        ("LangChain Python — overview",
         "https://python.langchain.com/docs/introduction/", "runtime-doc"),
        ("Cursor — documentation hub",
         "https://cursor.com/docs", "runtime-doc"),
        ("Yao et al. 2022 — ReAct: Synergizing Reasoning and Acting "
         "in Language Models",
         "https://arxiv.org/abs/2210.03629", "academic"),
        ("IBM Think — ReAct write-up",
         "https://www.ibm.com/think/topics/react-agent", "secondary"),
    ]
    for i, (label, url, kind) in enumerate(c2_cites, 1):
        add(
            "INSERT OR IGNORE INTO citations "
            "(id, section_id, label, url, kind) "
            f"VALUES ('cit-issue-1-C2-{i}', 'sec-issue-1-C2', "
            f"{sq(label)}, {sq(url)}, {sq(kind)});"
        )
    add("")

    add("INSERT OR IGNORE INTO schema_migrations (version, name, checksum) "
        "VALUES (2, '0002-seed-issue-1', 'sha256-deferred');")

    OUT.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"wrote {OUT} ({OUT.stat().st_size} bytes)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
