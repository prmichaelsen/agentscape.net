-- migrations/0004-seed-issue-1-n1.sql
-- Forward-only seed for issue #1 section N1 (subagent/delegation).
-- Editor-PASS verbatim body. Verifier-PASS citation chain.
PRAGMA foreign_keys = ON;

-- FR9 — best-practices spine + category tags (first appearance)
INSERT OR IGNORE INTO spine_tags (id, slug, label, description) VALUES
  ('spine-best-practices', 'spine-best-practices', 'What best practices are being made',
   'Sub-question: what best practices, constraints, and harnesses are being made across runtimes?');

INSERT OR IGNORE INTO category_tags (id, slug, label, description) VALUES
  ('cat-best-practices', 'cat-best-practices', 'Best practice',
   'Pieces reporting practices that have crystallized across independent shippers.');

-- FR4 — longform body
INSERT OR IGNORE INTO longform (id, slug, title, body, version, published_at) VALUES
  ('lf-issue-1-N1', 'subagent-delegation-primitive',
   'The delegation primitive ships in four runtimes; the isolation policy does not',
   '# The delegation primitive ships in four runtimes; the isolation policy does not

A practice becomes best-practice not when one team adopts it but when
independent teams ship it without coordinating, in shapes a reader
can compare side by side. Between Q1 2025 and Q1 2026, four
independent agent runtimes — Claude Code, the OpenAI Agents SDK,
Hugging Face''s smolagents, and the LangGraph supervisor library —
shipped the same primitive: a parent agent delegates a goal-shaped
subtask to a child agent that carries its own tool set and returns a
result. The vocabulary varies — *subagent*, *handoff*, *managed
agent*, *supervisor pattern* — but the primary-source docs describe
the same shape. That is the convergence. What the four runtimes do
*not* converge on is whether the child sees the parent''s
conversation history. The primitive has settled; the isolation
policy has not.

## The four runtimes

**Claude Code (Anthropic).** The
[Claude Code subagents documentation](https://code.claude.com/docs/en/sub-agents)
states: *"Each subagent runs in its own context window with a custom
system prompt, specific tool access, and independent permissions."*
The framing leads with the side-task case: *"Use one when a side
task would flood your main conversation with search results, logs,
or file contents you won''t reference again: the subagent does that
work in its own context and returns only the summary."* Strict
context isolation is the headline benefit, not a configurable knob.

**OpenAI Agents SDK.** The
[handoffs documentation](https://openai.github.io/openai-agents-python/handoffs/)
frames the same operation as: *"Handoffs allow an agent to delegate
tasks to another agent. This is particularly useful in scenarios
where different agents specialize in distinct areas."* The default
context policy is the opposite of Claude Code''s: *"When a handoff
occurs, it''s as though the new agent takes over the conversation,
and gets to see the entire previous conversation history."*
Isolation is opt-in via an `input_filter` mechanism, with a
nested-handoff beta that collapses the prior transcript into a
single summary message wrapped in a `<CONVERSATION HISTORY>` block.

**smolagents (Hugging Face).** The
[multi-agent walkthrough](https://huggingface.co/docs/smolagents/en/examples/multiagents)
documents a hierarchical *manager agent* invoking *managed agents*
whose `name` and `description` are *"mandatory attributes to make
this agent callable by its manager agent."* The worked example wires
a manager into a `managed_agents=[web_agent]` composition.
Isolation here is implicit in the agent-as-tool shape rather than
named as a policy.

**LangGraph supervisor (LangChain).** The
[langgraph-supervisor-py repository](https://github.com/langchain-ai/langgraph-supervisor-py)
describes the same operation in supervisor framing: *"Specialized
agents are coordinated by a central supervisor agent. The supervisor
controls all communication flow and task delegation."* Context
policy is configurable — `full_history` passes the complete message
record to the child agent, `last_message` passes only final
responses. The library''s latest release (0.0.31, November 2025;
twenty-eight releases total) indicates active maintenance through
the research window.

## The convergence is the primitive

Four runtimes, four maintainers, no shared author. Each ships a
parent-invokes-child pattern with a goal, a tool set, and a return
value. The shape is the same; the words are different. *Subagent*,
*handoff*, *managed agent*, *supervisor pattern* are dialect, not
disagreement. The operational craft this names — split a long-
horizon task into delegable subgoals, hand each to an agent with the
narrower tool set it needs, surface only the result back into the
parent''s trace — is no longer one team''s practice. It is a primitive
the field treats as load-bearing enough to put in shipping APIs.

## The isolation policy is not converged

The variance is structural, not cosmetic. Claude Code''s strict
isolation and the OpenAI Agents SDK''s full-history default sit at
opposite ends of the same axis. A user moving between the two
runtimes meets a different default contract about what the child
agent knows. smolagents leaves the policy implicit in composition;
LangGraph supervisor exposes it as a parameter. Four implementations,
two opposed defaults, one configurable knob, one implicit shape.

What this says about the field''s mental model: the *what* of
delegation has settled faster than the *how much context travels
with it*. The latter question — how much of the parent''s state the
child should inherit by default — remains open across the four
shipping runtimes. A practitioner picking between them is picking,
in part, an isolation default.

## A counter-signal that points the other way

The LangGraph supervisor repository carries a maintainer note:
*"We now recommend using the supervisor pattern directly via tools
rather than this library for most use cases."* Read in isolation,
this is a small deprecation. Read against the four-runtime
convergence, it is evidence that the primitive is generalizing
*past* dedicated framework support — surfacing as a tool-calling
idiom that does not need a library to name it. The pattern is
escaping the libraries that named it; that is what a load-bearing
primitive looks like at the stage where it stops being a feature and
becomes a default.

No 2025-26 *"we removed subagents"* counter-pattern surfaced during
the research window. The closest signal is the LangGraph note, and
it points toward the primitive rather than away from it. Absence is
not proof — the field is large and a removal pattern may yet
appear — but the receipt for the current window is that no public
removal has been published.

## What this section does not claim

Cost and latency comparisons across the four runtimes are absent
from this piece on purpose. No primary source quantifying subagent
spend against parent-agent spend surfaced during the research
window. The structural pressure is real — each subagent is an
additional model call against an additional context — but ranges
are not cited here because the receipts to defend them did not
land.

---

## Sources

- Claude Code — subagents documentation:
  [code.claude.com/docs/en/sub-agents](https://code.claude.com/docs/en/sub-agents)
  *(verifier: confirm URL resolves and the quoted isolation framing
  is present as of draft time)*
- OpenAI Agents SDK — handoffs documentation:
  [openai.github.io/openai-agents-python/handoffs](https://openai.github.io/openai-agents-python/handoffs/)
  *(verifier: confirm URL and the quoted "entire previous
  conversation history" framing; confirm the `input_filter` and
  nested-handoff beta language is current)*
- smolagents — multi-agent example:
  [huggingface.co/docs/smolagents/en/examples/multiagents](https://huggingface.co/docs/smolagents/en/examples/multiagents)
  *(verifier: confirm URL and that `managed_agents` composition is
  the documented pattern)*
- LangGraph supervisor — repository:
  [github.com/langchain-ai/langgraph-supervisor-py](https://github.com/langchain-ai/langgraph-supervisor-py)
  *(verifier: confirm the repo exists, the supervisor framing
  quote is present in the README, the `full_history` /
  `last_message` parameter is documented, and the "we now
  recommend using the supervisor pattern directly via tools"
  maintainer note is still in the README at draft time)*

## Conflict of interest disclosure

Reflection, the publication''s parent substrate, uses a subagent-
shaped primitive internally (the track topology). Reflection does
not author, maintain, or co-sponsor any of the four runtimes named
in this piece. None of the four runtimes is cited as an exemplar of
Reflection''s practice. This disclosure satisfies the charter''s
conflict-of-interest standard.
',
   1, '2026-05-23');

-- FR3 — section row, joined to longform
INSERT OR IGNORE INTO sections
  (id, issue_id, section_id, title, frame, structural_argument,
   spine_tag_id, category_tag_id, longform_id, published_at) VALUES
  ('sec-issue-1-N1', 'issue-1', 'N1',
   'The delegation primitive ships in four runtimes; the isolation policy does not',
   'Four runtimes (Claude Code, OpenAI Agents SDK, smolagents, LangGraph supervisor) ship the same parent-delegates-to-child primitive; the isolation policy varies.',
   'Convergence-on-mechanic floor (4 runtimes), isolation-policy variance foregrounded, counter-signal (LangGraph deprecation note) read as primitive generalizing past frameworks, G6 COI disclosure inline.',
   'spine-best-practices', 'cat-best-practices', 'lf-issue-1-N1', '2026-05-23');

-- FR7 — citations (4 primary sources, walked by verifier 2026-05-23T14-48-00Z)
INSERT OR IGNORE INTO citations (id, section_id, longform_id, label, url, kind, verified_at) VALUES
  ('cit-n1-1', 'sec-issue-1-N1', NULL, 'Claude Code — subagents documentation',
   'https://code.claude.com/docs/en/sub-agents', 'primary-source', '2026-05-23T14:48:00Z'),
  ('cit-n1-2', 'sec-issue-1-N1', NULL, 'OpenAI Agents SDK — handoffs documentation',
   'https://openai.github.io/openai-agents-python/handoffs/', 'primary-source', '2026-05-23T14:48:00Z'),
  ('cit-n1-3', 'sec-issue-1-N1', NULL, 'smolagents — multi-agent example',
   'https://huggingface.co/docs/smolagents/en/examples/multiagents', 'primary-source', '2026-05-23T14:48:00Z'),
  ('cit-n1-4', 'sec-issue-1-N1', NULL, 'LangGraph supervisor — repository',
   'https://github.com/langchain-ai/langgraph-supervisor-py', 'primary-source', '2026-05-23T14:48:00Z');

-- FR12 — migration registry
INSERT OR IGNORE INTO schema_migrations (version, name, checksum) VALUES
  (4, '0004-seed-issue-1-n1', '7055bd51188cc3b6');
