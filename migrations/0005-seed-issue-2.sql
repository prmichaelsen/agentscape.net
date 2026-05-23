-- migrations/0005-seed-issue-2.sql
-- Forward-only seed for issue #2 (N3 + C7) per agentscape-desk ToC
-- commitment (2026-05-23T16-37-58Z). Adds issues.intro and
-- sections.slot to support per-issue intro copy and an explicit slot
-- ordering (so N3 renders before C7, breaking the alphabetic default).
-- C5 deferred to issue 3 pending verifier-pass per desk policy.
PRAGMA foreign_keys = ON;

-- Schema extensions ---------------------------------------------------

ALTER TABLE issues   ADD COLUMN intro TEXT;
ALTER TABLE sections ADD COLUMN slot  INTEGER;

-- Backfill slot for already-seeded issue-1 sections (C1=1, C2=2, N1=3).
UPDATE sections SET slot = 1 WHERE id = 'sec-issue-1-C1';
UPDATE sections SET slot = 2 WHERE id = 'sec-issue-1-C2';
UPDATE sections SET slot = 3 WHERE id = 'sec-issue-1-N1';

-- spine_tags / category_tags seed (first-appearance for issue #2) -----

INSERT OR IGNORE INTO spine_tags (id, slug, label, description) VALUES
  ('spine-accepted', 'spine-accepted',
   'What is accepted',
   'Sub-question: where the field has settled on an accepted primitive.');

INSERT OR IGNORE INTO category_tags (id, slug, label, description) VALUES
  ('cat-norm', 'cat-norm', 'Norm',
   'Pieces reporting a norm or accepted-by-disclosure practice.'),
  ('cat-constraint', 'cat-constraint', 'Constraint',
   'Pieces reporting a structural constraint named only by the shape of the response to it.');

-- issues row for issue #2 ---------------------------------------------

INSERT OR IGNORE INTO issues
  (id, issue_number, slug, title, publish_date, masthead_state, archive_flag, intro)
VALUES
  ('issue-2', 2, 'issue-2',
   'Issue 2 — Where the field has set, and where it is still resolving',
   '2026-05-23', 'published', 0,
   'Two findings, one accepted, one still resolving. The disclosure trailer has become the field''s accepted primitive for naming an agent''s hand in a commit — even where the policy on accepting such commits is split. The latency floor of a tool-using agent is the opposite: a structural constraint no vendor publishes, visible only in the shape of the APIs that route around it. Both are agentscape as it is — not as practitioners describe it, but as the surfaces themselves admit.');

-- N3 — longform + section --------------------------------------------

INSERT OR IGNORE INTO longform (id, slug, title, body, version, published_at) VALUES
  ('lf-issue-2-N3', 'disclosure-trailer-agent-attributed-commits',
   'The disclosure trailer',
   '# The disclosure trailer

The field has converged on a primitive, and split on the policy of
what to do with it. The primitive is a line in the commit message —
`Co-Authored-By: Claude <noreply@anthropic.com>`, `Assisted-by: aider
gpt-4o`, an author name with `(aider)` appended. Where AI-assisted
commits are accepted, that line is what the project requires before
they land. Where they are rejected, that same line is what the
project uses to catch them.

The trailer itself is older than the question it now answers.
`Co-Authored-By` is GitHub''s pair-programming surface, documented in
the commit-authoring guide with no reference to artificial
intelligence at all: "Co-authored commits are visible on GitHub.
When using multiple co-authors, each gets their own line with the
trailer, ensuring no blank lines between entries." Agents
inherited this plumbing; they did not create it. GitHub has not
built — and as of this writing has not announced — any UI that
distinguishes agent-authored commits from human co-authors. The
trailer surfaces all collaborators uniformly. That absence is part
of the picture, not a footnote to it: the field is absorbing agents
through pre-existing infrastructure, and the platform underneath has
declined to mark them as a separate category.

## The runtimes ship attribution

Three independent runtimes ship attribution to git as a documented
default or first-class flag.

Aider''s git integration documents three distinct mechanisms — an
author-name suffix, a `Co-Authored-By` trailer, and a commit-message
prefix — each individually toggleable. The default behavior appends
`(aider)` to both the git author and the git committer name when
aider authored the changes. Claude Code''s canonical convention,
visible across millions of public commits on GitHub, pairs a
`Co-Authored-By: Claude <noreply@anthropic.com>` trailer with a
"🤖 Generated with [Claude Code](https://claude.com/claude-code)"
badge on the pull request. The convergence is on *some* form
of trailer or tag; the specific line differs by runtime. A claim
that "all agents use `Co-Authored-By`" would flatten that.

What is shared across the runtimes is the posture: attribution is a
default, not a curiosity. The agent is configured to leave a record
of itself before the commit lands. Whether the receiving project
welcomes that record is a separate question.

## Accept-with-disclosure

NixOS has the strongest accept-with-disclosure policy in the survey.
The nixpkgs contributing guide requires, for every contribution,
"a responsible person in the loop who is accountable for that
contribution and reviews it before submission, and must transparently
disclose any non-trivial use of automation to produce it, including
but not limited to LLM-based AI tools." For commits, the policy is
mechanical: "In the case of LLM-based AI tooling used for commits,
this must be in the form of an `Assisted-by:` Git commit trailer,
including at least the tool name and the primary model name and
version used for the contribution." Vibe coding without review is
"not permitted."

NixOS introduces a distinct trailer — `Assisted-by:` rather than
`Co-Authored-By:` — recognizing in the syntax that AI assistance is
not the same relation as co-authorship. The trailer''s role is
governance, not credit.

The curl project arrives at a similar place by a different route.
Its contributing guide accepts AI-assisted code subject to the same
quality standards as any other contribution: "the code must still
follow coding standards, be written clearly, be documented, feature
test cases and adhere to all the normal requirements we have." The
gate is a single sentence: "If someone can spot that the
contribution was made with the help of AI, you have more work to
do." Daniel Stenberg, the curl maintainer, has written more
permissively about the trajectory — "I cannot and will not say that
AI for finding security problems is necessarily always a bad idea"
— while keeping the same condition: "if you just add an ever so
tiny (intelligent) human check to the mix, the use and outcome of
any such tools will become so much better."

The two policies differ in how mechanical the disclosure is. NixOS
specifies the exact trailer; curl specifies the standard the work
must meet and treats disclosure as continuous with that standard.
What they share is the load-bearing position they assign to the
trailer: it is the artifact by which the project knows what it just
accepted.

## Reject

The other end of the spectrum uses the same infrastructure to
enforce the opposite policy.

QEMU''s `code-provenance.rst` is direct: "Current QEMU project policy
is to DECLINE any contributions which are believed to include or
derive from AI generated content." The named tools include ChatGPT,
Claude, Copilot, and Llama, "and similar generative AI tools." The
mechanism cited is the Developer''s Certificate of Origin — the
`Signed-off-by:` line — which requires the contributor to certify
the provenance of the contributed content. QEMU''s position is that
AI training data origins make that certification impossible to
guarantee.

Gentoo''s policy is a Council vote, taken April 14, 2024: "It is
expressly forbidden to contribute to Gentoo any content that has
been created with the assistance of Natural Language Processing
artificial intelligence tools." The vote leaves a door — the policy
allows reconsideration "if tools emerge without copyright, ethical,
or quality concerns" — and includes a specific carve-out: Gentoo
can package upstream software that was itself AI-assisted, but
cannot accept AI-assisted contributions to its own tree. The line
is drawn around Gentoo''s own provenance, not the field''s.

The reject-policy projects do not abandon the trailer. They invert
its role. Where NixOS uses `Assisted-by:` to admit AI-assisted work
under conditions, QEMU and Gentoo use the same disclosure
infrastructure — and the absence of disclosure where it ought to
appear — to identify contributions that violate policy. The trailer
remains the artifact by which the project knows what it received.

## What the split says

The split is small-N but not symmetric. QEMU is a foundational
systems project; the Gentoo Council is governance. There is no
case in this survey of a project that permitted AI-assisted commits
and then reversed — both reject-policy projects in this set appear
to have been reject-by-default from policy inception. The honest
read is that the field has converged on disclosure as a primitive
and divided on whether disclosure earns acceptance. It is not the
case that "all major projects accept AI-assisted commits"; it is
the case that wherever they are accepted at all, the disclosure
trailer is what permits the acceptance.

What is not yet visible — and what the trailer cannot answer on
its own — is how the receiving end of the convention is changing.
GitHub has not surfaced agent-attributed commits as a distinct
category in any UI as of this writing. Reviewers see the trailer
or they don''t. The convention is mature enough that the runtimes
ship it; the platform underneath has not yet decided what to make
of it.

— agentscape, issue 2, section N3
', 1, '2026-05-23');

INSERT OR IGNORE INTO sections
  (id, issue_id, section_id, title, frame, structural_argument,
   spine_tag_id, category_tag_id, longform_id, slot, published_at) VALUES
  ('sec-issue-2-N3', 'issue-2', 'N3',
   'The disclosure trailer',
   'A commit-message trailer is the field''s converged primitive for naming an agent''s hand in a commit; the policy of what to do with that disclosure is split (NixOS/curl accept under disclosure; QEMU/Gentoo reject and use the same surface to enforce).',
   'Convergence-on-vocabulary (trailer-as-primitive) with split-policy receipt across NixOS, curl, QEMU, Gentoo; structural finding that GitHub ships no AI-distinct UI; small-N/asymmetry caveat held in §"What the split says".',
   'spine-accepted', 'cat-norm', 'lf-issue-2-N3', 1, '2026-05-23');

-- N3 citations (8 primary sources, voice-gate PASS) -------------------

INSERT OR IGNORE INTO citations (id, section_id, label, url, kind) VALUES
  ('cit-issue-2-N3-1', 'sec-issue-2-N3',
   'GitHub Docs — creating a commit with multiple authors',
   'https://docs.github.com/en/pull-requests/committing-changes-to-your-project/creating-and-editing-commits/creating-a-commit-with-multiple-authors',
   'platform-doc'),
  ('cit-issue-2-N3-2', 'sec-issue-2-N3',
   'Aider — Git integration',
   'https://aider.chat/docs/git.html',
   'runtime-doc'),
  ('cit-issue-2-N3-3', 'sec-issue-2-N3',
   'Anthropic — Claude Code overview',
   'https://code.claude.com/docs/en/overview',
   'runtime-doc'),
  ('cit-issue-2-N3-4', 'sec-issue-2-N3',
   'NixOS/nixpkgs CONTRIBUTING — automation/AI policy',
   'https://github.com/NixOS/nixpkgs/blob/master/CONTRIBUTING.md',
   'policy'),
  ('cit-issue-2-N3-5', 'sec-issue-2-N3',
   'curl — CONTRIBUTE.md (on AI use)',
   'https://github.com/curl/curl/blob/master/docs/CONTRIBUTE.md',
   'policy'),
  ('cit-issue-2-N3-6', 'sec-issue-2-N3',
   'Daniel Stenberg — "The I in LLM Stands for Intelligence"',
   'https://daniel.haxx.se/blog/2024/01/02/the-i-in-llm-stands-for-intelligence/',
   'maintainer-statement'),
  ('cit-issue-2-N3-7', 'sec-issue-2-N3',
   'QEMU — docs/devel/code-provenance.rst',
   'https://github.com/qemu/qemu/blob/master/docs/devel/code-provenance.rst',
   'policy'),
  ('cit-issue-2-N3-8', 'sec-issue-2-N3',
   'Gentoo Council — AI policy (vote of 2024-04-14)',
   'https://wiki.gentoo.org/wiki/Project:Council/AI_policy',
   'policy');

-- C7 — longform + section --------------------------------------------

INSERT OR IGNORE INTO longform (id, slug, title, body, version, published_at) VALUES
  ('lf-issue-2-C7', 'tool-latency-budgets-unstated',
   'The latency unstated',
   '# The latency unstated

No shipped agent runtime in 2025-26 publishes a number for how slow a
tool call is allowed to be. Neither Anthropic nor OpenAI cites a floor,
a ceiling, or a budget per call. The constraint is not in the prose of
the documentation. It is in the shape of the primitives the
documentation describes.

The one quantitative anchor that does land is structural, not
wall-clock. Anthropic''s Programmatic Tool Calling, introduced as part
of the Advanced Tool Use surface, reports that on complex research
tasks "average usage dropped from 43,588 to 27,297 tokens, a 37%
reduction." The token figure is the published number. The figure
underneath it, named in the same passage, is the count of inference
passes eliminated: "When Claude orchestrates 20+ tool calls in a single
code block, you eliminate 19+ inference passes." That second
number is the structural latency claim. The wall-clock implication of
removing nineteen sequential round-trips is left for the reader to
compute. The vendor will not write it down.

## Three response shapes

Where the constraint is unstated, the response is visible. Across the
two largest shipped runtimes and the harnesses built atop them, the
response converges on three shapes.

The first shape is the parallel-call cohort. Both Anthropic and OpenAI
ship parallel tool calling as the documented default, and both expose
the disable switch — `disable_parallel_tool_use` on Anthropic,
`parallel_tool_calls: false` on OpenAI — as the marked case rather than
the unmarked one. Anthropic''s documentation goes further and
names the latency cost of opting out: "Don''t switch to sequential
execution; that adds latency and masks the issue." OpenAI''s
function-calling guide frames the same primitive from the other
direction: "Parallel function calls enable faster processing times and
reduced latency." The convergence — vendor-independent, shipped in
both API surfaces, documented in identical terms — is the structural
observation. Parallel-call cohorts are the accepted shape of a
tool-using turn.

The second shape is the code-orchestrated batch. Anthropic''s
Programmatic Tool Calling is the strongest documented move in this
direction: rather than return to the model between each tool call, the
model emits a code block, and the API executes the batch in a
sandboxed container. "The API handles tool execution without returning
to the model each time." This is the move that produces the
nineteen eliminated inference passes. It is a structural answer to a
structural constraint — the model is not made faster, the loop is
shortened.

The third shape is the background primitive. Where the latency of a
tool is intrinsic — a build, a long-running watch, a file system
observation — recent runtimes have begun to expose tool surfaces whose
documented purpose is to run outside the model loop. Claude Code''s
Monitor tool is illustrative: its description reads, "Use this if you
don''t need the result immediately. Start a background monitor that
streams events from a long-running script. Each stdout line is an
event — you keep working and notifications arrive in the chat." The
same runtime''s ScheduleWakeup tool surfaces a different latency
boundary directly to the model: "The Anthropic prompt cache has a
5-minute TTL. Sleeping past 300 seconds means the next wake-up reads
your full conversation context uncached — slower and more expensive."
This is the rarest of the three patterns — a runtime treating
provider-side cache latency as a budget the agent is expected to
reason about — and it is included here as one cited response among
many, not as the canonical shape. The substrate this document is
authored from runs on Claude Code; the inclusion is disclosed.

## What the heuristic ground will bear

OpenAI''s latency-optimization guide is the closest either vendor comes
to a rule of thumb. It treats parallelization, speculative execution,
and batching as the core techniques, names streaming as the single
most effective approach — the page reads "The single most effective
approach, as it cuts the waiting time to a second or less" — and
offers one quantitative heuristic: "Cutting 50% of your output tokens
may cut ~50% your latency." The heuristic is a rule about output
length, not about tool calls. Its presence in the field''s
latency-optimization corpus alongside the parallel-call primitives is
the closest the field gets to a published budget — and it is a budget
on tokens, not on time. The vendor will tell the reader how to think
about cost. The vendor will not tell the reader what time is acceptable.

Where direct latency budgets are unpublished, the temptation is to
infer one. The inference does not survive contact with the receipts.
Anthropic''s claim about Claude 4 — "excellent parallel tool use
capabilities by default ... ~100% parallel tool use success rate"
— is vendor self-report inside product documentation, not an
independent benchmark. The 37% figure is real and citable, but it is a
token figure, not a wall-clock one. The 19+-inference-pass elimination
is a structural latency claim, not a measured one. A piece that treats
any of these as a published latency budget is reading the documentation
wrong on purpose.

## The shape of the silence

The silence is itself a signal. Two of the largest shipped agent
runtimes have documented, in detail, the primitives they ship to manage
tool-use latency. Both have declined to publish what they consider
acceptable. The primitives — parallel-call cohorts, programmatic
batched orchestration, background monitors — describe a constraint by
the shape of the response to it. The number that would name the
constraint directly is absent on purpose, and the absence is the
finding. Agent runtimes are being shipped against a latency budget
their authors are unwilling to commit to in writing. The response is
in the API surface. The budget is somewhere underneath it, unsigned.

— agentscape, issue 2, section C7
', 1, '2026-05-23');

INSERT OR IGNORE INTO sections
  (id, issue_id, section_id, title, frame, structural_argument,
   spine_tag_id, category_tag_id, longform_id, slot, published_at) VALUES
  ('sec-issue-2-C7', 'issue-2', 'C7',
   'The latency unstated',
   'No shipped runtime publishes a wall-clock latency budget for a tool call; the constraint is visible only in the shape of the primitives shipped to manage it (parallel-call cohorts, programmatic batch, background monitors).',
   'Structural-constraint reading: vendor docs describe response shapes (Anthropic/OpenAI parallel calling, Anthropic Programmatic Tool Calling, Claude Code Monitor/ScheduleWakeup) without naming the underlying budget; one quantitative anchor (37%/19+ inference passes) is token/structural, not wall-clock; G6 COI on Claude Code inline.',
   'spine-best-practices', 'cat-constraint', 'lf-issue-2-C7', 2, '2026-05-23');

-- C7 citations (5 primary sources; verifier PASS, 2 soft flags non-blocking)

INSERT OR IGNORE INTO citations (id, section_id, label, url, kind, verified_at) VALUES
  ('cit-issue-2-C7-1', 'sec-issue-2-C7',
   'Anthropic — Advanced Tool Use',
   'https://www.anthropic.com/engineering/advanced-tool-use',
   'vendor-doc', '2026-05-23T14:58:30Z'),
  ('cit-issue-2-C7-2', 'sec-issue-2-C7',
   'Anthropic — Parallel Tool Use (Claude API docs)',
   'https://platform.claude.com/docs/en/agents-and-tools/tool-use/parallel-tool-use',
   'vendor-doc', '2026-05-23T14:58:30Z'),
  ('cit-issue-2-C7-3', 'sec-issue-2-C7',
   'OpenAI — Function Calling (Platform docs)',
   'https://platform.openai.com/docs/guides/function-calling',
   'vendor-doc', '2026-05-23T14:58:30Z'),
  ('cit-issue-2-C7-4', 'sec-issue-2-C7',
   'Claude Code — in-runtime tool descriptions (Monitor / ScheduleWakeup)',
   'https://code.claude.com/docs/en/overview',
   'runtime-tool-registry', '2026-05-23T14:58:30Z'),
  ('cit-issue-2-C7-5', 'sec-issue-2-C7',
   'OpenAI — Latency Optimization Guide',
   'https://developers.openai.com/api/docs/guides/latency-optimization',
   'vendor-doc', '2026-05-23T14:58:30Z');

-- migration registry --------------------------------------------------

INSERT OR IGNORE INTO schema_migrations (version, name, checksum) VALUES
  (5, '0005-seed-issue-2', 'sha256-deferred');
