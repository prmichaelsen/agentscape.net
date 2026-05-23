INSERT OR IGNORE INTO entries (id, slug, title, content_hash, definition, first_appearance, etymology, current_meaning, divergent_meanings, supersession_note, superseded_by_id, version, state, published_at) VALUES ('6b1bca74-5c17-4e00-a384-654de790fa2e', 'skill', 'Skill', '772eb89c389950ed', 'A **skill**, in the Anthropic platform sense the term carries
through the agentic-AI vocabulary of 2025–2026, is a filesystem-
resident bundle of instructions, optional scripts, and optional
resources that an agent loads when relevant to the task at hand.
The canonical platform definition: "Agent Skills are modular
capabilities that extend Claude''s functionality. Each Skill
packages instructions, metadata, and optional resources (scripts,
templates) that Claude uses automatically when relevant." [^1]

The shorter form Anthropic uses in launch material: "Skills are
folders that include instructions, scripts, and resources that
Claude can load when needed." [^2]

[^1]: Anthropic, *Agent Skills overview*, accessed 2026-05-23.
    [platform.claude.com/docs/en/agents-and-tools/agent-skills/overview](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/overview)

[^2]: Anthropic, *Equipping agents for the real world with Agent
    Skills*, 2025-10-16, accessed 2026-05-23.
    [claude.com/blog/skills](https://claude.com/blog/skills)
    (the original `anthropic.com/news/skills` URL 308-redirects to
    this destination as of 2026-05-23). An engineering deep-dive
    companion is published at
    [anthropic.com/engineering/equipping-agents-for-the-real-world-with-agent-skills](https://www.anthropic.com/engineering/equipping-agents-for-the-real-world-with-agent-skills).

[^3]: Anthropic, *anthropics/skills*, accessed 2026-05-23.
    [github.com/anthropics/skills](https://github.com/anthropics/skills)

[^4]: OpenAI, *Agents SDK — Tools* and *Agents SDK — Handoffs*,
    accessed 2026-05-23.
    [openai.github.io/openai-agents-python/tools/](https://openai.github.io/openai-agents-python/tools/);
    [openai.github.io/openai-agents-python/handoffs/](https://openai.github.io/openai-agents-python/handoffs/).
    The orchestration guide on the developer platform mirrors the
    "handoffs" terminology:
    [developers.openai.com/api/docs/guides/agents/orchestration](https://developers.openai.com/api/docs/guides/agents/orchestration).

[^5]: Hugging Face, *smolagents* (library index and Agents
    reference), accessed 2026-05-23.
    [huggingface.co/docs/smolagents/index](https://huggingface.co/docs/smolagents/index);
    [huggingface.co/docs/smolagents/reference/agents](https://huggingface.co/docs/smolagents/reference/agents).
    The library''s two agent classes — `CodeAgent` and
    `ToolCallingAgent` — are named in the Agents reference; the
    construct surface is "agent," not "skill."

[^6]: LangChain, `langchain-core` — `Runnable` base class
    source, accessed 2026-05-23.
    [github.com/langchain-ai/langchain/blob/master/libs/core/langchain_core/runnables/base.py](https://github.com/langchain-ai/langchain/blob/master/libs/core/langchain_core/runnables/base.py).
    The `Runnable` abstraction is alive and canonical in
    `langchain-core` as the composable-unit primitive;
    distinct from the framework''s agent vocabulary
    ("agents", "tools"). Source pinned to the repo because the
    docs-site reference surface has been reshuffled and is
    less stable than the source-of-truth class definition.', 'The agentic-AI product sense of the term enters the field on
**2025-10-16**, the publication date of Anthropic''s announcement
*Equipping agents for the real world with Agent Skills*. [^2] The
post launched Skills across claude.ai (Pro, Max, Team, Enterprise),
the Claude Developer Platform API, and Claude Code. The original
announcement URL, `anthropic.com/news/skills`, has since been
moved; it issues a 308 redirect to `claude.com/blog/skills` and
that destination is the canonical citation as of this entry. [^2]

The framing Anthropic chose for the launch positions skills as
authored guidance rather than learned behaviour: "Think of Skills
as custom onboarding materials that let you package expertise,
making Claude a specialist on what matters most to you." [^2] The
onboarding-document metaphor — not the reinforcement-learning
lineage — is the one the product carries.

The word "skill" predates 2025-10 in adjacent technical senses
(reinforcement-learning skill libraries, options-framework skills,
the soft-skill / domain-skill colloquialism). What 2025-10-16
establishes is the agentic-AI-product sense documented here: a
filesystem-resident, frontmatter-described, progressively-loaded
capability bundle.

[^1]: Anthropic, *Agent Skills overview*, accessed 2026-05-23.
    [platform.claude.com/docs/en/agents-and-tools/agent-skills/overview](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/overview)

[^2]: Anthropic, *Equipping agents for the real world with Agent
    Skills*, 2025-10-16, accessed 2026-05-23.
    [claude.com/blog/skills](https://claude.com/blog/skills)
    (the original `anthropic.com/news/skills` URL 308-redirects to
    this destination as of 2026-05-23). An engineering deep-dive
    companion is published at
    [anthropic.com/engineering/equipping-agents-for-the-real-world-with-agent-skills](https://www.anthropic.com/engineering/equipping-agents-for-the-real-world-with-agent-skills).

[^3]: Anthropic, *anthropics/skills*, accessed 2026-05-23.
    [github.com/anthropics/skills](https://github.com/anthropics/skills)

[^4]: OpenAI, *Agents SDK — Tools* and *Agents SDK — Handoffs*,
    accessed 2026-05-23.
    [openai.github.io/openai-agents-python/tools/](https://openai.github.io/openai-agents-python/tools/);
    [openai.github.io/openai-agents-python/handoffs/](https://openai.github.io/openai-agents-python/handoffs/).
    The orchestration guide on the developer platform mirrors the
    "handoffs" terminology:
    [developers.openai.com/api/docs/guides/agents/orchestration](https://developers.openai.com/api/docs/guides/agents/orchestration).

[^5]: Hugging Face, *smolagents* (library index and Agents
    reference), accessed 2026-05-23.
    [huggingface.co/docs/smolagents/index](https://huggingface.co/docs/smolagents/index);
    [huggingface.co/docs/smolagents/reference/agents](https://huggingface.co/docs/smolagents/reference/agents).
    The library''s two agent classes — `CodeAgent` and
    `ToolCallingAgent` — are named in the Agents reference; the
    construct surface is "agent," not "skill."

[^6]: LangChain, `langchain-core` — `Runnable` base class
    source, accessed 2026-05-23.
    [github.com/langchain-ai/langchain/blob/master/libs/core/langchain_core/runnables/base.py](https://github.com/langchain-ai/langchain/blob/master/libs/core/langchain_core/runnables/base.py).
    The `Runnable` abstraction is alive and canonical in
    `langchain-core` as the composable-unit primitive;
    distinct from the framework''s agent vocabulary
    ("agents", "tools"). Source pinned to the repo because the
    docs-site reference surface has been reshuffled and is
    less stable than the source-of-truth class definition.', 'Omitted. Anthropic did not publish an etymology, and the product
name appears chosen for the "custom onboarding materials" framing
[^2] rather than as a deliberate lineage from prior skill
literature. No demonstrable etymology of independent value to a
reader of this entry.

[^1]: Anthropic, *Agent Skills overview*, accessed 2026-05-23.
    [platform.claude.com/docs/en/agents-and-tools/agent-skills/overview](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/overview)

[^2]: Anthropic, *Equipping agents for the real world with Agent
    Skills*, 2025-10-16, accessed 2026-05-23.
    [claude.com/blog/skills](https://claude.com/blog/skills)
    (the original `anthropic.com/news/skills` URL 308-redirects to
    this destination as of 2026-05-23). An engineering deep-dive
    companion is published at
    [anthropic.com/engineering/equipping-agents-for-the-real-world-with-agent-skills](https://www.anthropic.com/engineering/equipping-agents-for-the-real-world-with-agent-skills).

[^3]: Anthropic, *anthropics/skills*, accessed 2026-05-23.
    [github.com/anthropics/skills](https://github.com/anthropics/skills)

[^4]: OpenAI, *Agents SDK — Tools* and *Agents SDK — Handoffs*,
    accessed 2026-05-23.
    [openai.github.io/openai-agents-python/tools/](https://openai.github.io/openai-agents-python/tools/);
    [openai.github.io/openai-agents-python/handoffs/](https://openai.github.io/openai-agents-python/handoffs/).
    The orchestration guide on the developer platform mirrors the
    "handoffs" terminology:
    [developers.openai.com/api/docs/guides/agents/orchestration](https://developers.openai.com/api/docs/guides/agents/orchestration).

[^5]: Hugging Face, *smolagents* (library index and Agents
    reference), accessed 2026-05-23.
    [huggingface.co/docs/smolagents/index](https://huggingface.co/docs/smolagents/index);
    [huggingface.co/docs/smolagents/reference/agents](https://huggingface.co/docs/smolagents/reference/agents).
    The library''s two agent classes — `CodeAgent` and
    `ToolCallingAgent` — are named in the Agents reference; the
    construct surface is "agent," not "skill."

[^6]: LangChain, `langchain-core` — `Runnable` base class
    source, accessed 2026-05-23.
    [github.com/langchain-ai/langchain/blob/master/libs/core/langchain_core/runnables/base.py](https://github.com/langchain-ai/langchain/blob/master/libs/core/langchain_core/runnables/base.py).
    The `Runnable` abstraction is alive and canonical in
    `langchain-core` as the composable-unit primitive;
    distinct from the framework''s agent vocabulary
    ("agents", "tools"). Source pinned to the repo because the
    docs-site reference surface has been reshuffled and is
    less stable than the source-of-truth class definition.', 'Inside the Anthropic ecosystem the construct converges; outside
it, the term of art does not transfer. Both halves of that picture
matter to a reader of this entry, and the facets below carry
primary-source citation each.

**Facet A — Anthropic platform sense (canonical).** A skill is a
folder containing a `SKILL.md` file with YAML frontmatter. The
frontmatter requires two fields: `name` (≤64 characters, lowercase
letters, digits, and hyphens) and `description` (≤1024 characters,
non-empty). The folder may bundle scripts, reference markdown, and
templates. Loading proceeds by three-level progressive disclosure:
Level 1 — metadata always loaded into context (on the order of
100 tokens per skill); Level 2 — the body of `SKILL.md` loaded when
the description matches the current task (under 5,000 tokens);
Level 3 — bundled files read on demand via the agent''s bash or
file-read tools (effectively unbounded). [^1]

**Facet B — Claude Code custom-skill sense.** Same shape, but
filesystem-based and not uploaded via API. Personal skills live at
`~/.claude/skills/`; project skills live at `.claude/skills/`. They
are discoverable and invocable through Claude Code''s `Skill` tool.
[^1]

**Facet C — Anthropic open-source skill repo.** Anthropic publishes
a public reference collection at
[github.com/anthropics/skills](https://github.com/anthropics/skills),
distributing skills in the same `SKILL.md` shape. [^3]

**Facet D — Pre-built skills on the claude.ai product surface.**
Skills for PowerPoint (`pptx`), Excel (`xlsx`), Word (`docx`), and
PDF ship with claude.ai out of the box. [^1]

**Convergence inside Anthropic is high.** Across claude.ai, the
Claude API, Claude Code, the AWS deployment, and Microsoft
Foundry, the `SKILL.md` format, the frontmatter contract, and the
progressive-disclosure loading model are one. [^1]

**Convergence outside Anthropic is not present.** No comparable
term of art has taken hold across the broader field. The closest
analogues at other vendors are differently named: OpenAI organizes
the same surface area around "tools" and the Agents SDK''s
"handoffs" [^4]; Hugging Face''s smolagents ships agent patterns
under that name [^5]; LangChain uses "agents" (with "tools")
and exposes a `Runnable` abstraction in `langchain-core` for
composable units [^6]. The asymmetry is the structural reading
§5 carries.

[^1]: Anthropic, *Agent Skills overview*, accessed 2026-05-23.
    [platform.claude.com/docs/en/agents-and-tools/agent-skills/overview](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/overview)

[^2]: Anthropic, *Equipping agents for the real world with Agent
    Skills*, 2025-10-16, accessed 2026-05-23.
    [claude.com/blog/skills](https://claude.com/blog/skills)
    (the original `anthropic.com/news/skills` URL 308-redirects to
    this destination as of 2026-05-23). An engineering deep-dive
    companion is published at
    [anthropic.com/engineering/equipping-agents-for-the-real-world-with-agent-skills](https://www.anthropic.com/engineering/equipping-agents-for-the-real-world-with-agent-skills).

[^3]: Anthropic, *anthropics/skills*, accessed 2026-05-23.
    [github.com/anthropics/skills](https://github.com/anthropics/skills)

[^4]: OpenAI, *Agents SDK — Tools* and *Agents SDK — Handoffs*,
    accessed 2026-05-23.
    [openai.github.io/openai-agents-python/tools/](https://openai.github.io/openai-agents-python/tools/);
    [openai.github.io/openai-agents-python/handoffs/](https://openai.github.io/openai-agents-python/handoffs/).
    The orchestration guide on the developer platform mirrors the
    "handoffs" terminology:
    [developers.openai.com/api/docs/guides/agents/orchestration](https://developers.openai.com/api/docs/guides/agents/orchestration).

[^5]: Hugging Face, *smolagents* (library index and Agents
    reference), accessed 2026-05-23.
    [huggingface.co/docs/smolagents/index](https://huggingface.co/docs/smolagents/index);
    [huggingface.co/docs/smolagents/reference/agents](https://huggingface.co/docs/smolagents/reference/agents).
    The library''s two agent classes — `CodeAgent` and
    `ToolCallingAgent` — are named in the Agents reference; the
    construct surface is "agent," not "skill."

[^6]: LangChain, `langchain-core` — `Runnable` base class
    source, accessed 2026-05-23.
    [github.com/langchain-ai/langchain/blob/master/libs/core/langchain_core/runnables/base.py](https://github.com/langchain-ai/langchain/blob/master/libs/core/langchain_core/runnables/base.py).
    The `Runnable` abstraction is alive and canonical in
    `langchain-core` as the composable-unit primitive;
    distinct from the framework''s agent vocabulary
    ("agents", "tools"). Source pinned to the repo because the
    docs-site reference surface has been reshuffled and is
    less stable than the source-of-truth class definition.', 'Four divergences matter to a reader who arrives at this entry from
an adjacent vocabulary.

**Skill vs. tool.** A *tool* (see entry #2) is a single
function-call interface defined by a function-calling
specification. A *skill* is a bundle — instructions plus optional
code plus optional resources — read from the filesystem, and a
skill commonly directs the agent to invoke one or more tools. The
asymmetry runs one way: a skill can invoke tools; a tool cannot
invoke a skill.

**Skill vs. MCP.** MCP (see entry #14) is a *protocol* for exposing
tools and resources to an agent across a server boundary. A skill
is a *filesystem artifact* loaded inside the agent''s runtime. MCP
provides tools to the agent; a skill orchestrates the agent''s use
of them. The two compose rather than compete.

**Skill vs. RL "skill."** In reinforcement-learning literature, a
skill is a *learned policy* or an option in the options framework.
Anthropic Skills are *authored*, not learned, and the body of a
skill is natural-language instructions rather than a parameterized
policy. A reader arriving from RL literature must mark this
disambiguation explicitly; the two senses share a word and almost
nothing else.

**Skill vs. plugin / extension.** Claude Code Plugins are a
delivery mechanism — a zipped distribution that installs into the
local Claude Code environment. Skills are the content shape a
plugin may carry. The two are orthogonal: a plugin can contain
skills; skills exist independently of any plugin distribution.

**Cross-vendor.** OpenAI''s term of art for the surface a skill
addresses is "tool" (and, for orchestration, "Agents SDK
handoffs") [^4]; Hugging Face uses "smolagents" patterns [^5];
LangChain uses "agents" (and exposes a `Runnable` abstraction
in `langchain-core` for composable units) [^6]. None of these
vendors uses the word "skill" for the analogous construct as of
this entry. The reader encountering "skill" outside the Anthropic
ecosystem in 2026 should expect a different meaning — usually the
colloquial one, or the RL one — rather than the construct defined
in §1.

[^1]: Anthropic, *Agent Skills overview*, accessed 2026-05-23.
    [platform.claude.com/docs/en/agents-and-tools/agent-skills/overview](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/overview)

[^2]: Anthropic, *Equipping agents for the real world with Agent
    Skills*, 2025-10-16, accessed 2026-05-23.
    [claude.com/blog/skills](https://claude.com/blog/skills)
    (the original `anthropic.com/news/skills` URL 308-redirects to
    this destination as of 2026-05-23). An engineering deep-dive
    companion is published at
    [anthropic.com/engineering/equipping-agents-for-the-real-world-with-agent-skills](https://www.anthropic.com/engineering/equipping-agents-for-the-real-world-with-agent-skills).

[^3]: Anthropic, *anthropics/skills*, accessed 2026-05-23.
    [github.com/anthropics/skills](https://github.com/anthropics/skills)

[^4]: OpenAI, *Agents SDK — Tools* and *Agents SDK — Handoffs*,
    accessed 2026-05-23.
    [openai.github.io/openai-agents-python/tools/](https://openai.github.io/openai-agents-python/tools/);
    [openai.github.io/openai-agents-python/handoffs/](https://openai.github.io/openai-agents-python/handoffs/).
    The orchestration guide on the developer platform mirrors the
    "handoffs" terminology:
    [developers.openai.com/api/docs/guides/agents/orchestration](https://developers.openai.com/api/docs/guides/agents/orchestration).

[^5]: Hugging Face, *smolagents* (library index and Agents
    reference), accessed 2026-05-23.
    [huggingface.co/docs/smolagents/index](https://huggingface.co/docs/smolagents/index);
    [huggingface.co/docs/smolagents/reference/agents](https://huggingface.co/docs/smolagents/reference/agents).
    The library''s two agent classes — `CodeAgent` and
    `ToolCallingAgent` — are named in the Agents reference; the
    construct surface is "agent," not "skill."

[^6]: LangChain, `langchain-core` — `Runnable` base class
    source, accessed 2026-05-23.
    [github.com/langchain-ai/langchain/blob/master/libs/core/langchain_core/runnables/base.py](https://github.com/langchain-ai/langchain/blob/master/libs/core/langchain_core/runnables/base.py).
    The `Runnable` abstraction is alive and canonical in
    `langchain-core` as the composable-unit primitive;
    distinct from the framework''s agent vocabulary
    ("agents", "tools"). Source pinned to the repo because the
    docs-site reference surface has been reshuffled and is
    less stable than the source-of-truth class definition.', NULL, NULL, 1, 'active', '2026-05-23T17:04:41.763Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at) VALUES ('2efc42ea-c0cd-4c7f-b234-556454d67988', 'skill', 'agent', '2026-05-23T17:04:41.763Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at) VALUES ('673bdec5-137d-48b7-95c3-abef03e1e78f', 'skill', 'tool', '2026-05-23T17:04:41.763Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at) VALUES ('bc113816-21eb-4c0f-b6e6-90afd640d4ea', 'skill', 'mcp', '2026-05-23T17:04:41.763Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at) VALUES ('d9c0eb53-1c27-4dd6-a808-a2ba5e333f95', 'skill', 'permission', '2026-05-23T17:04:41.763Z');

INSERT OR IGNORE INTO entries (id, slug, title, content_hash, definition, first_appearance, etymology, current_meaning, divergent_meanings, supersession_note, superseded_by_id, version, state, published_at) VALUES ('587ace24-eb95-4cb9-bc66-6c41459343de', 'eval', 'Eval', '18a5829603da5138', 'An **eval**, in the agentic and language-model context, is a
test-time scoring artifact — a dataset paired with a grading
procedure — run against a language model, or an agent built atop
one, to score the system on a specific capability or behavior.
What distinguishes the eval from the surrounding family of
testing constructs is *who authors it and for whom*: evals are
typically written by the system''s own builders (researchers,
infrastructure teams, product teams) during development, may be
private to that team, and need not be frozen across releases.
The verb "evaluate" predates the noun and remains in use; the
noun "eval" names the *artifact*, the verb "evaluate" names the
*act*.

OpenAI''s Evals framework states the bounding property in its
README, and is the strongest single quote for the plural-count-
noun form the field has settled on:

> "Evals provide a framework for evaluating large language
> models (LLMs) or systems built using LLMs. We offer an
> existing registry of evals to test different dimensions of
> OpenAI models and the ability to write your own custom evals
> for use cases you care about." [^1]

"An existing registry of evals" is doing the load-bearing work
here — "evals" is being used as a plural count noun for the test
artifacts themselves, not as a verb-form nominalization. The
shape implied by the README is exactly the one this entry
defines: a registry of named test artifacts, each runnable
against any model that conforms to a common interface, each
authored by builders for builders.

[^1]: OpenAI, *Evals* (README),
    [github.com/openai/evals](https://github.com/openai/evals),
    accessed 2026-05-23.

[^2]: Perez, Ringer, Lukošiūtė, et al., *Discovering Language
    Model Behaviors with Model-Written Evaluations*,
    arXiv:2212.09251, v1 2022-12-19, accessed 2026-05-23.
    [arxiv.org/abs/2212.09251](https://arxiv.org/abs/2212.09251)

[^3]: OpenAI, *GPT-4* (research announcement, 2023-03-14),
    accessed 2026-05-23.
    [openai.com/index/gpt-4-research/](https://openai.com/index/gpt-4-research/)

[^4]: UK AI Safety Institute, *Inspect AI* (framework site),
    accessed 2026-05-23.
    [inspect.aisi.org.uk](https://inspect.aisi.org.uk/)

[^5]: EleutherAI, *lm-evaluation-harness* (repository),
    accessed 2026-05-23.
    [github.com/EleutherAI/lm-evaluation-harness](https://github.com/EleutherAI/lm-evaluation-harness)

[^6]: Anthropic, *Evaluating feature steering: A case study in
    mitigating social biases*, accessed 2026-05-23.
    [anthropic.com/research/evaluating-feature-steering](https://www.anthropic.com/research/evaluating-feature-steering)', 'Two load-bearing first-appearances of the noun-form "eval" in
the agentic-context lineage sit within a six-month window. The
encyclopedia treats them as co-canonical; neither is privileged
ahead of the other:

- **Perez et al., 2022-12-19** — *Discovering Language Model
  Behaviors with Model-Written Evaluations*, arXiv:2212.09251.
  The paper''s title uses the long form "Evaluations," but the
  field''s reception of this paper as the canonical citation for
  "model-written evals" (noun, shortened) is the evidence that
  the noun-form crystallized in research-literature usage on
  this paper''s foundation. [^2]

- **OpenAI Evals, 2023-03-14** — the public release of the
  Evals framework alongside the GPT-4 launch. The README uses
  "evals" as a plural count noun in self-description ("registry
  of evals," "write your own custom evals"), establishing the
  noun-form in publicly-distributed framework code. [^1]

A note on the OpenAI Evals release date: the repository''s
GitHub Releases page carries no tagged releases as of
2026-05-23, so the 2023-03-14 date is sourced from the GPT-4
announcement post rather than a release artifact. [^3] A tighter
date can be obtained from the repository''s earliest commit via
`git log --reverse`; this draft leaves the announcement-derived
date in place and flags the provenance.

The underlying concept of *evaluating* a language model on a
held-out scoring artifact predates these two surfaces by
decades — train/test splits and held-out evaluation sets are
standard ML practice since at least the 1990s. The
first-appearance claim above is specifically about the
**noun-form "eval" as a named test artifact** in the
agentic-context lineage, not about the underlying practice of
evaluation.

[^1]: OpenAI, *Evals* (README),
    [github.com/openai/evals](https://github.com/openai/evals),
    accessed 2026-05-23.

[^2]: Perez, Ringer, Lukošiūtė, et al., *Discovering Language
    Model Behaviors with Model-Written Evaluations*,
    arXiv:2212.09251, v1 2022-12-19, accessed 2026-05-23.
    [arxiv.org/abs/2212.09251](https://arxiv.org/abs/2212.09251)

[^3]: OpenAI, *GPT-4* (research announcement, 2023-03-14),
    accessed 2026-05-23.
    [openai.com/index/gpt-4-research/](https://openai.com/index/gpt-4-research/)

[^4]: UK AI Safety Institute, *Inspect AI* (framework site),
    accessed 2026-05-23.
    [inspect.aisi.org.uk](https://inspect.aisi.org.uk/)

[^5]: EleutherAI, *lm-evaluation-harness* (repository),
    accessed 2026-05-23.
    [github.com/EleutherAI/lm-evaluation-harness](https://github.com/EleutherAI/lm-evaluation-harness)

[^6]: Anthropic, *Evaluating feature steering: A case study in
    mitigating social biases*, accessed 2026-05-23.
    [anthropic.com/research/evaluating-feature-steering](https://www.anthropic.com/research/evaluating-feature-steering)', '"Eval" had life as a noun before it entered the agentic context,
and one of its prior lives is the source of the most common
present-day misreading.

In English, "eval" was a colloquial shortening of "evaluation"
in performance-review and educational-assessment usage — worker
evals, course evals. The shape there is similar in feel
(scoring procedure, often rubric-graded, often bound to the
team or institution that owns it) but the referent is a person,
not a model.

In computing, "eval" referred chiefly to the Lisp and Python
`eval()` function — a runtime expression evaluator that takes
source text and executes it. This usage is *unrelated* to the
agentic-context sense and naming the collision explicitly is
worth a sentence: a reader coming from a programming-language
background may parse "eval" as the runtime function long enough
to be confused.

The agentic-context noun-form is a fresh narrowing: not a
performance review, not an `eval()` call, but a *test-time
scoring artifact for a language model*. The narrowing settled
into the field between 2022 and 2024 through OpenAI Evals''
framework usage, Perez 2022''s research lineage, and downstream
eval-harness projects (Inspect AI, lm-evaluation-harness)
adopting the noun in their own framing.

Including the etymology is recommended rather than optional
because the noun''s colloquial ergonomics — short, familiar from
worker-eval usage, easy to drop into casual prose — is part of
why the eval-vs-benchmark confusion catalogued in §5 is so
common. Practitioners reach for "eval" because the word is
ready to hand, not because they have deliberately chosen it
over "benchmark."

[^1]: OpenAI, *Evals* (README),
    [github.com/openai/evals](https://github.com/openai/evals),
    accessed 2026-05-23.

[^2]: Perez, Ringer, Lukošiūtė, et al., *Discovering Language
    Model Behaviors with Model-Written Evaluations*,
    arXiv:2212.09251, v1 2022-12-19, accessed 2026-05-23.
    [arxiv.org/abs/2212.09251](https://arxiv.org/abs/2212.09251)

[^3]: OpenAI, *GPT-4* (research announcement, 2023-03-14),
    accessed 2026-05-23.
    [openai.com/index/gpt-4-research/](https://openai.com/index/gpt-4-research/)

[^4]: UK AI Safety Institute, *Inspect AI* (framework site),
    accessed 2026-05-23.
    [inspect.aisi.org.uk](https://inspect.aisi.org.uk/)

[^5]: EleutherAI, *lm-evaluation-harness* (repository),
    accessed 2026-05-23.
    [github.com/EleutherAI/lm-evaluation-harness](https://github.com/EleutherAI/lm-evaluation-harness)

[^6]: Anthropic, *Evaluating feature steering: A case study in
    mitigating social biases*, accessed 2026-05-23.
    [anthropic.com/research/evaluating-feature-steering](https://www.anthropic.com/research/evaluating-feature-steering)', 'The noun-form''s present usage is faceted; the encyclopedia owes
each facet its own citation rather than collapsing them.

**Facet A — framework / registry sense.** A reusable framework
of named test artifacts, each carrying a dataset and a grading
procedure, runnable against any model that implements a common
interface. The individual artifacts inside the framework are
each an "eval." The canonical reference is the OpenAI Evals
project; Inspect AI [^4] and EleutherAI''s lm-evaluation-harness
[^5] are two further surfaces operating in this sense.

> "We offer an existing registry of evals to test different
> dimensions of OpenAI models and the ability to write your own
> custom evals for use cases you care about." [^1]

**Facet B — per-feature in-house grading suite.** In
practitioner writing — vendor announcements, deployment
write-ups, infrastructure-team documentation — "evals" refers
to the in-house grading suites teams run during development of
a model, agent, or feature. The dataset may be private; the
grader may be a human, a rubric, or an LLM-as-judge call; and
the suite changes as the system under development changes.
Anthropic''s *Evaluating feature steering* uses the noun in this
sense:

> "We also used a subset of the model-written evals dataset
> targeted to our list of features." [^6]

The same post uses the long-form "evaluations" in a neighboring
sentence:

> "We ran capabilities evaluations to determine the useful
> range of possible steering factors." [^6]

The first quote uses the count-noun "evals" (Facet B); the
second uses the verb-form nominalization "evaluations." Both
senses coexist in practitioner writing without contradiction,
and the coexistence is part of why the noun has resisted
displacing the long form.

**Facet C — model-written evals lineage.** A specific subgenre
of evals where the test itself is generated by a language model
rather than hand-authored. The subgenre is named after, and
grounded by, Perez et al. 2022:

> "Here, we automatically generate evaluations with LMs." [^2]

The model-written-evals lineage is distinct enough from Facets
A and B — the *origin* of the artifact, not just its content,
is what defines the subgenre — that the field treats it as its
own category worth naming. It is one sub-genre within the
broader noun, not the canonical sense of the noun.

**Facet D — LLM-as-judge eval.** A grading procedure where a
language model scores the output of the model under test, often
by rubric. The phrase "LLM-as-judge eval" entered the
vernacular between 2023 and 2024 and is increasingly common in
practitioner writing. This entry names the facet without
carrying a deeper treatment; a separate encyclopedia entry on
LLM-as-judge can pick the thread up in a later bootstrap pass.

[^1]: OpenAI, *Evals* (README),
    [github.com/openai/evals](https://github.com/openai/evals),
    accessed 2026-05-23.

[^2]: Perez, Ringer, Lukošiūtė, et al., *Discovering Language
    Model Behaviors with Model-Written Evaluations*,
    arXiv:2212.09251, v1 2022-12-19, accessed 2026-05-23.
    [arxiv.org/abs/2212.09251](https://arxiv.org/abs/2212.09251)

[^3]: OpenAI, *GPT-4* (research announcement, 2023-03-14),
    accessed 2026-05-23.
    [openai.com/index/gpt-4-research/](https://openai.com/index/gpt-4-research/)

[^4]: UK AI Safety Institute, *Inspect AI* (framework site),
    accessed 2026-05-23.
    [inspect.aisi.org.uk](https://inspect.aisi.org.uk/)

[^5]: EleutherAI, *lm-evaluation-harness* (repository),
    accessed 2026-05-23.
    [github.com/EleutherAI/lm-evaluation-harness](https://github.com/EleutherAI/lm-evaluation-harness)

[^6]: Anthropic, *Evaluating feature steering: A case study in
    mitigating social biases*, accessed 2026-05-23.
    [anthropic.com/research/evaluating-feature-steering](https://www.anthropic.com/research/evaluating-feature-steering)', '**Load-bearing.** This section distinguishes *eval* from
*benchmark* (entry #13); both entries cross-reference each
other''s §5 because the two terms are routinely confused in 2026
vernacular, and the encyclopedia''s value to a reader is in
holding the distinction.

- **Eval**, in 2026 practitioner vernacular, has broadened to
  mean any test-time scoring of a model or agent. It may be
  private (an in-house suite that is never published); it may
  be graded by a human, a rubric, or an LLM-as-judge call; and
  it may change between releases of the system being tested.
  The artifact''s lifecycle is bound to the team that owns it,
  not to the field at large. A score from an eval is meaningful
  *within* the team and *for* the system it was authored
  against; it does not, on its own, carry comparability claims
  beyond that scope.

- **Benchmark** (entry #13) retains the connotation of a
  *curated, frozen, shared, reproducible* artifact. The dataset
  is published, the scoring protocol is specified, scores from
  different systems are comparable, and the benchmark itself
  persists as a thing across model releases. HELM, MMLU, and
  SWE-bench are the same artifacts whether GPT-4 or Claude 4.7
  is being scored against them.

A reader who treats the two words as interchangeable will
misread in one of two directions:

1. **Eval-as-benchmark misread.** A practitioner writes "we
   evaluated our model on a custom eval and it scored 87%"; a
   reader treats "87%" as a benchmark-comparable score. It is
   not. The eval is private, the grading rubric may differ from
   other evals, and the score is meaningful only inside the
   team that authored the eval. Treating it as a portable
   number over-claims what the eval is for.

2. **Benchmark-as-eval misread.** A research paper reports a
   benchmark score and a reader files it as "just an eval the
   authors ran." It is not. The benchmark is a shared artifact
   whose score is meaningful precisely *because* every other
   system has scored against the same dataset under the same
   protocol; treating it as one team''s in-house grading suite
   discards the comparability claim that motivates the
   benchmark''s existence.

Both directions of misreading are common in 2026 and are the
most-load-bearing reason this entry pairs with #13.

Adjacent distinction worth naming briefly: an **eval harness**
(lm-evaluation-harness, Inspect AI) is the *runner* that
executes evals — the engine, not the artifact. Not every eval
requires a harness; most published frameworks ship one. The
distinction matters because "eval harness" is sometimes
shortened to "eval" in conversational usage, which collapses
the runner and the artifact into one word.

[^1]: OpenAI, *Evals* (README),
    [github.com/openai/evals](https://github.com/openai/evals),
    accessed 2026-05-23.

[^2]: Perez, Ringer, Lukošiūtė, et al., *Discovering Language
    Model Behaviors with Model-Written Evaluations*,
    arXiv:2212.09251, v1 2022-12-19, accessed 2026-05-23.
    [arxiv.org/abs/2212.09251](https://arxiv.org/abs/2212.09251)

[^3]: OpenAI, *GPT-4* (research announcement, 2023-03-14),
    accessed 2026-05-23.
    [openai.com/index/gpt-4-research/](https://openai.com/index/gpt-4-research/)

[^4]: UK AI Safety Institute, *Inspect AI* (framework site),
    accessed 2026-05-23.
    [inspect.aisi.org.uk](https://inspect.aisi.org.uk/)

[^5]: EleutherAI, *lm-evaluation-harness* (repository),
    accessed 2026-05-23.
    [github.com/EleutherAI/lm-evaluation-harness](https://github.com/EleutherAI/lm-evaluation-harness)

[^6]: Anthropic, *Evaluating feature steering: A case study in
    mitigating social biases*, accessed 2026-05-23.
    [anthropic.com/research/evaluating-feature-steering](https://www.anthropic.com/research/evaluating-feature-steering)', 'Omitted per receipts §7. The noun-form "eval" has not
superseded "evaluation" — the long form remains standard in
formal prose, and the two coexist within single practitioner
documents (see §4 Facet B). No specific eval framework has
superseded another in the way a saturated benchmark might be
displaced; the framework landscape is additive rather than
successional.

[^1]: OpenAI, *Evals* (README),
    [github.com/openai/evals](https://github.com/openai/evals),
    accessed 2026-05-23.

[^2]: Perez, Ringer, Lukošiūtė, et al., *Discovering Language
    Model Behaviors with Model-Written Evaluations*,
    arXiv:2212.09251, v1 2022-12-19, accessed 2026-05-23.
    [arxiv.org/abs/2212.09251](https://arxiv.org/abs/2212.09251)

[^3]: OpenAI, *GPT-4* (research announcement, 2023-03-14),
    accessed 2026-05-23.
    [openai.com/index/gpt-4-research/](https://openai.com/index/gpt-4-research/)

[^4]: UK AI Safety Institute, *Inspect AI* (framework site),
    accessed 2026-05-23.
    [inspect.aisi.org.uk](https://inspect.aisi.org.uk/)

[^5]: EleutherAI, *lm-evaluation-harness* (repository),
    accessed 2026-05-23.
    [github.com/EleutherAI/lm-evaluation-harness](https://github.com/EleutherAI/lm-evaluation-harness)

[^6]: Anthropic, *Evaluating feature steering: A case study in
    mitigating social biases*, accessed 2026-05-23.
    [anthropic.com/research/evaluating-feature-steering](https://www.anthropic.com/research/evaluating-feature-steering)', NULL, 1, 'active', '2026-05-23T17:04:41.763Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at) VALUES ('3031a8aa-3afd-45e7-84d3-e2533a635dd2', 'eval', 'benchmark', '2026-05-23T17:04:41.763Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at) VALUES ('d460077a-dd5f-472c-a756-cdf4567321fe', 'eval', 'model', '2026-05-23T17:04:41.763Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at) VALUES ('831caa5e-e755-4434-8ce9-9189724a3e84', 'eval', 'agent', '2026-05-23T17:04:41.763Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at) VALUES ('fb421b88-3782-4fc7-88d5-297f74bbfe32', 'eval', 'prompt', '2026-05-23T17:04:41.763Z');

INSERT OR IGNORE INTO entries (id, slug, title, content_hash, definition, first_appearance, etymology, current_meaning, divergent_meanings, supersession_note, superseded_by_id, version, state, published_at) VALUES ('c27096f7-8efe-4f6c-bbb6-c42951ffa61a', 'benchmark', 'Benchmark', 'd5552a2b57d8e434', 'A **benchmark**, in the agentic and language-model context,
is a curated dataset paired with a specified scoring protocol
against which models (or agents built atop them) are scored
reproducibly, typically with a public leaderboard ranking
systems by the protocol''s metrics. The defining properties
are three: the dataset is fixed and shared, so scores from
different systems and different time-points are comparable;
the scoring procedure is specified, not left to each
evaluator''s discretion; and results are publicly reportable.

HELM frames the property explicitly and positions itself as
the surface where the property is enforced at scale: "We
intend for HELM to be a living benchmark for the community,
continuously updated with new scenarios, metrics, and
models." [^1] The same paper, on the act of scoring against
that surface: "now all 30 models have been densely
benchmarked on the same core scenarios and metrics under
standardized conditions." [^1]

The "living benchmark" frame is load-bearing. A benchmark is
not a one-off measurement; it is a *standing artifact* that
persists across model releases and accumulates a comparable
score history.

[^1]: Liang et al., *Holistic Evaluation of Language Models*
    (HELM), arXiv:2211.09110, v1 2022-11-16, v2 2023-10-01,
    accessed 2026-05-23.
    [arxiv.org/abs/2211.09110](https://arxiv.org/abs/2211.09110)

[^2]: Hendrycks, Burns, Basart, Zou, Mazeika, Song,
    Steinhardt, *Measuring Massive Multitask Language
    Understanding* (MMLU), arXiv:2009.03300, v1 2020-09-07,
    v3 2021-01-12, accessed 2026-05-23.
    [arxiv.org/abs/2009.03300](https://arxiv.org/abs/2009.03300)

[^3]: Jimenez, Yang, Wettig, Yao, Pei, Press, Narasimhan,
    *SWE-bench: Can Language Models Resolve Real-World
    GitHub Issues?*, arXiv:2310.06770, v1 2023-10-10,
    v3 2024-11-11, accessed 2026-05-23.
    [arxiv.org/abs/2310.06770](https://arxiv.org/abs/2310.06770)', 'The English word "benchmark" predates ML by centuries
(surveyor''s fixed mark; then any reference standard) and
entered computing first as a hardware-performance term
(SPEC, TPC). The agentic-context usage is a continuation of
the computing sense, not a new coinage, and no single paper
or post owns "first appearance" of *benchmark* in agentic
context.

What does have a load-bearing lineage is the small set of
benchmarks whose reception shaped the 2026 vernacular:

- **MMLU — first widely-adopted multi-task LM benchmark.**
  Hendrycks, Burns, Basart, Zou, Mazeika, Song, Steinhardt,
  *Measuring Massive Multitask Language Understanding*,
  arXiv:2009.03300, v1 2020-09-07. [^2] The paper introduces
  "a test covering 57 academic and professional domains";
  notably, the word "benchmark" does not appear in the
  abstract. The field''s *reception* of MMLU as a benchmark
  is what is load-bearing — practitioners and researchers
  alike refer to it as one — not a benchmark-noun quote from
  the paper itself.

- **HELM — first holistic-evaluation framework explicitly
  framed as a *living* benchmark.** Liang et al., *Holistic
  Evaluation of Language Models*, arXiv:2211.09110,
  v1 2022-11-16. [^1] The "living benchmark" phrasing —
  continuously updated, not frozen at publication — enters
  the field''s working vocabulary here.

- **SWE-bench — load-bearing for the agentic-context sense.**
  Jimenez, Yang, Wettig, Yao, Pei, Press, Narasimhan,
  *SWE-bench: Can Language Models Resolve Real-World GitHub
  Issues?*, arXiv:2310.06770, v1 2023-10-10. [^3] The
  abstract characterizes itself as "an evaluation framework
  consisting of 2,294 software engineering problems drawn
  from real GitHub issues and corresponding pull requests
  across 12 popular Python repositories." The name carries
  "bench"; the field''s reception is as a benchmark for
  multi-turn tool-using agents resolving real software
  tasks. SWE-bench is what crystallized "agentic benchmark"
  as a distinct sub-category in 2026 vernacular.

The lineage is conceptually continuous from the
computing-performance sense — fixed shared reference,
specified protocol, comparable scores — to the LM and
agentic instances. What MMLU / HELM / SWE-bench contribute
is not the concept of a benchmark but the specific shape the
agentic-context vocabulary inherits.

[^1]: Liang et al., *Holistic Evaluation of Language Models*
    (HELM), arXiv:2211.09110, v1 2022-11-16, v2 2023-10-01,
    accessed 2026-05-23.
    [arxiv.org/abs/2211.09110](https://arxiv.org/abs/2211.09110)

[^2]: Hendrycks, Burns, Basart, Zou, Mazeika, Song,
    Steinhardt, *Measuring Massive Multitask Language
    Understanding* (MMLU), arXiv:2009.03300, v1 2020-09-07,
    v3 2021-01-12, accessed 2026-05-23.
    [arxiv.org/abs/2009.03300](https://arxiv.org/abs/2009.03300)

[^3]: Jimenez, Yang, Wettig, Yao, Pei, Press, Narasimhan,
    *SWE-bench: Can Language Models Resolve Real-World
    GitHub Issues?*, arXiv:2310.06770, v1 2023-10-10,
    v3 2024-11-11, accessed 2026-05-23.
    [arxiv.org/abs/2310.06770](https://arxiv.org/abs/2310.06770)', 'Pre-ML, the word "benchmark" denotes a surveyor''s mark
chiseled into a fixed object as a horizontal reference for
leveling instruments. By extension it generalized to any
fixed reference standard. The computing lineage carries the
sense forward — SPEC CPU and TPC are benchmarks in the
"fixed shared reference for performance" sense — and the ML
lineage (MNIST, ImageNet, then MMLU / HELM / SWE-bench)
inherits the frame.

The "fixed shared reference standard" property is what
distinguishes benchmark from eval in §5. The etymology
section is brief by design, but the lineage is load-bearing
for that distinction; an entry that omits the etymology
loses the grounding §5 leans on.

[^1]: Liang et al., *Holistic Evaluation of Language Models*
    (HELM), arXiv:2211.09110, v1 2022-11-16, v2 2023-10-01,
    accessed 2026-05-23.
    [arxiv.org/abs/2211.09110](https://arxiv.org/abs/2211.09110)

[^2]: Hendrycks, Burns, Basart, Zou, Mazeika, Song,
    Steinhardt, *Measuring Massive Multitask Language
    Understanding* (MMLU), arXiv:2009.03300, v1 2020-09-07,
    v3 2021-01-12, accessed 2026-05-23.
    [arxiv.org/abs/2009.03300](https://arxiv.org/abs/2009.03300)

[^3]: Jimenez, Yang, Wettig, Yao, Pei, Press, Narasimhan,
    *SWE-bench: Can Language Models Resolve Real-World
    GitHub Issues?*, arXiv:2310.06770, v1 2023-10-10,
    v3 2024-11-11, accessed 2026-05-23.
    [arxiv.org/abs/2310.06770](https://arxiv.org/abs/2310.06770)', 'Three facets in current use. Each primary-source cited.

**Facet A — research / NLP lineage (dataset + scoring
protocol).** The canonical sense. A benchmark is a curated,
frozen dataset paired with a specified scoring protocol;
results from different systems are comparable because the
dataset and protocol are shared. MMLU [^2], HELM [^1], and
SWE-bench [^3] all fit this sense. SWE-bench''s own framing
is load-bearing for the agentic sub-category: "we introduce
SWE-bench, an evaluation framework consisting of 2,294
software engineering problems drawn from real GitHub issues
and corresponding pull requests across 12 popular Python
repositories." [^3] The agentic-context inflection inside
this facet is that the dataset items are *tasks* (resolve
this issue, complete this trajectory), not single-turn
classification or generation prompts; the scoring protocol
must accommodate multi-turn tool-using execution.

**Facet B — verb form ("to benchmark").** To benchmark a
system is to run it through a standardized scoring protocol
against a shared dataset and report the score. The verb form
is used in both research and practitioner writing and
inherits the rigor of Facet A by default. The HELM abstract
is the load-bearing primary-source instance: "now all 30
models have been densely benchmarked on the same core
scenarios and metrics under standardized conditions." [^1]
The verb is transitive (benchmark a model, benchmark a
system) and almost always presupposes the shared-dataset
condition of Facet A.

**Facet C — broader colloquial sense.** "Benchmark" used
loosely in practitioner and vendor writing as a synonym for
"test result on something published," often without the
dataset+protocol rigor of Facet A. A vendor announcement of
the form "we benchmarked our model against GPT-X" may mean
no more than "we ran a comparison and the numbers favored
us"; the dataset may be private, the protocol unspecified,
and the score not independently reproducible. The colloquial
sense is widely attested in product launch material and
marketing surfaces, and is the source of the drift §5
addresses.

The three facets are not redundant. Facet A is the research
canonical, Facet B is the verb form that inherits Facet A''s
rigor, and Facet C is the colloquial drift that *loses* that
rigor. A reader fluent in one will not automatically read
correctly across the others — the same surface word carries
different epistemic weight in each.

[^1]: Liang et al., *Holistic Evaluation of Language Models*
    (HELM), arXiv:2211.09110, v1 2022-11-16, v2 2023-10-01,
    accessed 2026-05-23.
    [arxiv.org/abs/2211.09110](https://arxiv.org/abs/2211.09110)

[^2]: Hendrycks, Burns, Basart, Zou, Mazeika, Song,
    Steinhardt, *Measuring Massive Multitask Language
    Understanding* (MMLU), arXiv:2009.03300, v1 2020-09-07,
    v3 2021-01-12, accessed 2026-05-23.
    [arxiv.org/abs/2009.03300](https://arxiv.org/abs/2009.03300)

[^3]: Jimenez, Yang, Wettig, Yao, Pei, Press, Narasimhan,
    *SWE-bench: Can Language Models Resolve Real-World
    GitHub Issues?*, arXiv:2310.06770, v1 2023-10-10,
    v3 2024-11-11, accessed 2026-05-23.
    [arxiv.org/abs/2310.06770](https://arxiv.org/abs/2310.06770)', '**Load-bearing.** This section distinguishes *benchmark*
from *eval* (entry #12); both entries cross-reference each
other''s §5 because the two terms are routinely confused in
2026 vernacular and the encyclopedia''s value to a reader is
in holding the distinction.

- **Benchmark** retains the connotation of a *curated,
  frozen, shared, reproducible artifact*. The dataset is
  published; the protocol is specified; scores from
  different systems are comparable; and the benchmark itself
  is a thing that persists across model releases (HELM is
  the same HELM whether GPT-4 or Claude 4.7 is being
  scored). The "living benchmark" framing is not a
  contradiction of this: HELM''s scenarios and metrics
  evolve, but the artifact itself — the surface, the
  protocol, the published comparable scores — persists. [^1]

- **Eval** has broadened, in 2026 practitioner vernacular,
  to mean any test-time scoring of a model — often
  production / online / per-feature — and is frequently the
  practitioner''s word for the in-house, often-changing test
  suites used during development. An eval may be a private
  dataset, a rubric-graded LLM-as-judge call, or a CI smoke
  test. Eval does not carry the shared-artifact connotation
  that benchmark does.

A reader who treats "benchmark" and "eval" as
interchangeable will misread in one of two directions:
either a research paper''s *benchmark* will be read as a
casual test (losing the comparability claim), or a
practitioner''s *eval* will be read as a citable comparable
score (over-claiming the result''s portability). Both
directions of misreading are common in 2026.

The colloquial sense surfaced in §4 Facet C is the bridge
where the confusion enters: when a vendor "benchmarks" a
model against a competitor without specifying dataset and
protocol, the word is being used in the looser sense — and
a reader who carries the looser sense forward into research
literature will misread the field''s stricter usage.

Adjacent distinction worth naming briefly: a **leaderboard**
is the score-ranking surface a benchmark publishes (HELM''s
[crfm.stanford.edu/helm/](https://crfm.stanford.edu/helm/),
SWE-bench''s [swebench.com](https://www.swebench.com/)). Not
every eval has a leaderboard; most public benchmarks do.
The leaderboard is the visible artifact of the
shared-reproducible-score property; its presence is one
practical signal that a thing is operating as a benchmark
in Facet A''s sense rather than Facet C''s.

[^1]: Liang et al., *Holistic Evaluation of Language Models*
    (HELM), arXiv:2211.09110, v1 2022-11-16, v2 2023-10-01,
    accessed 2026-05-23.
    [arxiv.org/abs/2211.09110](https://arxiv.org/abs/2211.09110)

[^2]: Hendrycks, Burns, Basart, Zou, Mazeika, Song,
    Steinhardt, *Measuring Massive Multitask Language
    Understanding* (MMLU), arXiv:2009.03300, v1 2020-09-07,
    v3 2021-01-12, accessed 2026-05-23.
    [arxiv.org/abs/2009.03300](https://arxiv.org/abs/2009.03300)

[^3]: Jimenez, Yang, Wettig, Yao, Pei, Press, Narasimhan,
    *SWE-bench: Can Language Models Resolve Real-World
    GitHub Issues?*, arXiv:2310.06770, v1 2023-10-10,
    v3 2024-11-11, accessed 2026-05-23.
    [arxiv.org/abs/2310.06770](https://arxiv.org/abs/2310.06770)', 'Omitted per receipts §7. No specific benchmark has been
formally superseded in the agentic-context vernacular;
saturated benchmarks (GLUE, SuperGLUE) are spoken of as
"saturated," not as superseded, and HELM is positioned as a
*living* benchmark explicitly to forestall the question.

[^1]: Liang et al., *Holistic Evaluation of Language Models*
    (HELM), arXiv:2211.09110, v1 2022-11-16, v2 2023-10-01,
    accessed 2026-05-23.
    [arxiv.org/abs/2211.09110](https://arxiv.org/abs/2211.09110)

[^2]: Hendrycks, Burns, Basart, Zou, Mazeika, Song,
    Steinhardt, *Measuring Massive Multitask Language
    Understanding* (MMLU), arXiv:2009.03300, v1 2020-09-07,
    v3 2021-01-12, accessed 2026-05-23.
    [arxiv.org/abs/2009.03300](https://arxiv.org/abs/2009.03300)

[^3]: Jimenez, Yang, Wettig, Yao, Pei, Press, Narasimhan,
    *SWE-bench: Can Language Models Resolve Real-World
    GitHub Issues?*, arXiv:2310.06770, v1 2023-10-10,
    v3 2024-11-11, accessed 2026-05-23.
    [arxiv.org/abs/2310.06770](https://arxiv.org/abs/2310.06770)', NULL, 1, 'active', '2026-05-23T17:04:41.763Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at) VALUES ('678cdb57-215d-4fb4-afb5-51f7116b2bf0', 'benchmark', 'eval', '2026-05-23T17:04:41.763Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at) VALUES ('a66aa9ac-8ab0-4fad-9b1a-374679d76cf3', 'benchmark', 'model', '2026-05-23T17:04:41.763Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at) VALUES ('87be7a2b-5fb8-4032-b1b3-c14c7a899e00', 'benchmark', 'leaderboard', '2026-05-23T17:04:41.763Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at) VALUES ('69f70ff3-ac13-4cd2-80e1-a0f7866e1804', 'benchmark', 'dataset', '2026-05-23T17:04:41.763Z');
