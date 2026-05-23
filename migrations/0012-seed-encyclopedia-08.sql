INSERT OR IGNORE INTO entries (
      id, slug, title, content_hash,
      definition, first_appearance, etymology,
      current_meaning, divergent_meanings,
      supersession_note, superseded_by_id, version,
      state, published_at
    ) VALUES (
      '50ef1087-7e59-4235-b9b0-186b9b707252', 'memory', 'memory', 'ae2a2255299f770c',
      'A **memory**, in the agentic-AI vocabulary that took shape across
2023 and 2024 and is still consolidating in 2026, has no single
canonical definition. The construct picks out at least four
distinguishable referents in active practitioner and research use,
and the field has not yet resolved which referent the unmodified
noun should pick out.

The closest field-wide gloss — the one that appears in
introduction-shaped survey material — is generic to the point of
operational uselessness:

> "The memory module helps to store the agent''s internal logs
> including past thoughts, actions, and observations from the
> environment, including all interactions between agent and
> user." [^1]

That sentence is true of every sense of agent memory in current
use, which is exactly its weakness. It does not distinguish
working state from durable store, model-internal parametric
knowledge from externally retrieved context, or runtime
conversation history from across-session persistence. The
distinction-work happens in §4 and §5, which carry the entry''s
weight; the unified gloss above is included to mark the gap rather
than to fill it.

A 2026 research-literature attempt at re-unifying the senses is
visible in the title alone:

> "Agentic Memory: Learning Unified Long-Term and Short-Term Memory
> Management for Large Language Model Agents." [^2]

The paper''s existence is itself evidence that the senses had
drifted apart far enough by 2026 to need formal re-unification.

[^1]: Prompt Engineering Guide, *LLM Agents*, accessed 2026-05-23.
    [promptingguide.ai/research/llm-agents](https://www.promptingguide.ai/research/llm-agents)

[^2]: *Agentic Memory: Learning Unified Long-Term and Short-Term
    Memory Management for Large Language Model Agents*,
    arXiv:2601.01885, accessed 2026-05-23.
    [arxiv.org/pdf/2601.01885](https://arxiv.org/pdf/2601.01885)
    (Verifier note: confirm canonical publication date via the
    abs/ landing page.)

[^3]: apxml, *LLM Agent Memory: Short & Long-Term*, accessed
    2026-05-23.
    [apxml.com/courses/multi-agent-llm-systems-design-implementation/chapter-2-architecting-agents-defining-roles/memory-mechanisms-llm-agents](https://apxml.com/courses/multi-agent-llm-systems-design-implementation/chapter-2-architecting-agents-defining-roles/memory-mechanisms-llm-agents)

[^4]: Letta, *Agent Memory: How to Build Agents that Learn and
    Remember*, accessed 2026-05-23.
    [letta.com/blog/agent-memory](https://www.letta.com/blog/agent-memory)
    (Verifier note: practitioner blog — published-date retry via
    browser_fetch recommended per researcher''s flag.)

[^5]: philschmid, *Memory in Agents*, accessed 2026-05-23.
    [philschmid.de/memory-in-agents](https://www.philschmid.de/memory-in-agents)
    (Verifier note: practitioner blog — published-date retry via
    browser_fetch recommended per researcher''s flag.)

[^6]: Lewis, P. et al., *Retrieval-Augmented Generation for
    Knowledge-Intensive NLP Tasks*, NeurIPS 2020. Abstract.
    Accessed 2026-05-23.
    [arxiv.org/abs/2005.11401](https://arxiv.org/abs/2005.11401)', 'No single first-appearance citation. *Memory* as an LLM-agent term
of art emerged piecewise across 2023 and 2024 in practitioner
discourse — blog posts, course material, framework documentation —
and inherited its vocabulary wholesale from earlier traditions
(see §3). No major vendor coined the agentic usage on a particular
date; no single paper introduced it as a term of art.

The earliest formal attempt at *unifying* the field''s drifted
senses is the Agentic Memory paper [^2]; that is a re-unification
of an already-fractured vocabulary, not a coinage. The §2 framing
here reflects that absence honestly rather than nominating an
arbitrary practitioner post.

[^1]: Prompt Engineering Guide, *LLM Agents*, accessed 2026-05-23.
    [promptingguide.ai/research/llm-agents](https://www.promptingguide.ai/research/llm-agents)

[^2]: *Agentic Memory: Learning Unified Long-Term and Short-Term
    Memory Management for Large Language Model Agents*,
    arXiv:2601.01885, accessed 2026-05-23.
    [arxiv.org/pdf/2601.01885](https://arxiv.org/pdf/2601.01885)
    (Verifier note: confirm canonical publication date via the
    abs/ landing page.)

[^3]: apxml, *LLM Agent Memory: Short & Long-Term*, accessed
    2026-05-23.
    [apxml.com/courses/multi-agent-llm-systems-design-implementation/chapter-2-architecting-agents-defining-roles/memory-mechanisms-llm-agents](https://apxml.com/courses/multi-agent-llm-systems-design-implementation/chapter-2-architecting-agents-defining-roles/memory-mechanisms-llm-agents)

[^4]: Letta, *Agent Memory: How to Build Agents that Learn and
    Remember*, accessed 2026-05-23.
    [letta.com/blog/agent-memory](https://www.letta.com/blog/agent-memory)
    (Verifier note: practitioner blog — published-date retry via
    browser_fetch recommended per researcher''s flag.)

[^5]: philschmid, *Memory in Agents*, accessed 2026-05-23.
    [philschmid.de/memory-in-agents](https://www.philschmid.de/memory-in-agents)
    (Verifier note: practitioner blog — published-date retry via
    browser_fetch recommended per researcher''s flag.)

[^6]: Lewis, P. et al., *Retrieval-Augmented Generation for
    Knowledge-Intensive NLP Tasks*, NeurIPS 2020. Abstract.
    Accessed 2026-05-23.
    [arxiv.org/abs/2005.11401](https://arxiv.org/abs/2005.11401)', 'Borrowed across two lineages, both load-bearing and both lossy
when imported into the agentic context.

From **human cognitive science**: the short-term / long-term /
working memory taxonomy. Practitioner discourse inherits the names
but does not preserve the neurologically-grounded referents —
"short-term memory" in agent vocabulary is the model''s context
window, not a transient cognitive store with cognitive-science
properties. The metaphor is convenient and misleading at once.

From **earlier ML literature**: LSTM ("long short-term memory")
networks, which gave the field a precedent for treating "memory" as
a designable subcomponent of a learning system rather than as an
external store. The connection is loose — LSTMs are a model
architecture, not an agent component — but the willingness to use
"memory" as a noun for a designable internal state traces back
through this lineage.

The two intuitions coexist uncomfortably in the agentic usage.
Readers carrying either intuition into the term will need the
divergent-meanings section below to disambiguate.

[^1]: Prompt Engineering Guide, *LLM Agents*, accessed 2026-05-23.
    [promptingguide.ai/research/llm-agents](https://www.promptingguide.ai/research/llm-agents)

[^2]: *Agentic Memory: Learning Unified Long-Term and Short-Term
    Memory Management for Large Language Model Agents*,
    arXiv:2601.01885, accessed 2026-05-23.
    [arxiv.org/pdf/2601.01885](https://arxiv.org/pdf/2601.01885)
    (Verifier note: confirm canonical publication date via the
    abs/ landing page.)

[^3]: apxml, *LLM Agent Memory: Short & Long-Term*, accessed
    2026-05-23.
    [apxml.com/courses/multi-agent-llm-systems-design-implementation/chapter-2-architecting-agents-defining-roles/memory-mechanisms-llm-agents](https://apxml.com/courses/multi-agent-llm-systems-design-implementation/chapter-2-architecting-agents-defining-roles/memory-mechanisms-llm-agents)

[^4]: Letta, *Agent Memory: How to Build Agents that Learn and
    Remember*, accessed 2026-05-23.
    [letta.com/blog/agent-memory](https://www.letta.com/blog/agent-memory)
    (Verifier note: practitioner blog — published-date retry via
    browser_fetch recommended per researcher''s flag.)

[^5]: philschmid, *Memory in Agents*, accessed 2026-05-23.
    [philschmid.de/memory-in-agents](https://www.philschmid.de/memory-in-agents)
    (Verifier note: practitioner blog — published-date retry via
    browser_fetch recommended per researcher''s flag.)

[^6]: Lewis, P. et al., *Retrieval-Augmented Generation for
    Knowledge-Intensive NLP Tasks*, NeurIPS 2020. Abstract.
    Accessed 2026-05-23.
    [arxiv.org/abs/2005.11401](https://arxiv.org/abs/2005.11401)',
      'Four distinguishable senses, each in active use, with no
established convention for which the unmodified noun denotes.

**Facet A — Short-term / working memory = the context window.**
The simplest and most common framing in practitioner course
material:

> "Short-term memory, often called working memory, holds
> information relevant to the current, immediate context of an
> agent''s operation. More specifically, short-term memory is the
> context window itself, which holds the system instructions,
> recent conversation history, current instructions, tool
> definitions and information relevant to the current
> interaction." [^3]

This facet collapses *memory* and *context window* into the same
object. Entry #6 (context window) treats them as distinct on
purpose; the collapse here is a Facet A claim, not the
encyclopedia''s house position.

**Facet B — Long-term memory = external durable store.** Vector
databases, key-value stores, durable files. Persists across
sessions. The same apxml course material draws the split:

> "Long-term memory provides agents with the ability to store and
> recall information over extended periods, across multiple
> sessions or interactions. Long-term memory requires external
> data stores, such as vector databases, and allows the agent to
> store and recall information across multiple sessions and
> extended periods." [^3]

The closest thing to a vendor anchor for Facet B is Letta
(formerly MemGPT), whose product literature uses *memory* almost
exclusively in this sense:

> "Agent Memory: How to Build Agents that Learn and Remember." [^4]

**Facet C — Parametric memory = what the weights encode.**
Retrieval and interpretability research uses *parametric memory*
to mean facts the model has encoded in its weights during
training, contrasted with retrieved or in-context information.
The load-bearing anchor for the distinction is the RAG paper:

> "models which combine pre-trained parametric and non-parametric
> memory for language generation" [^6]

and the same abstract disambiguates the pair:

> "the parametric memory is a pre-trained seq2seq model … the
> non-parametric memory is a dense vector index of Wikipedia" [^6]

The phrasing is not informal coinage; it is the load-bearing
distinction the RAG paper turns on. The facet shows up whenever
the discussion is about *where* a fact lives — in the weights, in
the prompt, or in an external store.

**Facet D — Retrieval-augmented memory = RAG-treated-as-memory.**
The community blurs *memory* and *retrieval* frequently. Letta''s
underlying mechanism is vector retrieval; pure RAG literature
treats retrieval as a separate concern from memory. A practitioner
write-up that uses both framings loosely:

> "Memory in Agents, Make LLMs remember." [^5]

The blur is itself a vocabulary observation: the same retrieved-
context pipeline gets called *RAG* by one community and *memory*
by another, with no clean rule for which framing applies.

**Hybrid memory** — sometimes named as a fifth facet, but better
read as the practical composition production agents use to combine
A and B:

> "Hybrid memory integrates both short-term memory and long-term
> memory to improve an agent''s ability for long-range reasoning
> and accumulation of experiences." [^3]

Convergence-finding (the structural reading): the field uses one
word for at least four distinguishable referents — runtime
context (A), durable external store (B), weight-encoded knowledge
(C), and retrieved context treated as memory (D). The four senses
do not contradict each other but they do not collapse either.
Practitioner usage rarely names which facet a sentence is in. A
reader who imports Facet A into a Facet B passage will misread the
architecture; a reader who imports Facet D into a Facet C passage
will misread where the knowledge lives.

[^1]: Prompt Engineering Guide, *LLM Agents*, accessed 2026-05-23.
    [promptingguide.ai/research/llm-agents](https://www.promptingguide.ai/research/llm-agents)

[^2]: *Agentic Memory: Learning Unified Long-Term and Short-Term
    Memory Management for Large Language Model Agents*,
    arXiv:2601.01885, accessed 2026-05-23.
    [arxiv.org/pdf/2601.01885](https://arxiv.org/pdf/2601.01885)
    (Verifier note: confirm canonical publication date via the
    abs/ landing page.)

[^3]: apxml, *LLM Agent Memory: Short & Long-Term*, accessed
    2026-05-23.
    [apxml.com/courses/multi-agent-llm-systems-design-implementation/chapter-2-architecting-agents-defining-roles/memory-mechanisms-llm-agents](https://apxml.com/courses/multi-agent-llm-systems-design-implementation/chapter-2-architecting-agents-defining-roles/memory-mechanisms-llm-agents)

[^4]: Letta, *Agent Memory: How to Build Agents that Learn and
    Remember*, accessed 2026-05-23.
    [letta.com/blog/agent-memory](https://www.letta.com/blog/agent-memory)
    (Verifier note: practitioner blog — published-date retry via
    browser_fetch recommended per researcher''s flag.)

[^5]: philschmid, *Memory in Agents*, accessed 2026-05-23.
    [philschmid.de/memory-in-agents](https://www.philschmid.de/memory-in-agents)
    (Verifier note: practitioner blog — published-date retry via
    browser_fetch recommended per researcher''s flag.)

[^6]: Lewis, P. et al., *Retrieval-Augmented Generation for
    Knowledge-Intensive NLP Tasks*, NeurIPS 2020. Abstract.
    Accessed 2026-05-23.
    [arxiv.org/abs/2005.11401](https://arxiv.org/abs/2005.11401)', 'Divergence is the entry. Three load-bearing splits:

1. **Memory vs. context window (Facet A vs. entry #6).** Some
   sources treat *memory* and *context window* as the same object
   (Facet A''s explicit collapse); others reserve *memory* for
   durable external state and treat the context window as the
   substrate of short-term memory rather than as memory itself.
   A reader importing the first sense into a passage written from
   the second will read the entire architecture wrong.
2. **Memory vs. retrieval / RAG (Facet D vs. entry #17).**
   Letta-style frameworks treat managed retrieval as the agent''s
   memory subsystem; pure RAG literature treats retrieval as a
   separate concern from memory. The same vector-search pipeline
   gets called by both names depending on which community is
   describing it. The encyclopedia entry must surface that both
   framings are alive in the field.
3. **Memory vs. parametric knowledge (Facet C vs. everything
   else).** Interpretability discourse distinguishes weight-
   encoded knowledge from in-context information; most product
   literature collapses the two under *memory* with no flag. A
   safety or interpretability reader coming to product literature
   will find the terminology blurred against their working
   distinction.

A note on scope: reflection''s own memory model — scry as a queryable
knowledge graph, wake reports as durable across-session
persistence, the briefing system prompt as turn-by-turn context
loading — sits across Facets A and B in idiosyncratic ways. That
is one project''s design, not a field facet; the entry does not
cite reflection as a community, in keeping with the moderate-COI
flag from commission.

[^1]: Prompt Engineering Guide, *LLM Agents*, accessed 2026-05-23.
    [promptingguide.ai/research/llm-agents](https://www.promptingguide.ai/research/llm-agents)

[^2]: *Agentic Memory: Learning Unified Long-Term and Short-Term
    Memory Management for Large Language Model Agents*,
    arXiv:2601.01885, accessed 2026-05-23.
    [arxiv.org/pdf/2601.01885](https://arxiv.org/pdf/2601.01885)
    (Verifier note: confirm canonical publication date via the
    abs/ landing page.)

[^3]: apxml, *LLM Agent Memory: Short & Long-Term*, accessed
    2026-05-23.
    [apxml.com/courses/multi-agent-llm-systems-design-implementation/chapter-2-architecting-agents-defining-roles/memory-mechanisms-llm-agents](https://apxml.com/courses/multi-agent-llm-systems-design-implementation/chapter-2-architecting-agents-defining-roles/memory-mechanisms-llm-agents)

[^4]: Letta, *Agent Memory: How to Build Agents that Learn and
    Remember*, accessed 2026-05-23.
    [letta.com/blog/agent-memory](https://www.letta.com/blog/agent-memory)
    (Verifier note: practitioner blog — published-date retry via
    browser_fetch recommended per researcher''s flag.)

[^5]: philschmid, *Memory in Agents*, accessed 2026-05-23.
    [philschmid.de/memory-in-agents](https://www.philschmid.de/memory-in-agents)
    (Verifier note: practitioner blog — published-date retry via
    browser_fetch recommended per researcher''s flag.)

[^6]: Lewis, P. et al., *Retrieval-Augmented Generation for
    Knowledge-Intensive NLP Tasks*, NeurIPS 2020. Abstract.
    Accessed 2026-05-23.
    [arxiv.org/abs/2005.11401](https://arxiv.org/abs/2005.11401)',
      NULL, NULL, 1,
      'active', '2026-05-23T17:47:34.169Z'
    );

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at)
       VALUES ('3c9f26ef-4d97-4cd7-8731-7a99964a8191', 'memory', 'context-window', '2026-05-23T17:47:34.169Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at)
       VALUES ('7e93288e-7d17-4ede-b670-2400f0fbf3f7', 'memory', 'rag', '2026-05-23T17:47:34.169Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at)
       VALUES ('0e09fa6e-a46f-40d9-a4cd-300d3e53e391', 'memory', 'retrieval', '2026-05-23T17:47:34.169Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at)
       VALUES ('42e8bca2-239c-40cb-8ad2-95d90047dac6', 'memory', 'embedding', '2026-05-23T17:47:34.169Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at)
       VALUES ('e4081485-e017-4d8e-9be9-e840ef405253', 'memory', 'agent', '2026-05-23T17:47:34.169Z');
