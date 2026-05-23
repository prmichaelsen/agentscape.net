INSERT OR IGNORE INTO entries (id, slug, title, content_hash, definition, first_appearance, etymology, current_meaning, divergent_meanings, supersession_note, superseded_by_id, version, state, published_at) VALUES ('77273e90-3830-4001-96c5-d6ba08d734f0', 'tool', 'Tool', 'f97c2254bba45707', 'A **tool**, in the agentic-AI vocabulary that crystallized over
2023–2025, is a named, schema-described function exposed to a
language model so the model can request its invocation as part of
an agent loop. The runtime executes the tool and returns a
structured result that feeds back into the model''s next turn.

The earliest research framing of the construct is Schick et al.''s
*Toolformer*:

> "LMs can teach themselves to use external tools via simple
> APIs." [^1]

The earliest product-API framing, four months later, is OpenAI''s
function-calling launch on 2023-06-13, which exposed the construct
as a `functions` request parameter on GPT-4 and GPT-3.5-turbo [^2].
Anthropic''s later platform docs settle the cross-vendor wording:

> "Tool use lets Claude call functions you define or that
> Anthropic provides. Claude decides when to call a tool based on
> the user''s request and the tool''s description, then returns a
> structured call that your application executes (client tools) or
> that Anthropic executes (server tools)." [^3]

Toolformer, OpenAI, and Anthropic all converge on the same shape:
a named callable, a schema the model reads, a structured
invocation the model emits, and a result the runtime feeds back.
That cross-source agreement is the framing the entry leads on.

[^1]: Schick et al., *Toolformer: Language Models Can Teach
    Themselves to Use Tools*, arXiv:2302.04761, 2023-02-09,
    accessed 2026-05-23.
    [arxiv.org/abs/2302.04761](https://arxiv.org/abs/2302.04761)

[^2]: OpenAI, *Function calling and other API updates*,
    2023-06-13, accessed 2026-05-23.
    [openai.com/index/function-calling-and-other-api-updates/](https://openai.com/index/function-calling-and-other-api-updates/)
    (URL 403''d to bare-HTTP WebFetch this wake; verifier to
    confirm via browser_fetch — see drafter notes.)

[^3]: Anthropic, *Tool use with Claude*, accessed 2026-05-23.
    [platform.claude.com/docs/en/agents-and-tools/tool-use/overview](https://platform.claude.com/docs/en/agents-and-tools/tool-use/overview)

[^4]: OpenAI, *Function calling guide*, accessed 2026-05-23.
    [platform.openai.com/docs/guides/function-calling](https://platform.openai.com/docs/guides/function-calling)
    (URL 403''d to bare-HTTP WebFetch this wake; verifier to
    confirm via browser_fetch.)

[^5]: Model Context Protocol specification, *Tools*, revision
    2025-06-18, accessed 2026-05-23.
    [modelcontextprotocol.io/specification/2025-06-18/server/tools](https://modelcontextprotocol.io/specification/2025-06-18/server/tools)', 'Two first appearances, both load-bearing, because the term entered
research and production through separate doors within four months.

**Research-context first appearance: 2023-02-09.** Schick et al.,
*Toolformer: Language Models Can Teach Themselves to Use Tools*,
arXiv:2302.04761 [^1]. The paper demonstrates self-supervised
learning of when and which tool to call across a calculator, a
Q&A system, two search engines, a translator, and a calendar.
"Tool" is used descriptively, not as an API noun — but this is
the earliest paper that treats tool-use as a first-class
capability of a language model rather than as an external
scaffolding layer.

**Product-API first appearance: 2023-06-13.** OpenAI, *Function
calling and other API updates* [^2]. GPT-4 and GPT-3.5-turbo gain
a `functions` request parameter; the model returns a structured
`function_call` object the developer''s code executes. The
parameter name at launch was "function," not "tool" — the
terminology shift is the load-bearing divergence in §5.

Anthropic''s tool-use docs and the MCP Tool primitive follow these
two seeds; both are 2024–2025 crystallizations of the construct
the 2023 papers and API launches established.

[^1]: Schick et al., *Toolformer: Language Models Can Teach
    Themselves to Use Tools*, arXiv:2302.04761, 2023-02-09,
    accessed 2026-05-23.
    [arxiv.org/abs/2302.04761](https://arxiv.org/abs/2302.04761)

[^2]: OpenAI, *Function calling and other API updates*,
    2023-06-13, accessed 2026-05-23.
    [openai.com/index/function-calling-and-other-api-updates/](https://openai.com/index/function-calling-and-other-api-updates/)
    (URL 403''d to bare-HTTP WebFetch this wake; verifier to
    confirm via browser_fetch — see drafter notes.)

[^3]: Anthropic, *Tool use with Claude*, accessed 2026-05-23.
    [platform.claude.com/docs/en/agents-and-tools/tool-use/overview](https://platform.claude.com/docs/en/agents-and-tools/tool-use/overview)

[^4]: OpenAI, *Function calling guide*, accessed 2026-05-23.
    [platform.openai.com/docs/guides/function-calling](https://platform.openai.com/docs/guides/function-calling)
    (URL 403''d to bare-HTTP WebFetch this wake; verifier to
    confirm via browser_fetch.)

[^5]: Model Context Protocol specification, *Tools*, revision
    2025-06-18, accessed 2026-05-23.
    [modelcontextprotocol.io/specification/2025-06-18/server/tools](https://modelcontextprotocol.io/specification/2025-06-18/server/tools)', 'Omitted. "Tool" is used in its ordinary English sense throughout.
Toolformer''s title is descriptive ("teach themselves to use
tools"); OpenAI''s choice of "function" then "tools" was an
API-naming decision, not a coinage with a deeper lineage worth a
reader''s time.

[^1]: Schick et al., *Toolformer: Language Models Can Teach
    Themselves to Use Tools*, arXiv:2302.04761, 2023-02-09,
    accessed 2026-05-23.
    [arxiv.org/abs/2302.04761](https://arxiv.org/abs/2302.04761)

[^2]: OpenAI, *Function calling and other API updates*,
    2023-06-13, accessed 2026-05-23.
    [openai.com/index/function-calling-and-other-api-updates/](https://openai.com/index/function-calling-and-other-api-updates/)
    (URL 403''d to bare-HTTP WebFetch this wake; verifier to
    confirm via browser_fetch — see drafter notes.)

[^3]: Anthropic, *Tool use with Claude*, accessed 2026-05-23.
    [platform.claude.com/docs/en/agents-and-tools/tool-use/overview](https://platform.claude.com/docs/en/agents-and-tools/tool-use/overview)

[^4]: OpenAI, *Function calling guide*, accessed 2026-05-23.
    [platform.openai.com/docs/guides/function-calling](https://platform.openai.com/docs/guides/function-calling)
    (URL 403''d to bare-HTTP WebFetch this wake; verifier to
    confirm via browser_fetch.)

[^5]: Model Context Protocol specification, *Tools*, revision
    2025-06-18, accessed 2026-05-23.
    [modelcontextprotocol.io/specification/2025-06-18/server/tools](https://modelcontextprotocol.io/specification/2025-06-18/server/tools)', 'The construct is one of the strongest cross-vendor convergences in
the agentic vocabulary. The facets differ in API surface, not in
underlying shape.

**Facet A — OpenAI Chat Completions / Assistants sense.** A
`tools` array on the request, each element shaped as `{type:
"function", function: {name, description, parameters}}` where
`parameters` is a JSON Schema. The model returns a `tool_calls`
array; the developer''s code executes the call and posts back
`role: "tool"` messages on the next turn. [^4]

**Facet B — Anthropic Messages API sense, with client/server
split.** A `tools` array on the request; each element carries
`name`, `description`, and `input_schema` (JSON Schema). The
model returns `stop_reason: "tool_use"` and one or more
`tool_use` content blocks; the caller responds with `tool_result`
blocks. Anthropic draws an additional distinction not present at
OpenAI''s API surface: **client tools** execute in the caller''s
code, **server tools** execute in Anthropic''s infrastructure
(`web_search`, `code_execution`, `web_fetch`, `tool_search`). [^3]

**Facet C — MCP Tool primitive (protocol-shape, cross-vendor).**
The Model Context Protocol elevates "Tool" to a model-controlled
protocol primitive, decoupling the construct from any single
vendor''s API:

> "The Model Context Protocol (MCP) allows servers to expose
> tools that can be invoked by language models. Tools enable
> models to interact with external systems, such as querying
> databases, calling APIs, or performing computations. Each tool
> is uniquely identified by a name and includes metadata
> describing its schema." [^5]

MCP tools are explicitly *model-controlled* — the spec''s term:
the model "can discover and invoke tools automatically based on
its contextual understanding and the user''s prompts." Tools are
one of three MCP primitives (resources, prompts, tools).
Invocation goes through `tools/call`; discovery through
`tools/list`. Tool data type: `name`, optional `title`,
`description`, `inputSchema`, optional `outputSchema`, optional
`annotations`.

**Facet D — Google Gemini "tools" sense.** Same shape as Facets
A and B: a tools array of function declarations with JSON Schema
parameters; the model returns a structured invocation request the
runtime executes. Convergent with the others at the conceptual
level; SDK-level naming differs.

**Facet E — agent-framework sense (LangChain, smolagents, the
OpenAI Agents SDK, the Claude Agent SDK).** A tool is a Python
callable (or equivalent in another runtime) registered with the
framework, which translates the callable''s signature into the
vendor''s tool-spec on the wire. The conceptual shape is
preserved; the wrapping convention is framework-local.

Convergence finding (the structural reading): across OpenAI,
Anthropic, Google, MCP, and the major agent frameworks, the
construct is one thing — a named, schema-described callable, with
the model emitting a structured invocation request, the runtime
executing it, and the result feeding the next model turn. The
divergences are at the parameter-name level, not at the
construct level.

[^1]: Schick et al., *Toolformer: Language Models Can Teach
    Themselves to Use Tools*, arXiv:2302.04761, 2023-02-09,
    accessed 2026-05-23.
    [arxiv.org/abs/2302.04761](https://arxiv.org/abs/2302.04761)

[^2]: OpenAI, *Function calling and other API updates*,
    2023-06-13, accessed 2026-05-23.
    [openai.com/index/function-calling-and-other-api-updates/](https://openai.com/index/function-calling-and-other-api-updates/)
    (URL 403''d to bare-HTTP WebFetch this wake; verifier to
    confirm via browser_fetch — see drafter notes.)

[^3]: Anthropic, *Tool use with Claude*, accessed 2026-05-23.
    [platform.claude.com/docs/en/agents-and-tools/tool-use/overview](https://platform.claude.com/docs/en/agents-and-tools/tool-use/overview)

[^4]: OpenAI, *Function calling guide*, accessed 2026-05-23.
    [platform.openai.com/docs/guides/function-calling](https://platform.openai.com/docs/guides/function-calling)
    (URL 403''d to bare-HTTP WebFetch this wake; verifier to
    confirm via browser_fetch.)

[^5]: Model Context Protocol specification, *Tools*, revision
    2025-06-18, accessed 2026-05-23.
    [modelcontextprotocol.io/specification/2025-06-18/server/tools](https://modelcontextprotocol.io/specification/2025-06-18/server/tools)', 'Convergence is high enough that this section is short on purpose;
manufacturing divergence to fill space would misrepresent the
state of the term.

**Function vs tool (the OpenAI 2023-06 → 2023-11 terminology
shift).** OpenAI''s June 2023 launch [^2] used a `functions`
parameter and returned `function_call` objects. The November 2023
Assistants API release [^4] introduced a `tools` array whose
elements were typed `{type: "function", ...}`, superseding the
bare `functions` parameter. The legacy `functions` parameter
remains supported as an alias. The cross-vendor vocabulary
settled on "tool" — not "function" — by late 2023, which is why
this encyclopedia entry''s slug is "tool." Readers encountering
"function" in newer documentation are reading either OpenAI legacy
code or a vendor-specific naming carry-over.

**Tool vs skill (entry #5).** A tool is a single named callable.
A skill is a filesystem-resident bundle of instructions, optional
scripts, and optional resources that an agent loads when relevant.
Many tools, one skill; a skill can invoke tools, a tool cannot
invoke a skill. The two are orthogonal primitives.

**Tool vs MCP server (entry #14).** MCP is a protocol that
exposes tools across a server boundary. A tool is the thing
exposed; an MCP server is the carrier. "An MCP tool" is a tool
reached via MCP. Many tools per MCP server.

**Tool vs agent (entry #1).** An agent uses tools. A tool is not
an agent — it has no loop, no model, no memory. Tools that wrap
sub-agents ("agents as tools") are a real pattern, but in that
pattern the tool is the interface layer; the agent is what the
tool calls.

**Client tool vs server tool (Anthropic-specific scope note).**
The client/server split is an Anthropic distinction at the API
surface. OpenAI does not draw this distinction in the same way —
all function tools are client-side; OpenAI''s hosted retrieval and
code-interpreter are exposed through different surfaces. Readers
should not over-generalize the Anthropic split to cross-vendor.

[^1]: Schick et al., *Toolformer: Language Models Can Teach
    Themselves to Use Tools*, arXiv:2302.04761, 2023-02-09,
    accessed 2026-05-23.
    [arxiv.org/abs/2302.04761](https://arxiv.org/abs/2302.04761)

[^2]: OpenAI, *Function calling and other API updates*,
    2023-06-13, accessed 2026-05-23.
    [openai.com/index/function-calling-and-other-api-updates/](https://openai.com/index/function-calling-and-other-api-updates/)
    (URL 403''d to bare-HTTP WebFetch this wake; verifier to
    confirm via browser_fetch — see drafter notes.)

[^3]: Anthropic, *Tool use with Claude*, accessed 2026-05-23.
    [platform.claude.com/docs/en/agents-and-tools/tool-use/overview](https://platform.claude.com/docs/en/agents-and-tools/tool-use/overview)

[^4]: OpenAI, *Function calling guide*, accessed 2026-05-23.
    [platform.openai.com/docs/guides/function-calling](https://platform.openai.com/docs/guides/function-calling)
    (URL 403''d to bare-HTTP WebFetch this wake; verifier to
    confirm via browser_fetch.)

[^5]: Model Context Protocol specification, *Tools*, revision
    2025-06-18, accessed 2026-05-23.
    [modelcontextprotocol.io/specification/2025-06-18/server/tools](https://modelcontextprotocol.io/specification/2025-06-18/server/tools)', 'Partial, within-vendor: OpenAI''s `functions` parameter
(2023-06-13) was effectively superseded by the `tools` array with
the Assistants API release (2023-11-06). The legacy `functions`
parameter still works as an alias; the cross-vendor settlement on
"tool" is complete.

[^1]: Schick et al., *Toolformer: Language Models Can Teach
    Themselves to Use Tools*, arXiv:2302.04761, 2023-02-09,
    accessed 2026-05-23.
    [arxiv.org/abs/2302.04761](https://arxiv.org/abs/2302.04761)

[^2]: OpenAI, *Function calling and other API updates*,
    2023-06-13, accessed 2026-05-23.
    [openai.com/index/function-calling-and-other-api-updates/](https://openai.com/index/function-calling-and-other-api-updates/)
    (URL 403''d to bare-HTTP WebFetch this wake; verifier to
    confirm via browser_fetch — see drafter notes.)

[^3]: Anthropic, *Tool use with Claude*, accessed 2026-05-23.
    [platform.claude.com/docs/en/agents-and-tools/tool-use/overview](https://platform.claude.com/docs/en/agents-and-tools/tool-use/overview)

[^4]: OpenAI, *Function calling guide*, accessed 2026-05-23.
    [platform.openai.com/docs/guides/function-calling](https://platform.openai.com/docs/guides/function-calling)
    (URL 403''d to bare-HTTP WebFetch this wake; verifier to
    confirm via browser_fetch.)

[^5]: Model Context Protocol specification, *Tools*, revision
    2025-06-18, accessed 2026-05-23.
    [modelcontextprotocol.io/specification/2025-06-18/server/tools](https://modelcontextprotocol.io/specification/2025-06-18/server/tools)', NULL, 1, 'active', '2026-05-23T17:11:08.702Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at) VALUES ('38488ca8-d143-44d2-b9ba-0252ed3b386f', 'tool', 'agent', '2026-05-23T17:11:08.702Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at) VALUES ('c92b2d30-d9d6-4a81-8a01-340f1d7deda9', 'tool', 'mcp', '2026-05-23T17:11:08.702Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at) VALUES ('1bfdd120-cfe4-4188-96b1-ef6ea5319310', 'tool', 'skill', '2026-05-23T17:11:08.702Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at) VALUES ('395f4057-7469-4505-aa21-26e63b4e203f', 'tool', 'permission', '2026-05-23T17:11:08.702Z');

INSERT OR IGNORE INTO entries (id, slug, title, content_hash, definition, first_appearance, etymology, current_meaning, divergent_meanings, supersession_note, superseded_by_id, version, state, published_at) VALUES ('7cc343cd-7249-4124-82ea-ad49e33c72b4', 'context-window', 'Context window', 'e201746a9c26484a', 'A **context window** is the set of tokens a language model can
reference in a single forward pass when generating a response,
including the tokens of the response itself. It is the model''s
working memory for one inference: the prompt, any prior turns the
caller has carried forward, any tool results pasted in, and the
output the model is in the process of producing all draw from one
bounded pool.

The cleanest contemporary primary-source definition is Anthropic''s:

> "The ''context window'' refers to all the text a language model can
> reference when generating a response, including the response
> itself. This is different from the large corpus of data the
> language model was trained on, and instead represents a ''working
> memory'' for the model." [^1]

Google frames the same construct through the same analogy: "An
analogy for the context window is short term memory." [^2]
Anthropic and Google both frame the construct as working memory;
this cross-vendor agreement is the framing the entry leads on. The
training-corpus distinction it carries (working memory is not
training data) is the one most often confused in non-technical
writing about the term.

[^1]: Anthropic, *Context windows*, accessed 2026-05-23.
    [platform.claude.com/docs/en/docs/build-with-claude/context-windows](https://platform.claude.com/docs/en/docs/build-with-claude/context-windows)

[^2]: Google, *Long context*, accessed 2026-05-23.
    [ai.google.dev/gemini-api/docs/long-context](https://ai.google.dev/gemini-api/docs/long-context)

[^3]: Brown et al., *Language Models are Few-Shot Learners*,
    arXiv:2005.14165, v1 2020-05-28, v4 2020-07-22, accessed
    2026-05-23. [arxiv.org/abs/2005.14165](https://arxiv.org/abs/2005.14165)

[^4]: MRCR (multi-round co-reference resolution long-context
    benchmark), arXiv:2501.03276, accessed 2026-05-23.
    [arxiv.org/abs/2501.03276](https://arxiv.org/abs/2501.03276)

[^5]: GraphWalks (long-context graph-traversal benchmark),
    arXiv:2412.04360, accessed 2026-05-23.
    [arxiv.org/abs/2412.04360](https://arxiv.org/abs/2412.04360)', 'The term enters the agentic-AI vocabulary as a named architectural
parameter on **2020-05-28**, the arXiv submission date of Brown et
al., *Language Models are Few-Shot Learners* (the GPT-3 paper). [^3]
The paper introduces `n_ctx` as the named hyperparameter and fixes
its value:

> "All models use a context window of n_ctx = 2048 tokens."
> — Brown et al. 2020, §2.1 [^3]

The paper reinforces the construct in its evaluation section,
treating the window as the upper bound on the few-shot examples a
prompt can carry:

> "K can be any value from 0 to the maximum amount allowed by the
> model''s context window, which is n_ctx = 2048 for all models and
> typically fits 10 to 100 examples."
> — Brown et al. 2020, §2.4 [^3]

"Context length" appears informally in earlier Transformer-lineage
work as a near-synonym, but Brown et al. 2020 is the earliest paper
that consistently uses *context window* as a named architectural
parameter of a deployed agentic-capable model. Subsequent vendor
documentation absorbs the term and drops the `n_ctx` notation; the
naming the GPT-3 paper fixed is the one that won.

[^1]: Anthropic, *Context windows*, accessed 2026-05-23.
    [platform.claude.com/docs/en/docs/build-with-claude/context-windows](https://platform.claude.com/docs/en/docs/build-with-claude/context-windows)

[^2]: Google, *Long context*, accessed 2026-05-23.
    [ai.google.dev/gemini-api/docs/long-context](https://ai.google.dev/gemini-api/docs/long-context)

[^3]: Brown et al., *Language Models are Few-Shot Learners*,
    arXiv:2005.14165, v1 2020-05-28, v4 2020-07-22, accessed
    2026-05-23. [arxiv.org/abs/2005.14165](https://arxiv.org/abs/2005.14165)

[^4]: MRCR (multi-round co-reference resolution long-context
    benchmark), arXiv:2501.03276, accessed 2026-05-23.
    [arxiv.org/abs/2501.03276](https://arxiv.org/abs/2501.03276)

[^5]: GraphWalks (long-context graph-traversal benchmark),
    arXiv:2412.04360, accessed 2026-05-23.
    [arxiv.org/abs/2412.04360](https://arxiv.org/abs/2412.04360)', 'Constructive coinage, no deeper lineage worth elaborating.

- *context* — the language-modeling tradition''s term for the prefix
  tokens conditioning generation.
- *window* — borrowed from the Transformer attention literature,
  where the model attends to a fixed-size window of tokens.

The term means what its parts mean. The etymology is included only
because "context length" persists in some research-lineage writing
as a near-synonym (§5 returns to this).

[^1]: Anthropic, *Context windows*, accessed 2026-05-23.
    [platform.claude.com/docs/en/docs/build-with-claude/context-windows](https://platform.claude.com/docs/en/docs/build-with-claude/context-windows)

[^2]: Google, *Long context*, accessed 2026-05-23.
    [ai.google.dev/gemini-api/docs/long-context](https://ai.google.dev/gemini-api/docs/long-context)

[^3]: Brown et al., *Language Models are Few-Shot Learners*,
    arXiv:2005.14165, v1 2020-05-28, v4 2020-07-22, accessed
    2026-05-23. [arxiv.org/abs/2005.14165](https://arxiv.org/abs/2005.14165)

[^4]: MRCR (multi-round co-reference resolution long-context
    benchmark), arXiv:2501.03276, accessed 2026-05-23.
    [arxiv.org/abs/2501.03276](https://arxiv.org/abs/2501.03276)

[^5]: GraphWalks (long-context graph-traversal benchmark),
    arXiv:2412.04360, accessed 2026-05-23.
    [arxiv.org/abs/2412.04360](https://arxiv.org/abs/2412.04360)', 'Faceted. The core definition converges; the use does not.

**Facet A — model-vendor documentation (the dominant 2026 usage).**
The total token budget a model can attend to in one forward pass,
inclusive of input prompt, prior conversational turns, tool results,
and generated output. Vendors publish this figure on every model
card.

> "The total available context window (up to 1M tokens) represents
> the maximum capacity for storing conversation history and
> generating new output from Claude." [^1]

> "Gemini is the first model capable of accepting 1 million tokens."
> [^2]

This is the sense quoted in product copy ("200K context window,"
"1M context window"). The figure is a published property of the
deployed model, not of the architecture in the abstract.

**Facet B — research / NLP lineage (the GPT-3 lineage).** A named
architectural hyperparameter — `n_ctx` — fixing the maximum sequence
length the model was trained to handle.

> "All models use a context window of n_ctx = 2048 tokens." [^3]

Vendor docs absorbed the term and dropped the `n_ctx` notation;
researchers still occasionally use `n_ctx` in implementation-detail
discussions where the hyperparameter, not the product specification,
is the referent.

**Facet C — prompt-engineering / practitioner sense.** The *usable*
budget for engineered prompts plus tool results plus generated
output — a constraint a prompt designer is bounded by, not just a
number on a spec sheet. The 2025–2026 crystallization of this facet
is Anthropic''s exposure of remaining context budget to the model
itself, under the name **context awareness**:

> "Claude Sonnet 4.6, Claude Sonnet 4.5, and Claude Haiku 4.5
> feature **context awareness**. This capability lets these models
> track their remaining context window (that is, ''token budget'')
> throughout a conversation." [^1]

The facet''s distinguishing property is that the window is treated as
*managed*, not just *quoted*.

**Facet D — the long-context-degradation discourse ("context
rot").** The published context window size is an upper bound on
capacity but not on *effective* capacity: retrieval and recall
accuracy degrade as more tokens are added, a phenomenon Anthropic
names *context rot* [^1] and a benchmark lineage (MRCR [^4],
GraphWalks [^5]) measures directly.

> "As token count grows, accuracy and recall degrade, a phenomenon
> known as *context rot*." [^1]

This facet matters because it changes what a reader should infer
from "1M context window." The headline figure is not the operating
recommendation; the long-context benchmark literature (MRCR [^4],
GraphWalks [^5], the "needle-in-a-haystack" lineage) exists in
direct response to this gap between published and effective
capacity.

[^1]: Anthropic, *Context windows*, accessed 2026-05-23.
    [platform.claude.com/docs/en/docs/build-with-claude/context-windows](https://platform.claude.com/docs/en/docs/build-with-claude/context-windows)

[^2]: Google, *Long context*, accessed 2026-05-23.
    [ai.google.dev/gemini-api/docs/long-context](https://ai.google.dev/gemini-api/docs/long-context)

[^3]: Brown et al., *Language Models are Few-Shot Learners*,
    arXiv:2005.14165, v1 2020-05-28, v4 2020-07-22, accessed
    2026-05-23. [arxiv.org/abs/2005.14165](https://arxiv.org/abs/2005.14165)

[^4]: MRCR (multi-round co-reference resolution long-context
    benchmark), arXiv:2501.03276, accessed 2026-05-23.
    [arxiv.org/abs/2501.03276](https://arxiv.org/abs/2501.03276)

[^5]: GraphWalks (long-context graph-traversal benchmark),
    arXiv:2412.04360, accessed 2026-05-23.
    [arxiv.org/abs/2412.04360](https://arxiv.org/abs/2412.04360)', 'Three measurement-convention divergences mislead readers who carry
one community''s frame into another. They are not caveats. They are
the structural reading this entry exists to surface.

**Input-only vs input+output budget.** Anthropic explicitly counts
input and output against the same pool: the published context window
is "the maximum capacity for storing conversation history and
generating new output." [^1] Earlier vendor framings sometimes
advertised "input context" sizes separately from "max output"
tokens, which leads a reader who carries that frame to add the two
figures and overcount the budget. The contemporary Claude framing
treats the budget as a single pool; a comparable Gemini framing
likewise quotes a single capacity figure. [^2] A reader citing a
context window size without knowing which accounting the vendor uses
is citing an ambiguous figure.

**Tokenizer-dependent token counts.** A "200K-token context window"
on one vendor''s tokenizer and a "200K-token context window" on
another vendor''s tokenizer do not represent the same amount of
natural-language text. Tokenizers differ in their byte-pair-encoding
merges, in their handling of whitespace and unicode, and in their
coverage of code, math, and non-English text. The same prose
serialized through two vendors'' tokenizers yields two different
token counts, sometimes by a meaningful margin. Cross-vendor context
window figures are therefore not directly comparable; the comparison
is between *vendor-tokenizer-specific* capacities.

**Architectural `n_ctx` vs deployed-model context window.** The
GPT-3 lineage uses `n_ctx` as a fixed architectural choice baked
into the model at training time — Brown et al. 2020 treat it as a
hyperparameter on the same footing as layer count or hidden
dimension. [^3] Modern vendor framings present "context window" as a
property of the deployed model, sometimes serving multiple
checkpoints with different limits behind the same product name. The
research-lineage sense is narrower (a fixed architectural cap); the
deployed-model sense is product-shaped (a published cap that can
change between releases). A reader citing "GPT-3''s context window is
n_ctx=2048" and a reader citing "Claude has a 1M context window" are
using the term in subtly different shapes — one names a training-
time hyperparameter, the other names a serving-time product
specification.

[^1]: Anthropic, *Context windows*, accessed 2026-05-23.
    [platform.claude.com/docs/en/docs/build-with-claude/context-windows](https://platform.claude.com/docs/en/docs/build-with-claude/context-windows)

[^2]: Google, *Long context*, accessed 2026-05-23.
    [ai.google.dev/gemini-api/docs/long-context](https://ai.google.dev/gemini-api/docs/long-context)

[^3]: Brown et al., *Language Models are Few-Shot Learners*,
    arXiv:2005.14165, v1 2020-05-28, v4 2020-07-22, accessed
    2026-05-23. [arxiv.org/abs/2005.14165](https://arxiv.org/abs/2005.14165)

[^4]: MRCR (multi-round co-reference resolution long-context
    benchmark), arXiv:2501.03276, accessed 2026-05-23.
    [arxiv.org/abs/2501.03276](https://arxiv.org/abs/2501.03276)

[^5]: GraphWalks (long-context graph-traversal benchmark),
    arXiv:2412.04360, accessed 2026-05-23.
    [arxiv.org/abs/2412.04360](https://arxiv.org/abs/2412.04360)', NULL, NULL, 1, 'active', '2026-05-23T17:11:08.702Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at) VALUES ('f79e4572-aae6-4c14-87db-962dbd50e9f7', 'context-window', 'model', '2026-05-23T17:11:08.702Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at) VALUES ('7cf0036f-a607-42ca-9907-b63374921ee4', 'context-window', 'prompt', '2026-05-23T17:11:08.702Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at) VALUES ('a5134721-8f7f-4b6a-83c0-d3122f852936', 'context-window', 'embedding', '2026-05-23T17:11:08.702Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at) VALUES ('5ebdfd98-e0ff-48e4-a63b-31b4088705fb', 'context-window', 'rag', '2026-05-23T17:11:08.702Z');

INSERT OR IGNORE INTO entries (id, slug, title, content_hash, definition, first_appearance, etymology, current_meaning, divergent_meanings, supersession_note, superseded_by_id, version, state, published_at) VALUES ('12033cfe-3a4e-42c5-8f0b-b83f804b00e4', 'embedding', 'Embedding', '780f9602cd54db51', 'An **embedding**, in its modern computational sense, is a
learned dense, continuous-valued vector representation of a
discrete object — a word, sentence, document, image, audio
clip, or arbitrary item — such that semantically-similar
objects map to nearby points in the vector space.

The shape of the working term enters the field with Mikolov
et al. 2013: "We propose two novel model architectures for
computing continuous vector representations of words from
very large data sets. The quality of these representations is
measured in a word similarity task, and the results are
compared to the previously best performing techniques based
on different types of neural networks." [^1]

The conceptual lineage is older. Bengio et al. 2003,
introducing learned distributed word representations jointly
with a neural language model: "We propose to fight the curse
of dimensionality by learning a distributed representation
for words which allows each training sentence to inform the
model about an exponential number of semantically neighboring
sentences." [^2]

Both citations matter. §2 carries why.

[^1]: Mikolov, Chen, Corrado, Dean, *Efficient Estimation of
    Word Representations in Vector Space*, arXiv:1301.3781,
    v1 2013-01-16, v3 2013-09-07, accessed 2026-05-23.
    [arxiv.org/abs/1301.3781](https://arxiv.org/abs/1301.3781)

[^2]: Bengio, Ducharme, Vincent, Jauvin, *A Neural
    Probabilistic Language Model*, Journal of Machine
    Learning Research 3 (2003) 1137–1155, accessed
    2026-05-23.
    [jmlr.org/papers/v3/bengio03a.html](https://www.jmlr.org/papers/v3/bengio03a.html)

[^3]: Mikolov, Sutskever, Chen, Corrado, Dean, *Distributed
    Representations of Words and Phrases and their
    Compositionality*, arXiv:1310.4546, v1 2013-10-16,
    accessed 2026-05-23.
    [arxiv.org/abs/1310.4546](https://arxiv.org/abs/1310.4546)

[^4]: Pennington, Socher, Manning, *GloVe: Global Vectors
    for Word Representation*, EMNLP 2014, accessed
    2026-05-23.
    [nlp.stanford.edu/projects/glove/](https://nlp.stanford.edu/projects/glove/)

[^5]: Reimers, Gurevych, *Sentence-BERT: Sentence Embeddings
    using Siamese BERT-Networks*, EMNLP 2019,
    arXiv:1908.10084, v1 2019-08-27, accessed 2026-05-23.
    [arxiv.org/abs/1908.10084](https://arxiv.org/abs/1908.10084)

[^6]: OpenAI, *New embedding models and API updates*,
    2024-01-25, accessed 2026-05-23.
    [openai.com/index/new-embedding-models-and-api-updates/](https://openai.com/index/new-embedding-models-and-api-updates/)

[^7]: Radford et al., *Learning Transferable Visual Models
    From Natural Language Supervision* (CLIP),
    arXiv:2103.00020, v1 2021-02-26, accessed 2026-05-23.
    [arxiv.org/abs/2103.00020](https://arxiv.org/abs/2103.00020)

[^8]: Johnson, Douze, Jégou, *Billion-scale similarity search
    with GPUs* (FAISS), arXiv:1702.08734, v2 2017-02-28,
    accessed 2026-05-23. Load-bearing primary source for
    dense-vector ANN-at-scale; the vector-database tools
    named in Facet E (Pinecone, Weaviate, Chroma, pgvector)
    compose on this lineage.
    [arxiv.org/abs/1702.08734](https://arxiv.org/abs/1702.08734)', 'Two reasonable answers, and the honest entry keeps both.

- **The concept — a learned distributed vector
  representation of words — enters the field on 2003**, in
  Bengio, Ducharme, Vincent, Jauvin, *A Neural Probabilistic
  Language Model*, JMLR v3, pp. 1137–1155. [^2] Dense
  learned word vectors are trained jointly with a neural
  language model; the geometry of the representation space
  is the load-bearing claim.

- **The term that stuck — "word embedding" as the field''s
  working vocabulary — enters on 2013-01-16**, in the v1
  submission of Mikolov, Chen, Corrado, Dean, *Efficient
  Estimation of Word Representations in Vector Space*,
  arXiv:1301.3781. [^1] The paper introduces word2vec
  (CBOW and skip-gram architectures); after its publication
  "word embedding" becomes the shared vocabulary across
  NLP. The NIPS follow-up later that year (arXiv:1310.4546,
  v1 2013-10-16) introduces negative sampling and
  consolidates the term further. [^3]

The lineage is conceptually continuous — Mikolov''s
contribution is engineering at corpus scale and the
crystallization of a working vocabulary, not a clean break
from Bengio. The practitioner sense in 2026 traces back
through Mikolov''s shape (word2vec → sentence/SBERT →
multimodal/CLIP → hosted embedding APIs); the conceptual
sense traces back through Bengio. The entry surfaces both
because conflating the two erases a decade of intermediate
work and misattributes a coinage that was, in fact, two
distinct moments.

[^1]: Mikolov, Chen, Corrado, Dean, *Efficient Estimation of
    Word Representations in Vector Space*, arXiv:1301.3781,
    v1 2013-01-16, v3 2013-09-07, accessed 2026-05-23.
    [arxiv.org/abs/1301.3781](https://arxiv.org/abs/1301.3781)

[^2]: Bengio, Ducharme, Vincent, Jauvin, *A Neural
    Probabilistic Language Model*, Journal of Machine
    Learning Research 3 (2003) 1137–1155, accessed
    2026-05-23.
    [jmlr.org/papers/v3/bengio03a.html](https://www.jmlr.org/papers/v3/bengio03a.html)

[^3]: Mikolov, Sutskever, Chen, Corrado, Dean, *Distributed
    Representations of Words and Phrases and their
    Compositionality*, arXiv:1310.4546, v1 2013-10-16,
    accessed 2026-05-23.
    [arxiv.org/abs/1310.4546](https://arxiv.org/abs/1310.4546)

[^4]: Pennington, Socher, Manning, *GloVe: Global Vectors
    for Word Representation*, EMNLP 2014, accessed
    2026-05-23.
    [nlp.stanford.edu/projects/glove/](https://nlp.stanford.edu/projects/glove/)

[^5]: Reimers, Gurevych, *Sentence-BERT: Sentence Embeddings
    using Siamese BERT-Networks*, EMNLP 2019,
    arXiv:1908.10084, v1 2019-08-27, accessed 2026-05-23.
    [arxiv.org/abs/1908.10084](https://arxiv.org/abs/1908.10084)

[^6]: OpenAI, *New embedding models and API updates*,
    2024-01-25, accessed 2026-05-23.
    [openai.com/index/new-embedding-models-and-api-updates/](https://openai.com/index/new-embedding-models-and-api-updates/)

[^7]: Radford et al., *Learning Transferable Visual Models
    From Natural Language Supervision* (CLIP),
    arXiv:2103.00020, v1 2021-02-26, accessed 2026-05-23.
    [arxiv.org/abs/2103.00020](https://arxiv.org/abs/2103.00020)

[^8]: Johnson, Douze, Jégou, *Billion-scale similarity search
    with GPUs* (FAISS), arXiv:1702.08734, v2 2017-02-28,
    accessed 2026-05-23. Load-bearing primary source for
    dense-vector ANN-at-scale; the vector-database tools
    named in Facet E (Pinecone, Weaviate, Chroma, pgvector)
    compose on this lineage.
    [arxiv.org/abs/1702.08734](https://arxiv.org/abs/1702.08734)', 'The word "embedding" is borrowed from mathematics. In
topology and algebra, an embedding is an injective
structure-preserving map from one space into another — the
integers embedded in the reals, a circle embedded in the
plane. The machine-learning usage retains that sense:
discrete symbols, which have no intrinsic geometry, are
mapped into a continuous vector space where geometric
operations (distance, dot product, vector arithmetic) become
meaningful.

The Mikolov "king − man + woman ≈ queen" demonstration is
what made the geometric reading of the term stick in working
vocabulary; the analogy carries because the mapping
preserves enough relational structure between symbols for
vector arithmetic to land near the right neighborhood. The
mathematical antecedent is not a coincidence — the term was
chosen, not invented.

[^1]: Mikolov, Chen, Corrado, Dean, *Efficient Estimation of
    Word Representations in Vector Space*, arXiv:1301.3781,
    v1 2013-01-16, v3 2013-09-07, accessed 2026-05-23.
    [arxiv.org/abs/1301.3781](https://arxiv.org/abs/1301.3781)

[^2]: Bengio, Ducharme, Vincent, Jauvin, *A Neural
    Probabilistic Language Model*, Journal of Machine
    Learning Research 3 (2003) 1137–1155, accessed
    2026-05-23.
    [jmlr.org/papers/v3/bengio03a.html](https://www.jmlr.org/papers/v3/bengio03a.html)

[^3]: Mikolov, Sutskever, Chen, Corrado, Dean, *Distributed
    Representations of Words and Phrases and their
    Compositionality*, arXiv:1310.4546, v1 2013-10-16,
    accessed 2026-05-23.
    [arxiv.org/abs/1310.4546](https://arxiv.org/abs/1310.4546)

[^4]: Pennington, Socher, Manning, *GloVe: Global Vectors
    for Word Representation*, EMNLP 2014, accessed
    2026-05-23.
    [nlp.stanford.edu/projects/glove/](https://nlp.stanford.edu/projects/glove/)

[^5]: Reimers, Gurevych, *Sentence-BERT: Sentence Embeddings
    using Siamese BERT-Networks*, EMNLP 2019,
    arXiv:1908.10084, v1 2019-08-27, accessed 2026-05-23.
    [arxiv.org/abs/1908.10084](https://arxiv.org/abs/1908.10084)

[^6]: OpenAI, *New embedding models and API updates*,
    2024-01-25, accessed 2026-05-23.
    [openai.com/index/new-embedding-models-and-api-updates/](https://openai.com/index/new-embedding-models-and-api-updates/)

[^7]: Radford et al., *Learning Transferable Visual Models
    From Natural Language Supervision* (CLIP),
    arXiv:2103.00020, v1 2021-02-26, accessed 2026-05-23.
    [arxiv.org/abs/2103.00020](https://arxiv.org/abs/2103.00020)

[^8]: Johnson, Douze, Jégou, *Billion-scale similarity search
    with GPUs* (FAISS), arXiv:1702.08734, v2 2017-02-28,
    accessed 2026-05-23. Load-bearing primary source for
    dense-vector ANN-at-scale; the vector-database tools
    named in Facet E (Pinecone, Weaviate, Chroma, pgvector)
    compose on this lineage.
    [arxiv.org/abs/1702.08734](https://arxiv.org/abs/1702.08734)', 'Faceted. The contemporary sense is broad enough that
practitioners in different communities reach for the same
word with materially different referents.

**Facet A — classical NLP (word embeddings).** The
original sense — a dense vector per word, learned from
co-occurrence over a corpus. word2vec [^1], GloVe [^4],
fastText are the canonical instances. The "vector" is the
embedding; the model that produces it is the *embedding
model* or *encoder*. The vector is static per word — the
same surface form gets the same vector regardless of
context.

**Facet B — contextual / sentence / document embeddings.**
Embeddings of larger units (sentences, paragraphs,
documents) produced by transformer encoders. Sentence-BERT
introduces the canonical recipe: "Sentence-BERT (SBERT), a
modification of the pretrained BERT network that use siamese
and triplet network structures to derive semantically
meaningful sentence embeddings that can be compared using
cosine-similarity." [^5] Contextual because the same word in
different contexts yields different embeddings; the
embedding is typically a pooled hidden-state vector.

**Facet C — production embedding APIs.** Hosted endpoints
(OpenAI text-embedding-3, Cohere embed, Voyage,
Mistral-embed) that return a dense vector for arbitrary
input text. The 2024-01-25 OpenAI release is a useful
inflection point: "We are releasing two new embedding
models: a smaller and highly efficient text-embedding-3-small
model, and a larger and more powerful text-embedding-3-large
model." [^6] The shift this announcement marks is not
technical — embedding models existed as hosted services
before it — but commercial: embeddings as a commodity API
surface, priced per token, addressable from any language
runtime, with vendor competition on dimension/quality/cost.
Most agent-builders meet the concept here first.

**Facet D — multimodal embeddings.** Image, audio, and code
embeddings in a shared space with text. CLIP is the
canonical instance: "We study the task of natural language
supervision for image representation learning… CLIP learns
from a wide variety of images with a wide variety of natural
language supervision." [^7] The geometric premise
generalizes from words to arbitrary modalities; the
modality-specific encoder maps into a vector space where
cross-modal similarity (text-to-image, audio-to-text) is
meaningful.

**Facet E — vector-database / retrieval (agentic).**
"Embedding" as the retrieval key for similarity search.
Vector databases (Pinecone, Weaviate, Chroma, pgvector,
FAISS) index embeddings and serve nearest-neighbor queries;
the embedding is the join key between semantic similarity
and a database row. The load-bearing primary source for
billion-scale dense-vector ANN — the modality this facet
composes over — is Johnson, Douze, Jégou 2017: "We propose
a design for k-selection that operates at up to 55% of
theoretical peak performance, enabling a nearest neighbor
implementation that is 8.5x faster than prior GPU state of
the art. Our implementation enables the construction of a
high accuracy k-NN graph on 95 million images from the
Yfcc100M dataset in 35 minutes." [^8]
This facet anchors most modern agentic usage — when a
builder says "embed the document," they mean "compute a
dense vector via an embedding model, store it in a vector
index, query by similarity." It is the sense practitioners
in 2026 are most often reaching for; entry #17 (RAG) and
entry #18 (retrieval) compose on it.

The five facets are not redundant. They map to genuinely
distinct communities — classical NLP, transformer NLP,
production API consumers, multimodal-research, and
vector-DB-application — and a reader fluent in one will not
automatically be fluent in another''s working assumptions.

[^1]: Mikolov, Chen, Corrado, Dean, *Efficient Estimation of
    Word Representations in Vector Space*, arXiv:1301.3781,
    v1 2013-01-16, v3 2013-09-07, accessed 2026-05-23.
    [arxiv.org/abs/1301.3781](https://arxiv.org/abs/1301.3781)

[^2]: Bengio, Ducharme, Vincent, Jauvin, *A Neural
    Probabilistic Language Model*, Journal of Machine
    Learning Research 3 (2003) 1137–1155, accessed
    2026-05-23.
    [jmlr.org/papers/v3/bengio03a.html](https://www.jmlr.org/papers/v3/bengio03a.html)

[^3]: Mikolov, Sutskever, Chen, Corrado, Dean, *Distributed
    Representations of Words and Phrases and their
    Compositionality*, arXiv:1310.4546, v1 2013-10-16,
    accessed 2026-05-23.
    [arxiv.org/abs/1310.4546](https://arxiv.org/abs/1310.4546)

[^4]: Pennington, Socher, Manning, *GloVe: Global Vectors
    for Word Representation*, EMNLP 2014, accessed
    2026-05-23.
    [nlp.stanford.edu/projects/glove/](https://nlp.stanford.edu/projects/glove/)

[^5]: Reimers, Gurevych, *Sentence-BERT: Sentence Embeddings
    using Siamese BERT-Networks*, EMNLP 2019,
    arXiv:1908.10084, v1 2019-08-27, accessed 2026-05-23.
    [arxiv.org/abs/1908.10084](https://arxiv.org/abs/1908.10084)

[^6]: OpenAI, *New embedding models and API updates*,
    2024-01-25, accessed 2026-05-23.
    [openai.com/index/new-embedding-models-and-api-updates/](https://openai.com/index/new-embedding-models-and-api-updates/)

[^7]: Radford et al., *Learning Transferable Visual Models
    From Natural Language Supervision* (CLIP),
    arXiv:2103.00020, v1 2021-02-26, accessed 2026-05-23.
    [arxiv.org/abs/2103.00020](https://arxiv.org/abs/2103.00020)

[^8]: Johnson, Douze, Jégou, *Billion-scale similarity search
    with GPUs* (FAISS), arXiv:1702.08734, v2 2017-02-28,
    accessed 2026-05-23. Load-bearing primary source for
    dense-vector ANN-at-scale; the vector-database tools
    named in Facet E (Pinecone, Weaviate, Chroma, pgvector)
    compose on this lineage.
    [arxiv.org/abs/1702.08734](https://arxiv.org/abs/1702.08734)', 'Convergence on the broad sense — a learned dense vector
that places semantically-similar items near one another in
a shared space — is unusually high for an entry in this
encyclopedia. The lineage drift from word-only (2013) to
general-object (2026) is broadening of the same concept
along its natural axis, not divergence. Two short
disambiguations are worth surfacing for readers
cross-checking from adjacent literatures.

- **Math / topology usage.** An embedding of one space into
  another is an injective, structure-preserving map. This
  sense survives in machine-learning writing about manifold
  learning and representation geometry, and is the origin
  of the term (§3). It is not what an agent-builder means
  by "embedding" in 2026.

- **"Embedded" in the systems sense.** "Embedded database,"
  "embedded system" use the word in the sense of
  inclusion-by-being-built-in — unrelated to vectors. Not
  the agentic meaning. Flagged briefly so readers crossing
  from systems literature do not conflate the two when the
  same surface form turns up.

A reader encountering "embedding" without qualification in
an agentic context is, in 2026, almost always reaching for
some shape of facet A–E above; the divergent senses survive
only in their respective home literatures and are not in
contention for the practitioner default.

[^1]: Mikolov, Chen, Corrado, Dean, *Efficient Estimation of
    Word Representations in Vector Space*, arXiv:1301.3781,
    v1 2013-01-16, v3 2013-09-07, accessed 2026-05-23.
    [arxiv.org/abs/1301.3781](https://arxiv.org/abs/1301.3781)

[^2]: Bengio, Ducharme, Vincent, Jauvin, *A Neural
    Probabilistic Language Model*, Journal of Machine
    Learning Research 3 (2003) 1137–1155, accessed
    2026-05-23.
    [jmlr.org/papers/v3/bengio03a.html](https://www.jmlr.org/papers/v3/bengio03a.html)

[^3]: Mikolov, Sutskever, Chen, Corrado, Dean, *Distributed
    Representations of Words and Phrases and their
    Compositionality*, arXiv:1310.4546, v1 2013-10-16,
    accessed 2026-05-23.
    [arxiv.org/abs/1310.4546](https://arxiv.org/abs/1310.4546)

[^4]: Pennington, Socher, Manning, *GloVe: Global Vectors
    for Word Representation*, EMNLP 2014, accessed
    2026-05-23.
    [nlp.stanford.edu/projects/glove/](https://nlp.stanford.edu/projects/glove/)

[^5]: Reimers, Gurevych, *Sentence-BERT: Sentence Embeddings
    using Siamese BERT-Networks*, EMNLP 2019,
    arXiv:1908.10084, v1 2019-08-27, accessed 2026-05-23.
    [arxiv.org/abs/1908.10084](https://arxiv.org/abs/1908.10084)

[^6]: OpenAI, *New embedding models and API updates*,
    2024-01-25, accessed 2026-05-23.
    [openai.com/index/new-embedding-models-and-api-updates/](https://openai.com/index/new-embedding-models-and-api-updates/)

[^7]: Radford et al., *Learning Transferable Visual Models
    From Natural Language Supervision* (CLIP),
    arXiv:2103.00020, v1 2021-02-26, accessed 2026-05-23.
    [arxiv.org/abs/2103.00020](https://arxiv.org/abs/2103.00020)

[^8]: Johnson, Douze, Jégou, *Billion-scale similarity search
    with GPUs* (FAISS), arXiv:1702.08734, v2 2017-02-28,
    accessed 2026-05-23. Load-bearing primary source for
    dense-vector ANN-at-scale; the vector-database tools
    named in Facet E (Pinecone, Weaviate, Chroma, pgvector)
    compose on this lineage.
    [arxiv.org/abs/1702.08734](https://arxiv.org/abs/1702.08734)', NULL, NULL, 1, 'active', '2026-05-23T17:11:08.702Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at) VALUES ('80eaba6a-62d8-403c-9d10-dc6933dd98f5', 'embedding', 'rag', '2026-05-23T17:11:08.702Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at) VALUES ('c9bf0a91-57e7-4fc5-8438-1a4554259203', 'embedding', 'model', '2026-05-23T17:11:08.702Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at) VALUES ('7eacf4d9-6395-496d-82d0-6ebc1eb4b5d1', 'embedding', 'prompt', '2026-05-23T17:11:08.702Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at) VALUES ('cfef8b03-bec6-4c79-871e-8d3976921873', 'embedding', 'context-window', '2026-05-23T17:11:08.702Z');
