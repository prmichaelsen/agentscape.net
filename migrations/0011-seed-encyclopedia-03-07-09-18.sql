INSERT OR IGNORE INTO entries (
      id, slug, title, content_hash,
      definition, first_appearance, etymology,
      current_meaning, divergent_meanings,
      supersession_note, superseded_by_id, version,
      state, published_at
    ) VALUES (
      '8858ef3a-1e1f-4420-bf2c-6c17bd57fd06', 'loop', 'Loop', '23d36cd8912127e2',
      'In current agentic-context usage, an **agent loop** is the
iterative cycle that wraps an LLM into a multi-turn, tool-using
agent. One iteration is: call the model with the current
context; the model emits reasoning and/or an action (typically a
tool call); the action is executed and its observation appended
to the context; control returns to the model call until a
terminal condition fires — a final answer emitted, a step or
token budget exhausted, an error raised, an explicit stop.

The canonical pattern that crystallized this shape is ReAct
(Reason + Act): an LLM is prompted to generate reasoning traces
and task-specific actions in an interleaved cycle — traces help
the model plan and handle exceptions, actions let it interface
with external sources such as knowledge bases or environments to
gather additional information. [^1]

The classical-AI literature describes the same schematic shape
under the name *perception-action loop*: an agent that senses,
decides, and acts upon its environment. The classical reference
is Russell & Norvig''s *Artificial Intelligence: A Modern
Approach*, Chapter 2, which defines an agent as "anything that
can be viewed as perceiving its environment through sensors and
acting upon that environment through actuators" [^2] — the
iterative shape is implicit in the definition and explicit in
the architecture chapters that follow.

The two definitions are compatible — the LLM-agent loop is one
implementation of the classical perception-action loop, with the
LLM in the perceive-and-decide role and tool calls in the act
role — but they sit at different levels of abstraction and the
field has not collapsed them.

[^1]: Yao, S. et al., *ReAct: Synergizing Reasoning and Acting
    in Language Models*, arXiv:2210.03629, submitted
    2022-10-06, accessed 2026-05-23.
    [arxiv.org/abs/2210.03629](https://arxiv.org/abs/2210.03629)

[^2]: Russell, S. & Norvig, P., *Artificial Intelligence: A
    Modern Approach*, 4th edition, Pearson, 2020. Chapter 2
    ("Intelligent Agents"), §2.1 "Agents and Environments,"
    p. 36. Identical phrasing across the 1st (1995), 2nd
    (2003), 3rd (2010), and 4th (2020) editions. Print-anchored
    citation; no canonical URL.

[^3]: Wooldridge, M. & Jennings, N. R., *Intelligent agents:
    Theory and practice*, *The Knowledge Engineering Review*
    10(2):115–152, 1995. DOI:
    [10.1017/S0269888900008122](https://doi.org/10.1017/S0269888900008122).
    Accessed 2026-05-23.

[^4]: Anthropic, *Tool use with Claude — agentic loop*,
    documentation page, accessed 2026-05-23.
    [platform.claude.com/docs/en/agents-and-tools/tool-use/overview](https://platform.claude.com/docs/en/agents-and-tools/tool-use/overview)

[^5]: OpenAI, *Assistants API Overview (Python)* — OpenAI
    Cookbook, accessed 2026-05-23. The cookbook walks the
    server-side *run* lifecycle (create → poll → submit tool
    outputs → complete) that implements the harness control-loop
    shape.
    [cookbook.openai.com/examples/assistants_api_overview_python](https://cookbook.openai.com/examples/assistants_api_overview_python)', 'Two layered first-appearance anchors, disambiguated by sense.

**Classical sense — 1995.** Russell & Norvig, *Artificial
Intelligence: A Modern Approach*, 1st edition, 1995. Chapter 2
formalizes the perceive-then-act framing that runs unchanged
through the 2020 4th edition. [^2] Wooldridge & Jennings''
*Knowledge Engineering Review* survey from the same year [^3]
gives the same schematic shape under the autonomy / reactivity /
pro-activeness / social-ability property list, with the
implicit iterative loop.

**Current LLM-agent sense — 2022-10-06.** Yao et al., *ReAct:
Synergizing Reasoning and Acting in Language Models*,
arXiv:2210.03629, submitted 2022-10-06. [^1] ReAct does not coin
the phrase *agent loop*; what it crystallizes is the
Thought/Action/Observation interleaved trace that the current
LLM-agent community treats as the canonical loop shape. The
informal practitioner usage popularized by AutoGPT
(Significant Gravitas, March 2023) and BabyAGI (Nakajima, April
2023) sits on top of ReAct''s framing without recapitulating its
formalism.

No defensible single first-appearance for *agent loop* as a
named phrase exists; the construct converged across the eval
community, the harness-builder community, and vendor docs
without a coinage event of the kind Wooldridge & Jennings or
Yao et al. supply for their respective layers.

[^1]: Yao, S. et al., *ReAct: Synergizing Reasoning and Acting
    in Language Models*, arXiv:2210.03629, submitted
    2022-10-06, accessed 2026-05-23.
    [arxiv.org/abs/2210.03629](https://arxiv.org/abs/2210.03629)

[^2]: Russell, S. & Norvig, P., *Artificial Intelligence: A
    Modern Approach*, 4th edition, Pearson, 2020. Chapter 2
    ("Intelligent Agents"), §2.1 "Agents and Environments,"
    p. 36. Identical phrasing across the 1st (1995), 2nd
    (2003), 3rd (2010), and 4th (2020) editions. Print-anchored
    citation; no canonical URL.

[^3]: Wooldridge, M. & Jennings, N. R., *Intelligent agents:
    Theory and practice*, *The Knowledge Engineering Review*
    10(2):115–152, 1995. DOI:
    [10.1017/S0269888900008122](https://doi.org/10.1017/S0269888900008122).
    Accessed 2026-05-23.

[^4]: Anthropic, *Tool use with Claude — agentic loop*,
    documentation page, accessed 2026-05-23.
    [platform.claude.com/docs/en/agents-and-tools/tool-use/overview](https://platform.claude.com/docs/en/agents-and-tools/tool-use/overview)

[^5]: OpenAI, *Assistants API Overview (Python)* — OpenAI
    Cookbook, accessed 2026-05-23. The cookbook walks the
    server-side *run* lifecycle (create → poll → submit tool
    outputs → complete) that implements the harness control-loop
    shape.
    [cookbook.openai.com/examples/assistants_api_overview_python](https://cookbook.openai.com/examples/assistants_api_overview_python)', '*Loop* is borrowed from generic programming — the `while` or
`for` loops every language carries — and the agentic-context
usage inherits the metaphor unchanged. The loop is what runs
until a terminal condition fires. The etymology is short and
uncontested; it does its work in one sentence.

[^1]: Yao, S. et al., *ReAct: Synergizing Reasoning and Acting
    in Language Models*, arXiv:2210.03629, submitted
    2022-10-06, accessed 2026-05-23.
    [arxiv.org/abs/2210.03629](https://arxiv.org/abs/2210.03629)

[^2]: Russell, S. & Norvig, P., *Artificial Intelligence: A
    Modern Approach*, 4th edition, Pearson, 2020. Chapter 2
    ("Intelligent Agents"), §2.1 "Agents and Environments,"
    p. 36. Identical phrasing across the 1st (1995), 2nd
    (2003), 3rd (2010), and 4th (2020) editions. Print-anchored
    citation; no canonical URL.

[^3]: Wooldridge, M. & Jennings, N. R., *Intelligent agents:
    Theory and practice*, *The Knowledge Engineering Review*
    10(2):115–152, 1995. DOI:
    [10.1017/S0269888900008122](https://doi.org/10.1017/S0269888900008122).
    Accessed 2026-05-23.

[^4]: Anthropic, *Tool use with Claude — agentic loop*,
    documentation page, accessed 2026-05-23.
    [platform.claude.com/docs/en/agents-and-tools/tool-use/overview](https://platform.claude.com/docs/en/agents-and-tools/tool-use/overview)

[^5]: OpenAI, *Assistants API Overview (Python)* — OpenAI
    Cookbook, accessed 2026-05-23. The cookbook walks the
    server-side *run* lifecycle (create → poll → submit tool
    outputs → complete) that implements the harness control-loop
    shape.
    [cookbook.openai.com/examples/assistants_api_overview_python](https://cookbook.openai.com/examples/assistants_api_overview_python)',
      'Three live community senses, distinguishable by the layer of
abstraction at which they describe the same iterative shape.

**Facet A — Research community (ReAct-aligned).** The
Thought/Action/Observation interleaved cycle described in
ReAct. [^1] The loop is a *prompt-and-context-management*
pattern: the LLM emits a thought, then an action; the action''s
observation is appended to the prompt; the cycle continues. At
this layer of abstraction the loop is what the model produces,
trace by trace, not what the surrounding code runs.

**Facet B — Harness-builder community ("agentic loop" / "run"
/ "control loop").** The harness wraps the LLM in a
`while not done:` loop that calls the model, parses tool calls,
executes them, appends observations, and re-calls. Vendor
implementations honor this shape under different surface names:
Anthropic''s tool-use guidance documents an *agentic loop*; [^4]
OpenAI''s Assistants API cookbook describes a server-side *run*
that implements the same shape. [^5] The construct is the same; the
vendor vocabulary diverges, and a reader following one vendor''s
docs will need to map the term back to the shared shape.

**Facet C — Classical AI (perception-action loop).** The
sense-decide-act cycle from Russell & Norvig [^2] and the
autonomous-agent literature [^3]. Distinguished from the
LLM-agent senses not by the schematic shape — which is the same
— but by *what the agent is made of*: a hand-coded controller
(reflex, model-based, goal-based, utility-based, or learning,
per AIMA Chapter 2) rather than an LLM call inside a loop the
harness provides.

Convergence finding: HIGH on the schematic shape across all
three facets — sense, decide, act, repeat — and MEDIUM on the
*name*. The research community grounds the current usage in
ReAct; the harness-builder community uses *agentic loop*,
*run*, or *control loop* roughly interchangeably; the
classical community keeps *perception-action loop*. The
underlying primitive is the same; the surface vocabulary is
not.

[^1]: Yao, S. et al., *ReAct: Synergizing Reasoning and Acting
    in Language Models*, arXiv:2210.03629, submitted
    2022-10-06, accessed 2026-05-23.
    [arxiv.org/abs/2210.03629](https://arxiv.org/abs/2210.03629)

[^2]: Russell, S. & Norvig, P., *Artificial Intelligence: A
    Modern Approach*, 4th edition, Pearson, 2020. Chapter 2
    ("Intelligent Agents"), §2.1 "Agents and Environments,"
    p. 36. Identical phrasing across the 1st (1995), 2nd
    (2003), 3rd (2010), and 4th (2020) editions. Print-anchored
    citation; no canonical URL.

[^3]: Wooldridge, M. & Jennings, N. R., *Intelligent agents:
    Theory and practice*, *The Knowledge Engineering Review*
    10(2):115–152, 1995. DOI:
    [10.1017/S0269888900008122](https://doi.org/10.1017/S0269888900008122).
    Accessed 2026-05-23.

[^4]: Anthropic, *Tool use with Claude — agentic loop*,
    documentation page, accessed 2026-05-23.
    [platform.claude.com/docs/en/agents-and-tools/tool-use/overview](https://platform.claude.com/docs/en/agents-and-tools/tool-use/overview)

[^5]: OpenAI, *Assistants API Overview (Python)* — OpenAI
    Cookbook, accessed 2026-05-23. The cookbook walks the
    server-side *run* lifecycle (create → poll → submit tool
    outputs → complete) that implements the harness control-loop
    shape.
    [cookbook.openai.com/examples/assistants_api_overview_python](https://cookbook.openai.com/examples/assistants_api_overview_python)', 'The divergence here is one of abstraction layer rather than
substance. Three live senses sit side by side:

1. **Inner control loop** (the `while not done:` shape; Facet
   B). The harness mechanism — code that calls the model,
   handles its outputs, and decides when to stop.
2. **ReAct-shaped reasoning loop** (Thought/Action/Observation;
   Facet A). The model''s interleaved emission pattern, visible
   in the prompt trace.
3. **Classical perception-action loop** (sense → decide → act;
   Facet C). The schematic shape the classical-AI literature
   formalizes, independent of whether the controller is a
   neural network or a rule system.

Senses 1 and 2 differ in *level of abstraction* — 1 describes
the harness mechanism, 2 describes the model''s interleaved
trace — but are routinely co-implemented: most ReAct-style
agents are control loops whose inner step parses
Thought/Action/Observation. Sense 3 shares the schematic shape
with 1 but is implementation-distinct; a classical
perception-action loop is not necessarily an LLM call inside a
control loop.

The reading errors the divergence produces are concrete:

- A reader bringing the **Facet A sense** to a Facet B
  practitioner blog will look for Thought/Action/Observation
  traces and miss that the post is describing harness control
  flow that may or may not surface ReAct''s trace shape.
- A reader bringing the **Facet B sense** to an AIMA passage
  will read the perception-action loop as a `while not done:`
  scaffold and miss the architecture-choice apparatus the
  classical chapter is teaching.
- A reader following **one vendor''s docs** (agentic loop, run,
  control loop) will need to recognize that the others'' terms
  pick out the same primitive, lest a cross-vendor comparison
  read as a comparison of distinct constructs.

The senses coexist; none supersedes the others. The shape is
shared; the layer it describes is not.

[^1]: Yao, S. et al., *ReAct: Synergizing Reasoning and Acting
    in Language Models*, arXiv:2210.03629, submitted
    2022-10-06, accessed 2026-05-23.
    [arxiv.org/abs/2210.03629](https://arxiv.org/abs/2210.03629)

[^2]: Russell, S. & Norvig, P., *Artificial Intelligence: A
    Modern Approach*, 4th edition, Pearson, 2020. Chapter 2
    ("Intelligent Agents"), §2.1 "Agents and Environments,"
    p. 36. Identical phrasing across the 1st (1995), 2nd
    (2003), 3rd (2010), and 4th (2020) editions. Print-anchored
    citation; no canonical URL.

[^3]: Wooldridge, M. & Jennings, N. R., *Intelligent agents:
    Theory and practice*, *The Knowledge Engineering Review*
    10(2):115–152, 1995. DOI:
    [10.1017/S0269888900008122](https://doi.org/10.1017/S0269888900008122).
    Accessed 2026-05-23.

[^4]: Anthropic, *Tool use with Claude — agentic loop*,
    documentation page, accessed 2026-05-23.
    [platform.claude.com/docs/en/agents-and-tools/tool-use/overview](https://platform.claude.com/docs/en/agents-and-tools/tool-use/overview)

[^5]: OpenAI, *Assistants API Overview (Python)* — OpenAI
    Cookbook, accessed 2026-05-23. The cookbook walks the
    server-side *run* lifecycle (create → poll → submit tool
    outputs → complete) that implements the harness control-loop
    shape.
    [cookbook.openai.com/examples/assistants_api_overview_python](https://cookbook.openai.com/examples/assistants_api_overview_python)',
      'No supersession. The `while not done:` shape has not been
retired; incremental refinements (ReAct → Reflexion, tree-search
variants such as Tree-of-Thoughts and Language-Agent-Tree-
Search) extend the loop rather than replacing it. The classical
perception-action loop remains the schematic root.

[^1]: Yao, S. et al., *ReAct: Synergizing Reasoning and Acting
    in Language Models*, arXiv:2210.03629, submitted
    2022-10-06, accessed 2026-05-23.
    [arxiv.org/abs/2210.03629](https://arxiv.org/abs/2210.03629)

[^2]: Russell, S. & Norvig, P., *Artificial Intelligence: A
    Modern Approach*, 4th edition, Pearson, 2020. Chapter 2
    ("Intelligent Agents"), §2.1 "Agents and Environments,"
    p. 36. Identical phrasing across the 1st (1995), 2nd
    (2003), 3rd (2010), and 4th (2020) editions. Print-anchored
    citation; no canonical URL.

[^3]: Wooldridge, M. & Jennings, N. R., *Intelligent agents:
    Theory and practice*, *The Knowledge Engineering Review*
    10(2):115–152, 1995. DOI:
    [10.1017/S0269888900008122](https://doi.org/10.1017/S0269888900008122).
    Accessed 2026-05-23.

[^4]: Anthropic, *Tool use with Claude — agentic loop*,
    documentation page, accessed 2026-05-23.
    [platform.claude.com/docs/en/agents-and-tools/tool-use/overview](https://platform.claude.com/docs/en/agents-and-tools/tool-use/overview)

[^5]: OpenAI, *Assistants API Overview (Python)* — OpenAI
    Cookbook, accessed 2026-05-23. The cookbook walks the
    server-side *run* lifecycle (create → poll → submit tool
    outputs → complete) that implements the harness control-loop
    shape.
    [cookbook.openai.com/examples/assistants_api_overview_python](https://cookbook.openai.com/examples/assistants_api_overview_python)', NULL, 1,
      'active', '2026-05-23T17:41:02.913Z'
    );

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at)
       VALUES ('9fadc152-2ecd-4173-bf42-334a6f7983a2', 'loop', 'agent', '2026-05-23T17:41:02.913Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at)
       VALUES ('0ce5cd65-50c0-4090-89a4-ceebc5533b2a', 'loop', 'tool', '2026-05-23T17:41:02.913Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at)
       VALUES ('2e29ed20-d991-4885-899b-03aa9e3c3eae', 'loop', 'harness', '2026-05-23T17:41:02.913Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at)
       VALUES ('42c04cf5-722a-4e3b-aec5-d5c1198e17cd', 'loop', 'scaffold', '2026-05-23T17:41:02.913Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at)
       VALUES ('ef0f480c-9e2d-4060-8e1f-4fc082b3c17a', 'loop', 'context-window', '2026-05-23T17:41:02.913Z');

INSERT OR IGNORE INTO entries (
      id, slug, title, content_hash,
      definition, first_appearance, etymology,
      current_meaning, divergent_meanings,
      supersession_note, superseded_by_id, version,
      state, published_at
    ) VALUES (
      'bd68154a-d9c4-4099-9065-bc0d14b5ee3c', 'prompt', 'Prompt', 'db4710c9f44a4214',
      'A **prompt** is the text supplied to a language model as input,
which conditions the model''s next-token distribution toward a
desired output. In the modern LLM literature the term carries
three coexisting senses, none of which has displaced the others:

(a) the raw input text given to a model — what a vendor-platform
document means when it says "the prompt" [^4];

(b) a template with one or more unfilled slots, into which an
input is folded before the language model fills the remaining
information — the academic-NLP sense formalized by Liu et al.''s
2021 survey [^2];

(c) an engineered artifact under version control, parameterized
with variables and attached to evals — the practitioner /
production sense that anchors the discipline of *prompt
engineering* [^4].

All three are current. A reader meeting "prompt" in the wild owes
themselves a check on which sense the source carries; §5 carries
the divergences that make the check load-bearing.

[^1]: Brown, Mann, Ryder, Subbiah, Kaplan, Dhariwal, Neelakantan,
    Shyam, Sastry, Askell, Agarwal, Herbert-Voss, Krueger,
    Henighan, Child, Ramesh, Ziegler, Wu, Winter, Hesse, Chen,
    Sigler, Litwin, Gray, Chess, Clark, Berner, McCandlish,
    Radford, Sutskever, Amodei, *Language Models are Few-Shot
    Learners*, arXiv:2005.14165, v1 2020-05-28, accessed
    2026-05-23.
    [arxiv.org/abs/2005.14165](https://arxiv.org/abs/2005.14165)

[^2]: Liu, Yuan, Fu, Jiang, Hayashi, Neubig, *Pre-train, Prompt,
    and Predict: A Systematic Survey of Prompting Methods in
    Natural Language Processing*, arXiv:2107.13586, v1
    2021-07-28, accessed 2026-05-23.
    [arxiv.org/abs/2107.13586](https://arxiv.org/abs/2107.13586)

[^3]: Reynolds, McDonell, *Prompt Programming for Large Language
    Models: Beyond the Few-Shot Paradigm*, arXiv:2102.07350, v1
    2021-02-15, accessed 2026-05-23.
    [arxiv.org/abs/2102.07350](https://arxiv.org/abs/2102.07350)

[^4]: Anthropic, *Prompt engineering overview*, accessed
    2026-05-23.
    [platform.claude.com/docs/en/docs/build-with-claude/prompt-engineering/overview](https://platform.claude.com/docs/en/docs/build-with-claude/prompt-engineering/overview)', 'The word *prompt* predates large language models. Cloze-style
NLP tasks used "prompt" and "cloze prompt" well before 2020,
inherited from ordinary English usage ("a cue"). The term was
not coined by GPT-3.

The moment the word became *load-bearing* in the field — the
inflection from narrow technical usage to the field''s primary
frame for in-context task specification — is the GPT-3 paper:

> "GPT-3 is applied without any gradient updates or fine-tuning,
> with tasks and few-shot demonstrations specified purely via
> text interaction with the model."
> — Brown et al., *Language Models are Few-Shot Learners*,
> arXiv:2005.14165, submitted 2020-05-28. [^1]

Framing task specification as "text interaction" is the move
that promoted "prompt" from a narrow term to the field''s central
vocabulary. Subsequent work treats the prompt as the surface on
which task specification, role assignment, demonstration, and
control all live. Two follow-on papers — Liu et al. 2021''s
survey [^2] and Reynolds & McDonell 2021''s prompt-programming
framing [^3] — establish the academic ground the term now
stands on.

[^1]: Brown, Mann, Ryder, Subbiah, Kaplan, Dhariwal, Neelakantan,
    Shyam, Sastry, Askell, Agarwal, Herbert-Voss, Krueger,
    Henighan, Child, Ramesh, Ziegler, Wu, Winter, Hesse, Chen,
    Sigler, Litwin, Gray, Chess, Clark, Berner, McCandlish,
    Radford, Sutskever, Amodei, *Language Models are Few-Shot
    Learners*, arXiv:2005.14165, v1 2020-05-28, accessed
    2026-05-23.
    [arxiv.org/abs/2005.14165](https://arxiv.org/abs/2005.14165)

[^2]: Liu, Yuan, Fu, Jiang, Hayashi, Neubig, *Pre-train, Prompt,
    and Predict: A Systematic Survey of Prompting Methods in
    Natural Language Processing*, arXiv:2107.13586, v1
    2021-07-28, accessed 2026-05-23.
    [arxiv.org/abs/2107.13586](https://arxiv.org/abs/2107.13586)

[^3]: Reynolds, McDonell, *Prompt Programming for Large Language
    Models: Beyond the Few-Shot Paradigm*, arXiv:2102.07350, v1
    2021-02-15, accessed 2026-05-23.
    [arxiv.org/abs/2102.07350](https://arxiv.org/abs/2102.07350)

[^4]: Anthropic, *Prompt engineering overview*, accessed
    2026-05-23.
    [platform.claude.com/docs/en/docs/build-with-claude/prompt-engineering/overview](https://platform.claude.com/docs/en/docs/build-with-claude/prompt-engineering/overview)', 'Omitted. The word arrives from ordinary English with no
non-trivial lineage worth a reader''s time; what made it
terminological in the field is its 2020 promotion to the
in-context task-specification surface, captured in §2.

[^1]: Brown, Mann, Ryder, Subbiah, Kaplan, Dhariwal, Neelakantan,
    Shyam, Sastry, Askell, Agarwal, Herbert-Voss, Krueger,
    Henighan, Child, Ramesh, Ziegler, Wu, Winter, Hesse, Chen,
    Sigler, Litwin, Gray, Chess, Clark, Berner, McCandlish,
    Radford, Sutskever, Amodei, *Language Models are Few-Shot
    Learners*, arXiv:2005.14165, v1 2020-05-28, accessed
    2026-05-23.
    [arxiv.org/abs/2005.14165](https://arxiv.org/abs/2005.14165)

[^2]: Liu, Yuan, Fu, Jiang, Hayashi, Neubig, *Pre-train, Prompt,
    and Predict: A Systematic Survey of Prompting Methods in
    Natural Language Processing*, arXiv:2107.13586, v1
    2021-07-28, accessed 2026-05-23.
    [arxiv.org/abs/2107.13586](https://arxiv.org/abs/2107.13586)

[^3]: Reynolds, McDonell, *Prompt Programming for Large Language
    Models: Beyond the Few-Shot Paradigm*, arXiv:2102.07350, v1
    2021-02-15, accessed 2026-05-23.
    [arxiv.org/abs/2102.07350](https://arxiv.org/abs/2102.07350)

[^4]: Anthropic, *Prompt engineering overview*, accessed
    2026-05-23.
    [platform.claude.com/docs/en/docs/build-with-claude/prompt-engineering/overview](https://platform.claude.com/docs/en/docs/build-with-claude/prompt-engineering/overview)',
      'Four facets carry the working senses of the term in 2026. Each
is primary-source cited.

**Facet A — input-text sense (vendor-platform usage).** In
Anthropic''s, OpenAI''s, and Google''s platform documentation,
"prompt" denotes the text input — possibly multi-part, segmented
into system / user / assistant turns — that the model conditions
on. Anthropic''s prompt-engineering overview frames the term this
way:

> "All prompting techniques — from clarity and examples to XML
> structuring, role prompting, thinking, and prompt chaining —
> are covered in Prompting best practices."
> — Anthropic, *Prompt engineering overview*, accessed
> 2026-05-23. [^4]

This is the practitioner-dominant sense; it is what a working
engineer most often means when they say "the prompt."

**Facet B — template-with-slots sense (academic NLP).** In the
academic NLP survey literature, "prompt" denotes a template —
a string with slot(s) to fill — into which an input is folded:

> "the original input x is modified using a template into a
> textual string prompt x'' that has some unfilled slots, and
> then the language model is used to probabilistically fill the
> unfilled information to obtain a final string"
> — Liu, Yuan, Fu, Jiang, Hayashi, Neubig, *Pre-train, Prompt,
> and Predict: A Systematic Survey of Prompting Methods in
> Natural Language Processing*, arXiv:2107.13586, submitted
> 2021-07-28. [^2]

Under this sense the prompt is the abstraction the input
inhabits, not the literal string sent to the model. The
"prompt-based learning" subfield rests on this formalization.

**Facet C — engineered-artifact sense (practitioner /
production).** In production usage, prompts are engineering
artifacts: stored in version control, parameterized with
variables, attached to evals, refactored against regression.
The Anthropic platform documentation surfaces the tooling that
makes this sense operational:

> "The Claude Console also offers prompting tools — prompt
> generator, templates and variables, and prompt improver — to
> help you build and refine prompts quickly."
> — Anthropic, *Prompt engineering overview* (URL above). [^4]

"Prompt engineering" as a discipline lives in this facet.

**Facet D — programming-surface sense (research framing).** In
Reynolds & McDonell 2021, the prompt is a programming surface
on which natural-language structures — narrative framings, role
specifications, decomposed sub-tasks, cultural references — act
as control constructs over the model:

> "We will consider prompts through the lens of natural
> language."
> — Reynolds & McDonell, *Prompt Programming for Large Language
> Models: Beyond the Few-Shot Paradigm*, arXiv:2102.07350,
> submitted 2021-02-15. [^3]

The paper argues for "prompt programming" as a more expansive
approach than few-shot prompting. Facet D overlaps Facet C in
its treatment of prompts as artifacts to be constructed
deliberately; it differs in emphasizing expressive power over
ops discipline.

[^1]: Brown, Mann, Ryder, Subbiah, Kaplan, Dhariwal, Neelakantan,
    Shyam, Sastry, Askell, Agarwal, Herbert-Voss, Krueger,
    Henighan, Child, Ramesh, Ziegler, Wu, Winter, Hesse, Chen,
    Sigler, Litwin, Gray, Chess, Clark, Berner, McCandlish,
    Radford, Sutskever, Amodei, *Language Models are Few-Shot
    Learners*, arXiv:2005.14165, v1 2020-05-28, accessed
    2026-05-23.
    [arxiv.org/abs/2005.14165](https://arxiv.org/abs/2005.14165)

[^2]: Liu, Yuan, Fu, Jiang, Hayashi, Neubig, *Pre-train, Prompt,
    and Predict: A Systematic Survey of Prompting Methods in
    Natural Language Processing*, arXiv:2107.13586, v1
    2021-07-28, accessed 2026-05-23.
    [arxiv.org/abs/2107.13586](https://arxiv.org/abs/2107.13586)

[^3]: Reynolds, McDonell, *Prompt Programming for Large Language
    Models: Beyond the Few-Shot Paradigm*, arXiv:2102.07350, v1
    2021-02-15, accessed 2026-05-23.
    [arxiv.org/abs/2102.07350](https://arxiv.org/abs/2102.07350)

[^4]: Anthropic, *Prompt engineering overview*, accessed
    2026-05-23.
    [platform.claude.com/docs/en/docs/build-with-claude/prompt-engineering/overview](https://platform.claude.com/docs/en/docs/build-with-claude/prompt-engineering/overview)', 'Three live divergences. A reader of this entry can expect to
disambiguate them whenever the word appears unqualified in the
wild.

**(a) prompt-as-input-text vs prompt-as-template (Facet A vs
Facet B).** In a vendor doc, "the prompt" is the literal text
sent to the model. In Liu et al.''s survey, "the prompt" is the
template *into which* an input is folded. A reader bringing the
Facet B sense to a Facet A discussion will look for slots that
aren''t there; a reader bringing Facet A to a Facet B paper will
miss the abstraction the survey papers depend on. The two senses
share a name and disagree on what the name picks out — the
literal text, or the schema the literal text is an instance of.

**(b) system prompt vs user prompt.** Modern chat-formatted APIs
split the prompt into role-tagged segments — typically system /
user / assistant. The system prompt carries durable instructions
about role, constraints, and context; the user prompt carries
the immediate request. Colloquial usage drops the qualifier and
just says "the prompt," and the elision often hides which
segment is doing the work. The vendor-platform documentation
under Facet A [^4] assumes the split; a reader who does not see
it will misread guidance about "prompt engineering" as if it
applies uniformly to a single text.

**(c) ad-hoc prompt vs engineered prompt (Facet A vs Facet C).**
Some sources mean by "prompt" the throwaway text typed into a
chat box; others mean a versioned artifact with tests and a
refactor history. The recurring disagreement about whether
"prompt engineering is still a discipline" is usually this
divergence in disguise: a writer on the Facet A side, whose
prompts are disposable, sees no artifact to engineer; a writer
on the Facet C side, whose prompts ship with evals, sees the
discipline as obviously alive. The two are not arguing about
the same object.

These divergences are not residual ambiguities awaiting
resolution. The senses layer; the layering is the term''s
current state.

[^1]: Brown, Mann, Ryder, Subbiah, Kaplan, Dhariwal, Neelakantan,
    Shyam, Sastry, Askell, Agarwal, Herbert-Voss, Krueger,
    Henighan, Child, Ramesh, Ziegler, Wu, Winter, Hesse, Chen,
    Sigler, Litwin, Gray, Chess, Clark, Berner, McCandlish,
    Radford, Sutskever, Amodei, *Language Models are Few-Shot
    Learners*, arXiv:2005.14165, v1 2020-05-28, accessed
    2026-05-23.
    [arxiv.org/abs/2005.14165](https://arxiv.org/abs/2005.14165)

[^2]: Liu, Yuan, Fu, Jiang, Hayashi, Neubig, *Pre-train, Prompt,
    and Predict: A Systematic Survey of Prompting Methods in
    Natural Language Processing*, arXiv:2107.13586, v1
    2021-07-28, accessed 2026-05-23.
    [arxiv.org/abs/2107.13586](https://arxiv.org/abs/2107.13586)

[^3]: Reynolds, McDonell, *Prompt Programming for Large Language
    Models: Beyond the Few-Shot Paradigm*, arXiv:2102.07350, v1
    2021-02-15, accessed 2026-05-23.
    [arxiv.org/abs/2102.07350](https://arxiv.org/abs/2102.07350)

[^4]: Anthropic, *Prompt engineering overview*, accessed
    2026-05-23.
    [platform.claude.com/docs/en/docs/build-with-claude/prompt-engineering/overview](https://platform.claude.com/docs/en/docs/build-with-claude/prompt-engineering/overview)',
      NULL, NULL, 1,
      'active', '2026-05-23T17:41:02.913Z'
    );

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at)
       VALUES ('0544868c-2604-4d72-bf37-1d9a6fa4becc', 'prompt', 'tool', '2026-05-23T17:41:02.913Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at)
       VALUES ('c0f7a65b-3066-4da2-9f93-ebce5404a6d4', 'prompt', 'skill', '2026-05-23T17:41:02.913Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at)
       VALUES ('45abc97c-0f01-4e3b-b4d0-9cccc86ed650', 'prompt', 'context-window', '2026-05-23T17:41:02.913Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at)
       VALUES ('f8e91196-f16e-4b08-b074-5bf52f1e4a10', 'prompt', 'eval', '2026-05-23T17:41:02.913Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at)
       VALUES ('65edf3e2-94c9-41e0-99ae-24d1e8c2ef72', 'prompt', 'rag', '2026-05-23T17:41:02.913Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at)
       VALUES ('0a16f29a-ad3b-45eb-8dee-dba5035fbeb6', 'prompt', 'retrieval', '2026-05-23T17:41:02.913Z');

INSERT OR IGNORE INTO entries (
      id, slug, title, content_hash,
      definition, first_appearance, etymology,
      current_meaning, divergent_meanings,
      supersession_note, superseded_by_id, version,
      state, published_at
    ) VALUES (
      '5c65e100-01c6-4377-9db1-8fb7f6add314', 'scaffold', 'Scaffold', '524355898e042ae6',
      'The closest thing to a canonical agentic-context definition of
**scaffold** — or *scaffolding* in the gerund form the source
uses — comes from METR (then ARC Evals), in the August 2023
report that introduced the term to the LLM-agent evaluation
community:

> "We wrote programs — along the lines of Auto-GPT — that can
> work with an LLM and allow it to run code on a computer, read
> and write files, browse the internet and otherwise interact
> with the world in a similar way to a human could from a
> text-only command line interface. We call such programs
> ''scaffolding'' and call scaffolding + model combinations
> ''agents.''" [^1]

Operationally: a scaffold is the program around the LLM that
gives it hands — code execution, file I/O, network access —
and a loop in which to use them. The equation
*scaffolding + model = agent* is the load-bearing shorthand the
eval community runs on.

The definition is canonical-adjacent rather than canonical.
METR''s framing remains the citable canonical anchor inside the
safety-and-eval community; outside it, the word drifts — into
*harness* on the practitioner side, into *agent framework* on
the enterprise side. The drift is itself load-bearing, and §5 carries it.

[^1]: METR (then ARC Evals), *Evaluating language-model agents
    on realistic autonomous tasks*, 2023-08-01, accessed
    2026-05-23.
    [metr.org/blog/2023-08-01-new-report/](https://metr.org/blog/2023-08-01-new-report/)

[^2]: METR, *Evaluating frontier AI R&D capabilities of
    language model agents*, 2024-11-22, accessed 2026-05-23.
    Describes the Modular baseline scaffold and AIDE
    tree-search scaffold used in METR''s R&D capability
    evaluation.
    [metr.org/blog/2024-11-22-evaluating-r-d-capabilities-of-llms/](https://metr.org/blog/2024-11-22-evaluating-r-d-capabilities-of-llms/)

[^3]: zbrain, *Agent scaffolding*, enterprise AI overview page,
    accessed 2026-05-23.
    [zbrain.ai/agent-scaffolding/](https://zbrain.ai/agent-scaffolding/)', 'The METR (then ARC Evals) report on
[metr.org/blog/2023-08-01-new-report/](https://metr.org/blog/2023-08-01-new-report/)
(2023-08-01) [^1] is the earliest formal published use that
explicitly names *scaffolding* with the agentic-context meaning,
defines it, and propagates the
*scaffolding + model = agent* equation. The same report nominates
Auto-GPT as the practitioner exemplar the framing generalizes
from; the framing itself — and the labeled noun — is METR''s
contribution.

The metaphor predates this usage. *Scaffold* as a name for a
supportive structure around a learning or developing capability
is the Vygotskian sense from educational psychology, and the
software-engineering sense (test scaffolds, code-generation
scaffolds — code that holds a system up while it is being built
or exercised) is older still. Both lineages are metaphorical
roots rather than citation-grade coinage events for the
agentic-context sense; the citable agentic coinage is METR
2023-08-01.

[^1]: METR (then ARC Evals), *Evaluating language-model agents
    on realistic autonomous tasks*, 2023-08-01, accessed
    2026-05-23.
    [metr.org/blog/2023-08-01-new-report/](https://metr.org/blog/2023-08-01-new-report/)

[^2]: METR, *Evaluating frontier AI R&D capabilities of
    language model agents*, 2024-11-22, accessed 2026-05-23.
    Describes the Modular baseline scaffold and AIDE
    tree-search scaffold used in METR''s R&D capability
    evaluation.
    [metr.org/blog/2024-11-22-evaluating-r-d-capabilities-of-llms/](https://metr.org/blog/2024-11-22-evaluating-r-d-capabilities-of-llms/)

[^3]: zbrain, *Agent scaffolding*, enterprise AI overview page,
    accessed 2026-05-23.
    [zbrain.ai/agent-scaffolding/](https://zbrain.ai/agent-scaffolding/)', 'Borrowed from two intertwined lineages — Vygotskian
*scaffolding* (educational psychology: support structures a
learner relies on, then sheds) and generic software engineering
(test scaffolds, code-generation scaffolds: structure that holds
a system up while it is being built or exercised). Both carry
the same connotation: a scaffold is *there to come off*. The
agentic-context usage honors that connotation only partially.
Scaffolds are author-written rather than model-intrinsic — so
far so consistent with the metaphor — but production agent
scaffolds are not removed once the agent is mature. They are
the runtime. The metaphor breaks at the lifecycle.

[^1]: METR (then ARC Evals), *Evaluating language-model agents
    on realistic autonomous tasks*, 2023-08-01, accessed
    2026-05-23.
    [metr.org/blog/2023-08-01-new-report/](https://metr.org/blog/2023-08-01-new-report/)

[^2]: METR, *Evaluating frontier AI R&D capabilities of
    language model agents*, 2024-11-22, accessed 2026-05-23.
    Describes the Modular baseline scaffold and AIDE
    tree-search scaffold used in METR''s R&D capability
    evaluation.
    [metr.org/blog/2024-11-22-evaluating-r-d-capabilities-of-llms/](https://metr.org/blog/2024-11-22-evaluating-r-d-capabilities-of-llms/)

[^3]: zbrain, *Agent scaffolding*, enterprise AI overview page,
    accessed 2026-05-23.
    [zbrain.ai/agent-scaffolding/](https://zbrain.ai/agent-scaffolding/)',
      'Three live community facets, with the divergence between them
load-bearing for the entry.

**Facet A — Evaluation community (METR-aligned).** The METR
definition above. [^1] In this community *scaffolding* is the
unit of research interest: METR maintains a Modular baseline
scaffold ("a very simple baseline scaffolding that just lets
the model repeatedly run code and see the results") and an
AIDE tree-search scaffold for evaluating reasoning-model
capabilities. [^2] The construct is named, authored, and
varied to isolate its contribution to agent performance.

**Facet B — Practitioner / harness-builder community.**
Practitioner usage often treats *scaffold* and *harness*
interchangeably, with *scaffold* leaning slightly toward "the
code that supports the LLM" and *harness* leaning slightly
toward "the code that controls the LLM." The two terms appear
in the same paragraph in the same post without authors marking
a distinction. The drift is bidirectional — from this facet to
the harness side, and from the harness side back — and the
encyclopedia entry on *harness* (#4) carries the converse drift
explicitly.

**Facet C — Enterprise / marketing usage.** Enterprise framing
expands *agent scaffolding* to cover the full agent platform —
orchestration, memory, tool registry, policy enforcement:

> "Agent scaffolding refers to the software architecture and
> tooling built around a large language model (LLM) to enable
> it to perform complex, goal-driven tasks." [^3]

This is *scaffolding* used where *agent framework* or
*platform* would be more precise. The eval community''s
narrower sense (Facet A) is collapsed into the broader
platform sense; the distinction METR draws is lost.

Convergence finding: MEDIUM. The eval community has a usable
canonical anchor (METR). The practitioner community drifts
into *harness*. The enterprise community drifts into *agent
framework*. No facet has displaced the others, and the drift
is not resolving — *scaffold* in 2026 still picks out
different referents depending on which community''s post a
reader is reading.

[^1]: METR (then ARC Evals), *Evaluating language-model agents
    on realistic autonomous tasks*, 2023-08-01, accessed
    2026-05-23.
    [metr.org/blog/2023-08-01-new-report/](https://metr.org/blog/2023-08-01-new-report/)

[^2]: METR, *Evaluating frontier AI R&D capabilities of
    language model agents*, 2024-11-22, accessed 2026-05-23.
    Describes the Modular baseline scaffold and AIDE
    tree-search scaffold used in METR''s R&D capability
    evaluation.
    [metr.org/blog/2024-11-22-evaluating-r-d-capabilities-of-llms/](https://metr.org/blog/2024-11-22-evaluating-r-d-capabilities-of-llms/)

[^3]: zbrain, *Agent scaffolding*, enterprise AI overview page,
    accessed 2026-05-23.
    [zbrain.ai/agent-scaffolding/](https://zbrain.ai/agent-scaffolding/)', 'The divergence is the entry. Three live senses, distinguishable
but used interchangeably in the wild:

1. **Scaffold — METR sense.** The specific program that gives
   an LLM hands (code execution, file I/O, network) and a loop
   in which to use them. Author-written; per-evaluation;
   intentionally narrow. Defines what *agent* means when paired
   with a model: *scaffolding + model = agent*.
2. **Scaffold as harness (practitioner drift).** Used as a
   synonym for the runtime wrapper code — message routing, tool
   dispatch, retry, state, termination. The *harness* entry''s
   §5 names the converse drift from the harness side; the two
   entries pair around the same vocabulary instability.
3. **Scaffold as agent framework (enterprise drift).** The
   whole platform — orchestrator, memory, tool registry, policy
   enforcement. Effectively *agent framework* with a softer-
   sounding word; collapses the eval community''s narrower
   distinction.

The reading errors the divergence produces are concrete:

- A reader bringing the **METR sense** to an enterprise vendor
  page will look for the specific code that gives an LLM hands
  and find instead a platform-level capability inventory; the
  *scaffolding + model = agent* equation has no foothold in
  the broader sense.
- A reader bringing the **practitioner sense** to a METR eval
  paper will read *scaffold* as a synonym for harness and miss
  that METR is treating scaffold choice as an isolatable
  independent variable.
- A reader bringing the **enterprise sense** to a practitioner
  blog will over-read *scaffold* as the full platform when the
  post is using it for the wrapper code alone.

The senses coexist; none supersedes the others. The form is the
same word; the institutional commitments around what it picks
out are not.

[^1]: METR (then ARC Evals), *Evaluating language-model agents
    on realistic autonomous tasks*, 2023-08-01, accessed
    2026-05-23.
    [metr.org/blog/2023-08-01-new-report/](https://metr.org/blog/2023-08-01-new-report/)

[^2]: METR, *Evaluating frontier AI R&D capabilities of
    language model agents*, 2024-11-22, accessed 2026-05-23.
    Describes the Modular baseline scaffold and AIDE
    tree-search scaffold used in METR''s R&D capability
    evaluation.
    [metr.org/blog/2024-11-22-evaluating-r-d-capabilities-of-llms/](https://metr.org/blog/2024-11-22-evaluating-r-d-capabilities-of-llms/)

[^3]: zbrain, *Agent scaffolding*, enterprise AI overview page,
    accessed 2026-05-23.
    [zbrain.ai/agent-scaffolding/](https://zbrain.ai/agent-scaffolding/)',
      'No supersession. *Scaffold* remains active in all three senses;
the practitioner drift with *harness* and the enterprise drift
toward *agent framework* have not resolved into a winner, and
no field-wide successor term has emerged.

[^1]: METR (then ARC Evals), *Evaluating language-model agents
    on realistic autonomous tasks*, 2023-08-01, accessed
    2026-05-23.
    [metr.org/blog/2023-08-01-new-report/](https://metr.org/blog/2023-08-01-new-report/)

[^2]: METR, *Evaluating frontier AI R&D capabilities of
    language model agents*, 2024-11-22, accessed 2026-05-23.
    Describes the Modular baseline scaffold and AIDE
    tree-search scaffold used in METR''s R&D capability
    evaluation.
    [metr.org/blog/2024-11-22-evaluating-r-d-capabilities-of-llms/](https://metr.org/blog/2024-11-22-evaluating-r-d-capabilities-of-llms/)

[^3]: zbrain, *Agent scaffolding*, enterprise AI overview page,
    accessed 2026-05-23.
    [zbrain.ai/agent-scaffolding/](https://zbrain.ai/agent-scaffolding/)', NULL, 1,
      'active', '2026-05-23T17:41:02.913Z'
    );

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at)
       VALUES ('0bcb0cdc-0915-4c0a-b246-e3e2106c0ea3', 'scaffold', 'harness', '2026-05-23T17:41:02.913Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at)
       VALUES ('3acb41e1-7813-41b8-8824-0feb2b90e6c9', 'scaffold', 'agent', '2026-05-23T17:41:02.913Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at)
       VALUES ('6ed0e413-7a09-493b-897b-3a20d4c466df', 'scaffold', 'loop', '2026-05-23T17:41:02.913Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at)
       VALUES ('7b353c3a-54de-4932-8da7-afa79763eeee', 'scaffold', 'tool', '2026-05-23T17:41:02.913Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at)
       VALUES ('28e6b881-1022-4ccb-b9f1-bc04f2bc629a', 'scaffold', 'skill', '2026-05-23T17:41:02.913Z');

INSERT OR IGNORE INTO entries (
      id, slug, title, content_hash,
      definition, first_appearance, etymology,
      current_meaning, divergent_meanings,
      supersession_note, superseded_by_id, version,
      state, published_at
    ) VALUES (
      '66b07dc4-a7b2-4081-8c4b-0b1692f48f51', 'retrieval', 'Retrieval', '557a359f25c4aac2',
      '**Retrieval**, in the field-canonical sense, is the operation of
finding material relevant to an information need from within a
larger collection. The textbook-anchored definition:

> "Information retrieval (IR) is finding material (usually
> documents) of an unstructured nature (usually text) that
> satisfies an information need from within large collections
> (usually stored on computers)."
> — Manning, Raghavan & Schütze, *Introduction to Information
> Retrieval*, Cambridge University Press, 2008, Ch. 1 §1. [^1]

In the agentic-context sense that emerged with the modern
LLM literature, *retrieval* names any process — sparse, dense,
or hybrid — that selects relevant material from a store and
supplies it to a model as conditioning context, rather than
returning a ranked list to a human reader. The two senses
*layer*: the agentic-context sense extends the IR-textbook
sense, and does not displace it. §5 carries the load-bearing
relationship between this entry and #17 RAG.

[^1]: Manning, Raghavan & Schütze, *Introduction to Information
    Retrieval*, Cambridge University Press, 2008, Ch. 1 §1.
    ISBN 0521865719. HTML edition last updated 2009-04-07,
    accessed 2026-05-23.
    [nlp.stanford.edu/IR-book/html/htmledition/boolean-retrieval-1.html](https://nlp.stanford.edu/IR-book/html/htmledition/boolean-retrieval-1.html)

[^2]: Karpukhin, Oğuz, Min, Lewis, Wu, Edunov, Chen, Yih, *Dense
    Passage Retrieval for Open-Domain Question Answering*,
    arXiv:2004.04906, v1 2020-04-10, v3 2020-09-30, accessed
    2026-05-23.
    [arxiv.org/abs/2004.04906](https://arxiv.org/abs/2004.04906)

[^3]: Lewis, Perez, Piktus, Petroni, Karpukhin, Goyal, Küttler,
    Lewis, Yih, Rocktäschel, Riedel, Kiela, *Retrieval-Augmented
    Generation for Knowledge-Intensive NLP Tasks*,
    arXiv:2005.11401, v1 2020-05-22, v4 2021-04-12, accessed
    2026-05-23.
    [arxiv.org/abs/2005.11401](https://arxiv.org/abs/2005.11401)', 'No single first-appearance date is defensible — the word
*retrieval* in computing predates the agentic-context scope of
this encyclopedia by decades. Two primary anchors are honest:

**Classical IR (textbook canon).** Manning, Raghavan & Schütze,
*Introduction to Information Retrieval*, Cambridge University
Press, 2008. [^1] This is the textbook the field cites when it
wants a stable anchor; the discipline itself dates to the
1950s–1960s (Salton et al., SMART system). The 2008 textbook is
the citation hook, not the term''s origin.

**Agentic-context inflection: sparse → dense retrieval.** The
single-paper inflection from sparse retrieval (TF-IDF / BM25)
to dense, learned, dual-encoder retrieval in the LLM-adjacent
literature is Karpukhin et al. 2020:

> "Open-domain question answering relies on efficient passage
> retrieval to select candidate contexts, where traditional
> sparse vector space models, such as TF-IDF or BM25, are the
> de facto method. In this work, we show that retrieval can be
> practically implemented using dense representations alone,
> where embeddings are learned from a small number of questions
> and passages by a simple dual-encoder framework."
> — Karpukhin, Oğuz, Min, Lewis, Wu, Edunov, Chen, Yih, *Dense
> Passage Retrieval for Open-Domain Question Answering*,
> arXiv:2004.04906, submitted 2020-04-10. [^2]

DPR is not the first occurrence of the word; it is the most
cited single-paper pivot from sparse → dense retrieval in the
LLM-adjacent lineage, and it is the citation the agentic-context
sense rests on when distinguishing vector retrieval from BM25.

Both anchors are surfaced honestly. Collapsing the lineage to a
single date would misrepresent the term''s history.

[^1]: Manning, Raghavan & Schütze, *Introduction to Information
    Retrieval*, Cambridge University Press, 2008, Ch. 1 §1.
    ISBN 0521865719. HTML edition last updated 2009-04-07,
    accessed 2026-05-23.
    [nlp.stanford.edu/IR-book/html/htmledition/boolean-retrieval-1.html](https://nlp.stanford.edu/IR-book/html/htmledition/boolean-retrieval-1.html)

[^2]: Karpukhin, Oğuz, Min, Lewis, Wu, Edunov, Chen, Yih, *Dense
    Passage Retrieval for Open-Domain Question Answering*,
    arXiv:2004.04906, v1 2020-04-10, v3 2020-09-30, accessed
    2026-05-23.
    [arxiv.org/abs/2004.04906](https://arxiv.org/abs/2004.04906)

[^3]: Lewis, Perez, Piktus, Petroni, Karpukhin, Goyal, Küttler,
    Lewis, Yih, Rocktäschel, Riedel, Kiela, *Retrieval-Augmented
    Generation for Knowledge-Intensive NLP Tasks*,
    arXiv:2005.11401, v1 2020-05-22, v4 2021-04-12, accessed
    2026-05-23.
    [arxiv.org/abs/2005.11401](https://arxiv.org/abs/2005.11401)', 'Latin *retrahere* — "draw back" — through late Latin
*retrievare* and Old French *retrover*. The computing sense
narrows the ordinary-English meaning to "find and return on
demand from a store." No deeper lineage worth elaborating; the
term''s IR-textbook meaning is constructive from ordinary
English, and the load-bearing nuance lives in §4 and §5, not §3.

[^1]: Manning, Raghavan & Schütze, *Introduction to Information
    Retrieval*, Cambridge University Press, 2008, Ch. 1 §1.
    ISBN 0521865719. HTML edition last updated 2009-04-07,
    accessed 2026-05-23.
    [nlp.stanford.edu/IR-book/html/htmledition/boolean-retrieval-1.html](https://nlp.stanford.edu/IR-book/html/htmledition/boolean-retrieval-1.html)

[^2]: Karpukhin, Oğuz, Min, Lewis, Wu, Edunov, Chen, Yih, *Dense
    Passage Retrieval for Open-Domain Question Answering*,
    arXiv:2004.04906, v1 2020-04-10, v3 2020-09-30, accessed
    2026-05-23.
    [arxiv.org/abs/2004.04906](https://arxiv.org/abs/2004.04906)

[^3]: Lewis, Perez, Piktus, Petroni, Karpukhin, Goyal, Küttler,
    Lewis, Yih, Rocktäschel, Riedel, Kiela, *Retrieval-Augmented
    Generation for Knowledge-Intensive NLP Tasks*,
    arXiv:2005.11401, v1 2020-05-22, v4 2021-04-12, accessed
    2026-05-23.
    [arxiv.org/abs/2005.11401](https://arxiv.org/abs/2005.11401)',
      'Four facets carry the working senses of the term in 2026. Each
is primary-source cited.

**Facet A — Classical IR (academic / textbook).** Finding
material that satisfies an information need from within large
collections. Source: Manning, Raghavan & Schütze 2008, Ch. 1
(quoted in §1). [^1] This is the textbook canon — what
graduate IR courses teach, what TREC evaluates against, and
what carries the evaluation vocabulary (precision, recall, MAP,
nDCG) that the field uses to judge retrieval quality.

**Facet B — Sparse retrieval (BM25 / TF-IDF lineage).** Term
weights, inverted indices, lexical matching. Karpukhin et al.
2020 names this "the de facto method" the dense-retriever
literature defines itself against:

> "traditional sparse vector space models, such as TF-IDF or
> BM25, are the de facto method." [^2]

Lucene / Elasticsearch / OpenSearch are the de-facto production
implementations of Facet B retrieval at scale.

**Facet C — Dense retrieval (vector / dual-encoder).**
Embeddings learned per question and per passage; nearest-
neighbor search over a dense index. Karpukhin et al. 2020:

> "retrieval can be practically implemented using dense
> representations alone, where embeddings are learned … by a
> simple dual-encoder framework." [^2]

This is the facet that powers modern vector-database practice —
FAISS, pgvector, Pinecone, Weaviate, and the rest. It is the
sense most often invoked when a 2026 system describes itself as
doing "retrieval."

**Facet D — Agentic-context, in-pipeline retrieval.** Retrieval
performed inside or upstream of a language-model call, supplying
selected material as conditioning context rather than returning
a ranked list to a human. The consumer is a model, not a person.
Hybrid retrieval (sparse + dense + rerank) and tool-shaped
retrieval (search APIs invoked by an agent loop) both fall under
this facet. No single citation defines the broadening; two
papers together establish the inflection — Karpukhin et al.
2020 above [^2], and:

> "non-parametric memory is a dense vector index of Wikipedia,
> accessed with a pre-trained neural retriever."
> — Lewis et al., *Retrieval-Augmented Generation for
> Knowledge-Intensive NLP Tasks*, arXiv:2005.11401, v1
> 2020-05-22, v4 2021-04-12. [^3]

Facet D is where #17 RAG and this entry meet; the relationship
is the subject of §5.

[^1]: Manning, Raghavan & Schütze, *Introduction to Information
    Retrieval*, Cambridge University Press, 2008, Ch. 1 §1.
    ISBN 0521865719. HTML edition last updated 2009-04-07,
    accessed 2026-05-23.
    [nlp.stanford.edu/IR-book/html/htmledition/boolean-retrieval-1.html](https://nlp.stanford.edu/IR-book/html/htmledition/boolean-retrieval-1.html)

[^2]: Karpukhin, Oğuz, Min, Lewis, Wu, Edunov, Chen, Yih, *Dense
    Passage Retrieval for Open-Domain Question Answering*,
    arXiv:2004.04906, v1 2020-04-10, v3 2020-09-30, accessed
    2026-05-23.
    [arxiv.org/abs/2004.04906](https://arxiv.org/abs/2004.04906)

[^3]: Lewis, Perez, Piktus, Petroni, Karpukhin, Goyal, Küttler,
    Lewis, Yih, Rocktäschel, Riedel, Kiela, *Retrieval-Augmented
    Generation for Knowledge-Intensive NLP Tasks*,
    arXiv:2005.11401, v1 2020-05-22, v4 2021-04-12, accessed
    2026-05-23.
    [arxiv.org/abs/2005.11401](https://arxiv.org/abs/2005.11401)', 'The encyclopedia''s reader can expect to meet *retrieval* and
*RAG* (entry #17) routinely conflated in 2026 practitioner
discourse. The conflation misleads in two distinct ways. This
section names both, and pairs bidirectionally with #17 §5 — the
two entries are written to be read together.

**Axis 1 — scope: RAG ⊂ retrieval.** Retrieval is the superset.
RAG is one downstream pipeline shape built on top of retrieval:
retrieve, then condition a generator on the retrieved material.
A semantic-search service is retrieval but is not RAG — no
generator follows. A classical IR system returning a ranked
document list to a user is retrieval but is not RAG. RAG
without retrieval is incoherent; retrieval without RAG is the
larger and older half of the diagram. A reader who treats the
two as interchangeable will reach for a vector-database tutorial
when they need a search-quality discussion, and vice versa.

**Axis 2 — lineage: IR-academic vs LLM-applied, meeting at
DPR.** Retrieval carries an IR-academic lineage: Salton''s SMART
system, the Manning / Raghavan / Schütze textbook canon [^1],
BM25 and Lucene, the TREC evaluation tradition. RAG carries an
LLM-applied-research lineage: Karpukhin et al. 2020 DPR
[^2] and Lewis et al. 2020 RAG [^3], with later practitioner
broadening through vendor documentation. The two lineages meet
at DPR — DPR is where the IR-academic dense-retriever literature
becomes the substrate the agentic-context lineage builds on.

A source citing "retrieval" from the IR-academic side carries
decades of evaluation discipline — precision, recall, MAP, nDCG —
that the RAG-practitioner side often does not invoke. Conflating
the two erases the evaluation infrastructure that distinguishes
them. The honest reading is layering, not displacement: two
senses now coexist, both load-bearing, and a reader''s first move
on meeting "retrieval" in the wild is to label which sense the
source is reaching for.

This section pairs with #17 RAG §5. The intended cross-link:
RAG ⊂ retrieval (by scope) and RAG ⊥ IR-academic-lineage (by
tradition).

[^1]: Manning, Raghavan & Schütze, *Introduction to Information
    Retrieval*, Cambridge University Press, 2008, Ch. 1 §1.
    ISBN 0521865719. HTML edition last updated 2009-04-07,
    accessed 2026-05-23.
    [nlp.stanford.edu/IR-book/html/htmledition/boolean-retrieval-1.html](https://nlp.stanford.edu/IR-book/html/htmledition/boolean-retrieval-1.html)

[^2]: Karpukhin, Oğuz, Min, Lewis, Wu, Edunov, Chen, Yih, *Dense
    Passage Retrieval for Open-Domain Question Answering*,
    arXiv:2004.04906, v1 2020-04-10, v3 2020-09-30, accessed
    2026-05-23.
    [arxiv.org/abs/2004.04906](https://arxiv.org/abs/2004.04906)

[^3]: Lewis, Perez, Piktus, Petroni, Karpukhin, Goyal, Küttler,
    Lewis, Yih, Rocktäschel, Riedel, Kiela, *Retrieval-Augmented
    Generation for Knowledge-Intensive NLP Tasks*,
    arXiv:2005.11401, v1 2020-05-22, v4 2021-04-12, accessed
    2026-05-23.
    [arxiv.org/abs/2005.11401](https://arxiv.org/abs/2005.11401)',
      NULL, NULL, 1,
      'active', '2026-05-23T17:41:02.913Z'
    );

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at)
       VALUES ('4f97acaf-b279-4310-b305-7ca601a8593b', 'retrieval', 'rag', '2026-05-23T17:41:02.913Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at)
       VALUES ('ca04ec16-18b1-4f33-a7bd-02bd7892a8bb', 'retrieval', 'embedding', '2026-05-23T17:41:02.913Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at)
       VALUES ('69f84b61-4483-4ce9-a359-93affec27447', 'retrieval', 'memory', '2026-05-23T17:41:02.913Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at)
       VALUES ('1fc5b518-f316-47f2-b3b0-e66b2382f365', 'retrieval', 'context-window', '2026-05-23T17:41:02.913Z');
