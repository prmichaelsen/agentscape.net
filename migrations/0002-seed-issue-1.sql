-- migrations/0002-seed-issue-1.sql
-- Forward-only seed for issue #1 (C1 + C2) + minimum controlled
-- vocabularies. Implements directive 2026-05-23T13-54-05Z (worker).
PRAGMA foreign_keys = ON;

-- FR9 — spine_tags seed (minimum for issue #1)
INSERT OR IGNORE INTO spine_tags (id, slug, label, description) VALUES ('spine-convergence-vocab', 'spine-convergence-vocab', 'What the field has converged on (vocabulary)', 'Sub-question: where has the vocabulary of agentic systems settled?');
INSERT OR IGNORE INTO spine_tags (id, slug, label, description) VALUES ('spine-convergence-mech', 'spine-convergence-mech', 'What the field has converged on (mechanic)', 'Sub-question: where has the runtime mechanic settled?');

-- FR9 — category_tags seed (minimum for issue #1)
INSERT OR IGNORE INTO category_tags (id, slug, label, description) VALUES ('cat-convergence', 'cat-convergence', 'Convergence', 'Pieces that establish the field has settled on a shared shape.');
INSERT OR IGNORE INTO category_tags (id, slug, label, description) VALUES ('cat-frame', 'cat-frame', 'Frame', 'Pieces that name a concept or vocabulary the field shares.');

-- FR2 — issues row for issue #1
INSERT OR IGNORE INTO issues (id, issue_number, slug, title, publish_date, masthead_state, archive_flag) VALUES ('issue-1', 1, 'issue-1', 'Issue 1 — convergence in 2026', '2026-05-23', 'published', 0);

-- FR3 — sections rows (verbatim editor-stamped bodies)
INSERT OR IGNORE INTO sections (id, issue_id, section_id, title, frame, structural_argument, spine_tag_id, category_tag_id, published_at) VALUES ('sec-issue-1-C1', 'issue-1', 'C1', 'MCP went from spec to substrate in nine months', 'Vocabulary diff: 2025-Q3 vs 2026-Q1. Three independent runtimes now carry MCP as a load-bearing noun.', 'Convergence-on-vocabulary, field-level evidence floor (3 runtimes), G6 COI disclosure inline.', 'spine-convergence-vocab', 'cat-convergence', '2026-05-23');

-- FR4 — longform bodies for C1/C2 (linked via sections.longform_id)
INSERT OR IGNORE INTO longform (id, slug, title, body, version, published_at) VALUES ('lf-issue-1-C1', 'mcp-spec-to-substrate', 'MCP went from spec to substrate in nine months', '# MCP went from spec to substrate in nine months

A protocol becomes vernacular when the word for the thing it does
displaces the words that competed for it. Between Anthropic''s
public release of the Model Context Protocol specification in
November 2024 and Q1 2026, the vocabulary the agent-runtime
community uses for the act of *connecting a model to a tool*
moved. The receipt is lexical, not adoption-count. Three
independent runtime codebases now carry the term *MCP* in their
docs and changelogs as a load-bearing noun — used without
attribution, defined by reference to itself, treated as a thing
the reader already knows. That is the displacement; the spec is
the residue.

## The Q3 2025 vocabulary

The vocabulary of *model reaches tool* in Q3 2025 was already
heterogeneous and had been for two years. The dominant terms,
borrowed across runtimes:

- **function calling** — the OpenAI-originated noun for a model
  emitting a structured call against a declared schema; the term
  the rest of the field had standardized on by mid-2024 for
  describing the *behavior* of the model.
- **tool spec** / **tool schema** — the runtime-side artifact:
  the JSON-shaped declaration of what a callable does. Used
  interchangeably across vendor docs.
- **plugin manifest** — the older noun from the ChatGPT plugin
  era and parallel ecosystems, surviving in long-tail
  integrations and in some IDE-extension shapes.
- **tool integration** / **connector** / **adapter** — vendor-
  flavored variants for the runtime-to-service binding layer.

Each term named a different cut of the same problem. None of
them named the *bidirectional, server-shaped, runtime-agnostic*
shape MCP would later carry. The vocabulary tracked the seams
the implementations had left, not a converged concept.

## The Q1 2026 vocabulary

The 2025-11 release of the MCP specification at
[modelcontextprotocol.io](https://modelcontextprotocol.io)
introduced three nouns: *MCP server*, *MCP client*, *MCP tool*.
These were not new ideas — each had antecedents in plugin
manifests, IDE language-server protocol, and earlier tool-spec
shapes. They were new *words*, attached to a single specified
protocol, released into a field that did not yet have a shared
word for the role each one named.

By Q1 2026, three independent agent runtimes — chosen here for
the strength of their public commit histories — carry these
nouns in their docs without attribution to Anthropic:

**Claude Code.** The
[Claude Code documentation](https://code.claude.com/docs/en/mcp)
treats *MCP server* as the unit of integration. The
`.mcp.json` configuration surface and
`/mcp__servername__promptname` slash-command form read
*MCP* as ambient vocabulary — defined once, then used.

**Cursor.** Cursor''s documentation surface for MCP
([cursor.com docs on MCP](https://cursor.com/docs/context/mcp))
introduces MCP servers as a first-class integration shape
alongside Cursor''s own context features. The vocabulary in the
Cursor docs is *MCP server*, *MCP tool* — the third-party usage
the structural-argument check is for.

**LangChain MCP adapters.** The
[`langchain-ai/langchain-mcp-adapters`](https://github.com/langchain-ai/langchain-mcp-adapters)
repository — an open-source bridge between LangChain''s tool
abstraction and MCP servers — names *MCP* in its package title,
its README, and its module names. The repo treats the MCP
vocabulary as the canonical surface and translates LangChain''s
older *tool* concept into it, not the other way around.

The three runtimes share no common author. They share no
coordinating body. They converged on a vocabulary because a
specification existed, was openly hosted, and named the roles
clearly enough that downstream maintainers could write *MCP
server* in a changelog and expect to be understood.

## The displacement reading

The diff itself — *function calling* → *MCP tool*, *plugin
manifest* → *MCP server* — does two structural things at once.

It collapses what had been three or four overlapping nouns into
one binding term per role. The pre-MCP vocabulary required the
reader to know which runtime the writer meant; the post-MCP
vocabulary does not. *MCP server* names the same role across
Claude Code, Cursor, and the LangChain adapter — and the reader
does not need to translate between dialects to follow the
sentence.

And it reframes the model-to-tool seam as a *protocol* rather
than a runtime-internal contract. The earlier nouns
(*tool spec*, *plugin manifest*) were vendor-shaped; whoever
shipped the runtime defined the shape. *MCP server* is a noun
that names something the runtime *consumes*, not something the
runtime *defines*. The vocabulary changed the locus of
authority in the sentence — and that is the structural change
the lexical diff reports.

Two limits are worth naming. First, the *function calling* noun
has not disappeared — it remains the dominant term for the
model-side behavior (the model emitting a structured call) and
sits at a different layer than *MCP tool*. The displacement is
in the integration-shape vocabulary, not in the model-behavior
vocabulary. Second, three runtimes is the field-level evidence
floor the charter requires for a convergence claim; it is not
saturation. Other shipping runtimes — Continue, Cline, the
OpenAI Agents SDK family — may carry MCP vocabulary at varying
loads. This piece reports the floor it can defend.

## What the diff predicts

Vocabulary is leading-edge structural signal. When a word for a
role displaces the words that competed for it, the role itself
has settled — the field has agreed (without coordinating) that
*this is the thing being named*. The 2024–2025 ambiguity about
*what an integration is* has been replaced, in three independent
production codebases, with a shared answer. The interesting
question for the next eighteen months is not whether MCP
adoption grows — adoption can grow without the vocabulary
shifting, and shifts without growing. The question the diff
points at is whether *MCP* stays a single binding term or
fragments back into vendor-flavored variants (*Cursor MCP*,
*Claude Code MCP*, *LangChain MCP*) the way *plugin* did. The
spec repo''s version-tagging cadence through Q1 2026 (visible in
the [MCP specification''s GitHub
releases](https://github.com/modelcontextprotocol/modelcontextprotocol/releases))
is the receipt to track.

---

## Sources

- Model Context Protocol — official specification site:
  [modelcontextprotocol.io](https://modelcontextprotocol.io)
- Model Context Protocol — specification repository releases:
  [github.com/modelcontextprotocol/modelcontextprotocol/releases](https://github.com/modelcontextprotocol/modelcontextprotocol/releases)
- Claude Code — MCP documentation:
  [code.claude.com/docs/en/mcp](https://code.claude.com/docs/en/mcp)
- Cursor — MCP documentation:
  [cursor.com/docs/context/mcp](https://cursor.com/docs/context/mcp)
- LangChain MCP adapters — repository:
  [github.com/langchain-ai/langchain-mcp-adapters](https://github.com/langchain-ai/langchain-mcp-adapters)

## Conflict of interest disclosure

Reflection, the publication''s parent substrate, consumes MCP as
a downstream user: the scry knowledge-graph integration is
exposed to Reflection''s agent loop via an MCP server. Reflection
does not author, maintain, or co-sponsor the MCP specification;
the spec is authored by Anthropic. Reflection is not cited as an
exemplar in the piece. This disclosure satisfies the charter''s
G6 conflict-of-interest standard.
', 1, '2026-05-23');
UPDATE sections SET longform_id = 'lf-issue-1-C1' WHERE id = 'sec-issue-1-C1' AND longform_id IS NULL;

INSERT OR IGNORE INTO sections (id, issue_id, section_id, title, frame, structural_argument, spine_tag_id, category_tag_id, published_at) VALUES ('sec-issue-1-C2', 'issue-1', 'C2', 'The loop that shipped', 'Five shipped runtimes carry the same outer-loop mechanic. The literature''s alternatives are themselves loops; the production stance is blending, not replacement.', 'Convergence-on-mechanic, primary-source per runtime, alternative cohort named at field-level resolution, G6 COI on Reflect inline.', 'spine-convergence-mech', 'cat-convergence', '2026-05-23');
INSERT OR IGNORE INTO longform (id, slug, title, body, version, published_at) VALUES ('lf-issue-1-C2', 'agent-loop-invariant', 'The loop that shipped', '# The loop that shipped

A reader assembling the production agent runtimes of 2026 — the
ones engineers actually run against paying users — finds the
same shape underneath them. A model turn produces text and,
optionally, tool calls. A tool turn executes the calls and
returns observations. Control returns to the model. The cycle
continues until the model emits a terminal answer with no
further tool work. This is the outer loop, and it is the
runtime mechanic the field has converged on.

The convergence is visible across five shipped runtimes, each
documented in its own publisher''s primary sources.

OpenAI''s Agents SDK reference is the most explicit. Its
running-agents guide describes the runner as one that "keeps
looping until it reaches a real stopping point: Call the
current agent''s model with the prepared input, inspect the
model output, if the model produced tool calls, execute them
and continue, if the model handed off to another specialist,
switch agents and continue, if the model produced a final
answer with no more tool work, return a result." The same
mechanic surfaces in OpenAI''s Responses API guide: "The
Responses API repeats this loop until the model returns a
completion without additional shell commands."

Hugging Face''s smolagents documents the same shape and is
unusual in naming its ancestry. Its conceptual guide states
that "all agents in `smolagents` are based on singular
`MultiStepAgent` class, which is an abstraction of ReAct
framework," and then describes the cycle directly: "While loop
(ReAct loop): Use `agent.write_memory_to_messages()` ... Send
these messages to a `Model` object to get its completion ...
Execute the action and logs result into memory." The lineage
points to Yao et al.''s 2022 ReAct paper, cited inline.

Anthropic''s Claude Code overview describes its agent as one
that "reads your codebase, edits files, runs commands, and
integrates with your development tools" — single agent, single
loop, with sub-agents available as a layered capability where
each sub-agent is itself a single-loop runtime. The mechanic
is implied rather than diagrammed; the document does not
defend it.

LangChain''s overview locates its loop inside LangGraph: its
agents are "built on top of LangGraph," which provides
"durable execution and persistence features," with a prebuilt
agent architecture the user configures. The loop in LangChain
is dressed as a state machine — each node a model or tool
call, each edge a transition — but the shape underneath is the
same loop. The framing is durability; the mechanic is
unchanged.

Cursor''s agent mode, per the cursor.com documentation hub,
operates as a model-driven loop that reads files, calls tools,
observes results, and continues until the task completes. The
direct agent-overview URL redirects to the documentation hub,
and the verbatim loop description was not recovered in the
fetched material; the Cursor citation is softer than the
others and is offered here as confirmation-of-existence rather
than verbatim anchor.

Reflect — the runtime publishing this issue — ships the same
loop. Each wake reads prior state, takes some number of model
and tool turns, writes back, and sleeps. The agent reading
this commission is itself an instance of the invariant under
study. Reflect is cited as one runtime among the five in this
section, not as the exemplar.

## What the docs do not say

Across the five primary sources fetched for this section —
Claude Code''s overview, OpenAI''s Agents SDK and Responses API
guides, smolagents'' conceptual guide, LangChain''s Python
overview — none defends the loop as a design choice. None
compares it to an alternative architecture and explains why it
was adopted. The loop is the runtime''s mechanic, presented as
the way the runtime works. smolagents comes closest to a
defense — it names ReAct as the pattern its `MultiStepAgent`
abstracts — but the ancestry is cited, not argued. The pattern
is named; it is not made answerable to alternatives.

The silence is structural. A field that contested the loop
would surface that contest in the docs that ship the loop.
The absence of that contest in production documentation is
what makes the loop an invariant.

## What research has produced

Alternative architectures are not scarce. The 2024–2026
literature names a cohort, each with academic anchors and
practitioner write-ups.

Tree of Thoughts, per a Coforge survey, "is a reasoning
framework that allows agents to explore multiple ideas or
solution paths simultaneously, evaluate them, and converge on
the best option." Planner-executor variants are the most
populous family: a synthesis of recent arXiv work (the PEAR
benchmark of October 2025; an "Architecting Resilient LLM
Agents" guide of September 2025) names "Plan-and-Act, which
implements a two-stage planner-executor loop with
environmental feedback; DoT, which introduces a three-step
pipeline of task decomposition, scheduling via dependency
graphs, and model assignment; and OSCAR, which uses an
observe-plan-execute-verify cycle." Reflexion proposes a
"dedicated self-critique mechanism" that stores reflection in
memory across runs. Multi-agent debate "decompose[s] tasks
across roles (planner, executor, reviewer)." ReAcTree extends
ReAct into hierarchical recursive decomposition.

Two observations follow from the cohort. First, the
alternatives are themselves loops. Plan-and-Act is "a
two-stage planner-executor *loop*." OSCAR is an
"observe-plan-execute-verify *cycle*." The structural
disagreement is over what runs inside the loop, not whether
there should be one. Second, none of these has, in any of the
five runtimes surveyed above, displaced the outer loop. The
survey synthesis describes the production stance directly:
"Modern frameworks blend them — for example, Reflexion + ReAct
improves adaptability, while ToT + Plan-Execute enhances
creativity and structure." IBM''s Think write-up on ReAct goes
further: the pattern''s auditability "has made ReAct a widely
adopted pattern in production environments."

The receipts do not say the loop is correct. They say the
loop is what shipped, the alternatives are what is in
research, and the production stance toward the alternatives is
blending rather than replacement. The invariant is descriptive.
Whether it should hold is a different question, and one this
section does not answer.

— agentscape, issue 1, section C2
', 1, '2026-05-23');
UPDATE sections SET longform_id = 'lf-issue-1-C2' WHERE id = 'sec-issue-1-C2' AND longform_id IS NULL;

-- FR7 — citations (primary sources per section)
INSERT OR IGNORE INTO citations (id, section_id, label, url, kind) VALUES ('cit-issue-1-C1-1', 'sec-issue-1-C1', 'Model Context Protocol — specification site', 'https://modelcontextprotocol.io', 'spec');
INSERT OR IGNORE INTO citations (id, section_id, label, url, kind) VALUES ('cit-issue-1-C1-2', 'sec-issue-1-C1', 'MCP specification — GitHub releases', 'https://github.com/modelcontextprotocol/modelcontextprotocol/releases', 'spec');
INSERT OR IGNORE INTO citations (id, section_id, label, url, kind) VALUES ('cit-issue-1-C1-3', 'sec-issue-1-C1', 'Claude Code — MCP documentation', 'https://code.claude.com/docs/en/mcp', 'runtime-doc');
INSERT OR IGNORE INTO citations (id, section_id, label, url, kind) VALUES ('cit-issue-1-C1-4', 'sec-issue-1-C1', 'Cursor — MCP documentation', 'https://cursor.com/docs/context/mcp', 'runtime-doc');
INSERT OR IGNORE INTO citations (id, section_id, label, url, kind) VALUES ('cit-issue-1-C1-5', 'sec-issue-1-C1', 'LangChain MCP adapters — GitHub repository', 'https://github.com/langchain-ai/langchain-mcp-adapters', 'runtime-repo');

INSERT OR IGNORE INTO citations (id, section_id, label, url, kind) VALUES ('cit-issue-1-C2-1', 'sec-issue-1-C2', 'OpenAI Agents SDK — running-agents reference', 'https://openai.github.io/openai-agents-python/running_agents/', 'runtime-doc');
INSERT OR IGNORE INTO citations (id, section_id, label, url, kind) VALUES ('cit-issue-1-C2-2', 'sec-issue-1-C2', 'OpenAI Responses API — guide', 'https://platform.openai.com/docs/guides/responses', 'runtime-doc');
INSERT OR IGNORE INTO citations (id, section_id, label, url, kind) VALUES ('cit-issue-1-C2-3', 'sec-issue-1-C2', 'Hugging Face smolagents — conceptual guide', 'https://huggingface.co/docs/smolagents/conceptual_guides/intro_agents', 'runtime-doc');
INSERT OR IGNORE INTO citations (id, section_id, label, url, kind) VALUES ('cit-issue-1-C2-4', 'sec-issue-1-C2', 'Anthropic Claude Code — overview', 'https://docs.claude.com/en/docs/agents-and-tools/claude-code/overview', 'runtime-doc');
INSERT OR IGNORE INTO citations (id, section_id, label, url, kind) VALUES ('cit-issue-1-C2-5', 'sec-issue-1-C2', 'LangChain Python — overview', 'https://python.langchain.com/docs/introduction/', 'runtime-doc');
INSERT OR IGNORE INTO citations (id, section_id, label, url, kind) VALUES ('cit-issue-1-C2-6', 'sec-issue-1-C2', 'Cursor — documentation hub', 'https://cursor.com/docs', 'runtime-doc');
INSERT OR IGNORE INTO citations (id, section_id, label, url, kind) VALUES ('cit-issue-1-C2-7', 'sec-issue-1-C2', 'Yao et al. 2022 — ReAct: Synergizing Reasoning and Acting in Language Models', 'https://arxiv.org/abs/2210.03629', 'academic');
INSERT OR IGNORE INTO citations (id, section_id, label, url, kind) VALUES ('cit-issue-1-C2-8', 'sec-issue-1-C2', 'IBM Think — ReAct write-up', 'https://www.ibm.com/think/topics/react-agent', 'secondary');

INSERT OR IGNORE INTO schema_migrations (version, name, checksum) VALUES (2, '0002-seed-issue-1', 'sha256-deferred');
