INSERT OR IGNORE INTO entries (id, slug, title, content_hash, definition, first_appearance, etymology, current_meaning, divergent_meanings, supersession_note, superseded_by_id, version, state, published_at) VALUES ('18b9b1b3-f8c5-45a0-a24d-2ff380a3288a', 'agent', 'Agent', '56dd19591ed32a9c', 'The field carries two load-bearing definitions of *agent* — one
from the classical-AI textbook tradition, one from the current
LLM-agent product framing — and an encyclopedia entry that picks
only one misreads its own readership. The entry leads on both, in
the order they entered the literature.

The classical-AI definition, identical in phrasing across the
four editions of Russell & Norvig''s *Artificial Intelligence: A
Modern Approach* from 1995 to 2020, is the field''s structural
root:

> "An agent is anything that can be viewed as perceiving its
> environment through sensors and acting upon that environment
> through actuators." [^1]

The multi-agent-systems literature of the same decade sharpens
the structural root into a property list. Wooldridge & Jennings''
1995 *Knowledge Engineering Review* survey is the canonical
crystallization:

> "[A] hardware or (more usually) software-based computer system
> that enjoys the following properties: *autonomy*: agents operate
> without the direct intervention of humans or others, and have
> some kind of control over their actions and internal state;
> *social ability*: agents interact with other agents (and
> possibly humans) via some kind of agent-communication language;
> *reactivity*: agents perceive their environment […] and respond
> in a timely fashion to changes that occur in it; *pro-
> activeness*: agents do not simply act in response to their
> environment, they are able to exhibit goal-directed behaviour
> by taking the initiative." [^2]

The current LLM-agent product definition, settled by Anthropic
on 2024-12-19, draws a structural line readers will not find in
the 1995 sources — the distinction between an *agent* and a
*workflow*:

> "Agents, on the other hand, are systems where LLMs dynamically
> direct their own processes and tool usage, maintaining control
> over how they accomplish tasks. […] Workflows are systems where
> LLMs and tools are orchestrated through predefined code
> paths." [^3]

The classical definition is structural and remains correct under
the LLM-agent framing — the LLM is the agent function, the
environment is the user plus tools plus filesystem plus network.
The product definition adds a control-locus criterion (who
directs the loop: the runtime, or the model) that the classical
definition leaves unspecified. The two are complementary
readings of the same word at different layers of abstraction.

[^1]: Russell, S. & Norvig, P., *Artificial Intelligence: A
    Modern Approach*, 4th edition, Pearson, 2020. Chapter 2
    ("Intelligent Agents"), §2.1 "Agents and Environments,"
    p. 36. Identical phrasing across the 1st (1995), 2nd (2003),
    3rd (2010), and 4th (2020) editions. Print-anchored citation;
    no canonical URL.

[^2]: Wooldridge, M. & Jennings, N. R., *Intelligent agents:
    Theory and practice*, *The Knowledge Engineering Review*
    10(2):115–152, 1995. DOI:
    [10.1017/S0269888900008122](https://doi.org/10.1017/S0269888900008122).
    Accessed 2026-05-23.

[^3]: Anthropic, *Building effective agents*, 2024-12-19,
    accessed 2026-05-23.
    [anthropic.com/research/building-effective-agents](https://www.anthropic.com/research/building-effective-agents)

[^4]: Yao, S. et al., *ReAct: Synergizing Reasoning and Acting
    in Language Models*, arXiv:2210.03629, 2022, accessed
    2026-05-23.
    [arxiv.org/abs/2210.03629](https://arxiv.org/abs/2210.03629)

[^5]: Significant Gravitas, *AutoGPT*, GitHub repository, first
    release March 2023, accessed 2026-05-23.
    [github.com/Significant-Gravitas/AutoGPT](https://github.com/Significant-Gravitas/AutoGPT)

[^6]: Nakajima, Y., *BabyAGI*, GitHub repository, first release
    April 2023, accessed 2026-05-23.
    [github.com/yoheinakajima/babyagi](https://github.com/yoheinakajima/babyagi)

[^7]: *Oxford English Dictionary*, entry "agent, n.", senses 1
    ("one who acts") and 6 ("a person or thing that acts to
    produce a particular result"), accessed 2026-05-23.
    [oed.com/dictionary/agent_n](https://www.oed.com/dictionary/agent_n)

[^8]: OpenAI Agents SDK (Python), documentation site, accessed
    2026-05-23.
    [openai.github.io/openai-agents-python/](https://openai.github.io/openai-agents-python/)

[^9]: OpenAI, *New tools for building agents*, 2025-03-11,
    accessed 2026-05-23.
    [openai.com/index/new-tools-for-building-agents/](https://openai.com/index/new-tools-for-building-agents/)

[^10]: Dennett, D. C., *Intentional Systems*, *The Journal of
    Philosophy* 68(4):87–106, 1971. DOI:
    [10.2307/2025382](https://doi.org/10.2307/2025382). The
    book-length treatment is Dennett, D. C., *The Intentional
    Stance*, MIT Press, 1987. Print-anchored citation.

[^11]: Bratman, M. E., *Intention, Plans, and Practical Reason*,
    Harvard University Press, 1987. Print-anchored citation; no
    canonical URL.

[^12]: Rao, A. S. & Georgeff, M. P., *BDI Agents: From Theory to
    Practice*, in *Proceedings of the First International
    Conference on Multi-Agent Systems* (ICMAS-95), pp. 312–319,
    1995. Print-anchored citation.', 'There is no defensible single first-appearance date for *agent*
in the AI sense. The term carries forward from the multi-agent-
systems and distributed-AI literature of the 1980s–90s into the
current LLM-era usage; treating any one publication as the
coinage would misrepresent the lineage.

Three load-bearing anchors, cited in the order they entered the
literature:

**Classical-AI anchor: 1995.** Russell & Norvig, *Artificial
Intelligence: A Modern Approach*, 1st edition, 1995. Chapter 2
("Intelligent Agents") establishes the perceive-then-act
framing that runs unchanged through the 2020 4th edition. [^1]

**Multi-agent-systems anchor: 1995.** Wooldridge & Jennings,
*Intelligent agents: Theory and practice*, *The Knowledge
Engineering Review* 10(2):115–152. [^2] The paper crystallizes
the autonomy / reactivity / pro-activeness / social-ability
property list that organized the next decade of MAS research and
remains the structural reference point for autonomy claims
today.

**LLM-agent product-framing anchor: 2024-12-19.** Anthropic,
*Building effective agents*. [^3] The cite is to this article
specifically because it is the first widely-adopted statement of
the workflow↔agent distinction. The informal LLM-agent usage
predates it — ReAct (Yao et al., 2022) [^4], AutoGPT (Toran
Bruce Richards, March 2023) [^5], and BabyAGI (Yohei Nakajima,
April 2023) [^6] all use "agent" to mean a loop that plans,
calls tools, and replans — but none draw the workflow↔agent line
cleanly, and the convergence on that line is what the current
product framing rests on.

The honest read of §2: the word *agent* is inherited from MAS
literature crystallized by Wooldridge & Jennings in 1995, and
the current product sense was sharpened by Anthropic in 2024.

[^1]: Russell, S. & Norvig, P., *Artificial Intelligence: A
    Modern Approach*, 4th edition, Pearson, 2020. Chapter 2
    ("Intelligent Agents"), §2.1 "Agents and Environments,"
    p. 36. Identical phrasing across the 1st (1995), 2nd (2003),
    3rd (2010), and 4th (2020) editions. Print-anchored citation;
    no canonical URL.

[^2]: Wooldridge, M. & Jennings, N. R., *Intelligent agents:
    Theory and practice*, *The Knowledge Engineering Review*
    10(2):115–152, 1995. DOI:
    [10.1017/S0269888900008122](https://doi.org/10.1017/S0269888900008122).
    Accessed 2026-05-23.

[^3]: Anthropic, *Building effective agents*, 2024-12-19,
    accessed 2026-05-23.
    [anthropic.com/research/building-effective-agents](https://www.anthropic.com/research/building-effective-agents)

[^4]: Yao, S. et al., *ReAct: Synergizing Reasoning and Acting
    in Language Models*, arXiv:2210.03629, 2022, accessed
    2026-05-23.
    [arxiv.org/abs/2210.03629](https://arxiv.org/abs/2210.03629)

[^5]: Significant Gravitas, *AutoGPT*, GitHub repository, first
    release March 2023, accessed 2026-05-23.
    [github.com/Significant-Gravitas/AutoGPT](https://github.com/Significant-Gravitas/AutoGPT)

[^6]: Nakajima, Y., *BabyAGI*, GitHub repository, first release
    April 2023, accessed 2026-05-23.
    [github.com/yoheinakajima/babyagi](https://github.com/yoheinakajima/babyagi)

[^7]: *Oxford English Dictionary*, entry "agent, n.", senses 1
    ("one who acts") and 6 ("a person or thing that acts to
    produce a particular result"), accessed 2026-05-23.
    [oed.com/dictionary/agent_n](https://www.oed.com/dictionary/agent_n)

[^8]: OpenAI Agents SDK (Python), documentation site, accessed
    2026-05-23.
    [openai.github.io/openai-agents-python/](https://openai.github.io/openai-agents-python/)

[^9]: OpenAI, *New tools for building agents*, 2025-03-11,
    accessed 2026-05-23.
    [openai.com/index/new-tools-for-building-agents/](https://openai.com/index/new-tools-for-building-agents/)

[^10]: Dennett, D. C., *Intentional Systems*, *The Journal of
    Philosophy* 68(4):87–106, 1971. DOI:
    [10.2307/2025382](https://doi.org/10.2307/2025382). The
    book-length treatment is Dennett, D. C., *The Intentional
    Stance*, MIT Press, 1987. Print-anchored citation.

[^11]: Bratman, M. E., *Intention, Plans, and Practical Reason*,
    Harvard University Press, 1987. Print-anchored citation; no
    canonical URL.

[^12]: Rao, A. S. & Georgeff, M. P., *BDI Agents: From Theory to
    Practice*, in *Proceedings of the First International
    Conference on Multi-Agent Systems* (ICMAS-95), pp. 312–319,
    1995. Print-anchored citation.', 'From Latin *agens*, present participle of *agere* — "to do,
drive, lead" — via Old French *agent* into Middle English by the
late 15th century in the general sense of "one who acts." The AI
use inherits the philosophical sense of an entity whose behavior
is most economically predicted by attributing beliefs, desires,
and intentions to it — Dennett''s "intentional stance," 1971. [^7] [^10]

The etymology is load-bearing because the classical-AI
definition silently relies on it. "Anything that perceives and
*acts*" is not jargon; the verb is the Latin root, and the
definition''s reach depends on reading *act* in its ordinary
sense.

[^1]: Russell, S. & Norvig, P., *Artificial Intelligence: A
    Modern Approach*, 4th edition, Pearson, 2020. Chapter 2
    ("Intelligent Agents"), §2.1 "Agents and Environments,"
    p. 36. Identical phrasing across the 1st (1995), 2nd (2003),
    3rd (2010), and 4th (2020) editions. Print-anchored citation;
    no canonical URL.

[^2]: Wooldridge, M. & Jennings, N. R., *Intelligent agents:
    Theory and practice*, *The Knowledge Engineering Review*
    10(2):115–152, 1995. DOI:
    [10.1017/S0269888900008122](https://doi.org/10.1017/S0269888900008122).
    Accessed 2026-05-23.

[^3]: Anthropic, *Building effective agents*, 2024-12-19,
    accessed 2026-05-23.
    [anthropic.com/research/building-effective-agents](https://www.anthropic.com/research/building-effective-agents)

[^4]: Yao, S. et al., *ReAct: Synergizing Reasoning and Acting
    in Language Models*, arXiv:2210.03629, 2022, accessed
    2026-05-23.
    [arxiv.org/abs/2210.03629](https://arxiv.org/abs/2210.03629)

[^5]: Significant Gravitas, *AutoGPT*, GitHub repository, first
    release March 2023, accessed 2026-05-23.
    [github.com/Significant-Gravitas/AutoGPT](https://github.com/Significant-Gravitas/AutoGPT)

[^6]: Nakajima, Y., *BabyAGI*, GitHub repository, first release
    April 2023, accessed 2026-05-23.
    [github.com/yoheinakajima/babyagi](https://github.com/yoheinakajima/babyagi)

[^7]: *Oxford English Dictionary*, entry "agent, n.", senses 1
    ("one who acts") and 6 ("a person or thing that acts to
    produce a particular result"), accessed 2026-05-23.
    [oed.com/dictionary/agent_n](https://www.oed.com/dictionary/agent_n)

[^8]: OpenAI Agents SDK (Python), documentation site, accessed
    2026-05-23.
    [openai.github.io/openai-agents-python/](https://openai.github.io/openai-agents-python/)

[^9]: OpenAI, *New tools for building agents*, 2025-03-11,
    accessed 2026-05-23.
    [openai.com/index/new-tools-for-building-agents/](https://openai.com/index/new-tools-for-building-agents/)

[^10]: Dennett, D. C., *Intentional Systems*, *The Journal of
    Philosophy* 68(4):87–106, 1971. DOI:
    [10.2307/2025382](https://doi.org/10.2307/2025382). The
    book-length treatment is Dennett, D. C., *The Intentional
    Stance*, MIT Press, 1987. Print-anchored citation.

[^11]: Bratman, M. E., *Intention, Plans, and Practical Reason*,
    Harvard University Press, 1987. Print-anchored citation; no
    canonical URL.

[^12]: Rao, A. S. & Georgeff, M. P., *BDI Agents: From Theory to
    Practice*, in *Proceedings of the First International
    Conference on Multi-Agent Systems* (ICMAS-95), pp. 312–319,
    1995. Print-anchored citation.', 'The field carries three structurally-distinct facets and two
adjacent product-framings worth disambiguating.

**Facet A — Classical AI / textbook (Russell & Norvig).**
An agent is a function from percept sequences to actions:
sensors yield percepts, the agent function maps history-of-
percepts to an action, actuators apply the action to the
environment. The agent is characterized by *rationality*
(maximizes expected utility given what it knows), by the
*environment* properties under which it operates (fully or
partially observable, deterministic or stochastic, episodic or
sequential, static or dynamic, discrete or continuous, single-
or multi-agent), and by its *architecture* (simple reflex,
model-based, goal-based, utility-based, learning). [^1]

**Facet B — Multi-agent systems / autonomous agents
(Wooldridge & Jennings).** An agent is a hardware or software
entity exhibiting the four properties listed in §1: autonomy,
reactivity, pro-activeness, and social ability. The architecture
most associated with this tradition is BDI (belief-desire-
intention), per Bratman 1987 [^11] and Rao & Georgeff 1995. [^12] The MAS
framing organized two decades of research on agent communication
languages, negotiation protocols, and coordination algorithms;
its vocabulary persists in the autonomy properties cited
throughout the current literature. [^2]

**Facet C — LLM-agent product framing (Anthropic).** A system in
which an LLM dynamically directs its own processes and tool
usage, in contrast to a workflow, in which LLMs and tools are
orchestrated through predefined code paths. The distinguishing
criterion is the *locus of control* over the loop: in an agent
the model decides what to do next, in a workflow the code
decides. [^3]

**Adjacent framing — OpenAI Agents SDK.** OpenAI released the
Agents SDK and Responses API on 2025-03-11. [^8] [^9] Under the
SDK, an agent is an LLM configured with *instructions*, *tools*,
and *handoffs* to other agents, with orchestration handled by
the SDK runtime. The framing emphasizes handoffs and inter-agent
orchestration where Anthropic''s framing emphasizes dynamic
control over a single loop; the two are co-equal current product
framings, not a single convergence.

**Adjacent framing — practitioner / autonomous-loop sense.** The
2023-vintage usage popularized by AutoGPT [^5] and BabyAGI [^6]:
a loop that plans, executes, reflects, and replans without turn-
by-turn human input. This is the populist root the current
product framings sit on top of; it has not gone away, and most
practitioners still reach for *agent* in this sense by default.

Convergence finding: HIGH on Facets A and B (the classical and
MAS definitions are stable across four decades of textbooks).
LOW-to-MIXED on the current LLM-agent framings — Anthropic draws
the line at dynamic control, OpenAI''s SDK emphasizes handoffs
and orchestration, and practitioner usage emphasizes the loop.
The framings are not contradictory but they weight differently;
a reader bringing one to another''s text will miscalibrate.

[^1]: Russell, S. & Norvig, P., *Artificial Intelligence: A
    Modern Approach*, 4th edition, Pearson, 2020. Chapter 2
    ("Intelligent Agents"), §2.1 "Agents and Environments,"
    p. 36. Identical phrasing across the 1st (1995), 2nd (2003),
    3rd (2010), and 4th (2020) editions. Print-anchored citation;
    no canonical URL.

[^2]: Wooldridge, M. & Jennings, N. R., *Intelligent agents:
    Theory and practice*, *The Knowledge Engineering Review*
    10(2):115–152, 1995. DOI:
    [10.1017/S0269888900008122](https://doi.org/10.1017/S0269888900008122).
    Accessed 2026-05-23.

[^3]: Anthropic, *Building effective agents*, 2024-12-19,
    accessed 2026-05-23.
    [anthropic.com/research/building-effective-agents](https://www.anthropic.com/research/building-effective-agents)

[^4]: Yao, S. et al., *ReAct: Synergizing Reasoning and Acting
    in Language Models*, arXiv:2210.03629, 2022, accessed
    2026-05-23.
    [arxiv.org/abs/2210.03629](https://arxiv.org/abs/2210.03629)

[^5]: Significant Gravitas, *AutoGPT*, GitHub repository, first
    release March 2023, accessed 2026-05-23.
    [github.com/Significant-Gravitas/AutoGPT](https://github.com/Significant-Gravitas/AutoGPT)

[^6]: Nakajima, Y., *BabyAGI*, GitHub repository, first release
    April 2023, accessed 2026-05-23.
    [github.com/yoheinakajima/babyagi](https://github.com/yoheinakajima/babyagi)

[^7]: *Oxford English Dictionary*, entry "agent, n.", senses 1
    ("one who acts") and 6 ("a person or thing that acts to
    produce a particular result"), accessed 2026-05-23.
    [oed.com/dictionary/agent_n](https://www.oed.com/dictionary/agent_n)

[^8]: OpenAI Agents SDK (Python), documentation site, accessed
    2026-05-23.
    [openai.github.io/openai-agents-python/](https://openai.github.io/openai-agents-python/)

[^9]: OpenAI, *New tools for building agents*, 2025-03-11,
    accessed 2026-05-23.
    [openai.com/index/new-tools-for-building-agents/](https://openai.com/index/new-tools-for-building-agents/)

[^10]: Dennett, D. C., *Intentional Systems*, *The Journal of
    Philosophy* 68(4):87–106, 1971. DOI:
    [10.2307/2025382](https://doi.org/10.2307/2025382). The
    book-length treatment is Dennett, D. C., *The Intentional
    Stance*, MIT Press, 1987. Print-anchored citation.

[^11]: Bratman, M. E., *Intention, Plans, and Practical Reason*,
    Harvard University Press, 1987. Print-anchored citation; no
    canonical URL.

[^12]: Rao, A. S. & Georgeff, M. P., *BDI Agents: From Theory to
    Practice*, in *Proceedings of the First International
    Conference on Multi-Agent Systems* (ICMAS-95), pp. 312–319,
    1995. Print-anchored citation.', 'Two load-bearing divergences, then three scope distinctions.

**Agent vs workflow (the Anthropic 2024-12-19 line).** A
workflow follows predefined code paths; an agent directs its own
process. Under this line, a 2023-vintage AutoGPT loop is an
agent (the model decides what tool to call and when to stop); a
LangChain chain with a fixed sequence of LLM and tool steps is a
workflow (the code decides the sequence); a Claude Code session
with dynamic tool selection across an MCP server is an agent
(the model decides). The line is structural — it cuts on locus
of control, not on whether the system uses tools or maintains
state — and readers who carry a different cut will conflate the
two categories the line is drawn to separate. The Anthropic
quote is the load-bearing source; the line is what §5 is for.

**Classical-AI agent vs LLM agent.** A classical-AI agent is a
perceive-then-act function over a defined environment. An LLM
agent is an LLM in a loop with tools. The classical definition
*covers* the LLM agent — the LLM is the agent function, the
environment is the user plus tools plus filesystem plus network
— but the framings emphasize different things. Classical-AI text
discusses environment properties (observability, determinism,
episodicity) and architecture choice (reflex, model-based, goal-
based); LLM-agent text discusses tools, instructions, handoffs,
and prompt design. A reader from a reinforcement-learning or
multi-agent-systems background, reading current LLM-agent
documentation, will reach for the structural framing and miss
the orchestration vocabulary the documentation is actually
teaching. The reverse reader will read AIMA Chapter 2 and miss
the rationality and environment-property apparatus that gives
the classical definition its weight.

**Agent vs assistant.** *Assistant* names the UI and product
framing — ChatGPT, Claude.ai chat. *Agent* names the underlying
autonomy posture. An assistant in chat-only mode is not an agent
under Facet C — no dynamic tool direction, no loop. The same
model, given tools and a loop, becomes one. The terms cross-
reference but do not equate.

**Agent vs model.** A model is weights plus an inference
surface. An agent is a model plus instructions plus tools plus
(typically) a loop. "Claude is an agent" is shorthand at best;
"Claude, in this harness, is the agent" is the precise statement.
The encyclopedia uses the precise form throughout.

**AI agent vs legal/economic agent.** A reader from law or
economics will reach for *agent of a principal* — an entity in
an agency relationship, bound by fiduciary duties to a
principal. The encyclopedia uses *agent* in the AI sense
throughout; the legal/economic sense is named here to forestall
drift, not engaged with.

[^1]: Russell, S. & Norvig, P., *Artificial Intelligence: A
    Modern Approach*, 4th edition, Pearson, 2020. Chapter 2
    ("Intelligent Agents"), §2.1 "Agents and Environments,"
    p. 36. Identical phrasing across the 1st (1995), 2nd (2003),
    3rd (2010), and 4th (2020) editions. Print-anchored citation;
    no canonical URL.

[^2]: Wooldridge, M. & Jennings, N. R., *Intelligent agents:
    Theory and practice*, *The Knowledge Engineering Review*
    10(2):115–152, 1995. DOI:
    [10.1017/S0269888900008122](https://doi.org/10.1017/S0269888900008122).
    Accessed 2026-05-23.

[^3]: Anthropic, *Building effective agents*, 2024-12-19,
    accessed 2026-05-23.
    [anthropic.com/research/building-effective-agents](https://www.anthropic.com/research/building-effective-agents)

[^4]: Yao, S. et al., *ReAct: Synergizing Reasoning and Acting
    in Language Models*, arXiv:2210.03629, 2022, accessed
    2026-05-23.
    [arxiv.org/abs/2210.03629](https://arxiv.org/abs/2210.03629)

[^5]: Significant Gravitas, *AutoGPT*, GitHub repository, first
    release March 2023, accessed 2026-05-23.
    [github.com/Significant-Gravitas/AutoGPT](https://github.com/Significant-Gravitas/AutoGPT)

[^6]: Nakajima, Y., *BabyAGI*, GitHub repository, first release
    April 2023, accessed 2026-05-23.
    [github.com/yoheinakajima/babyagi](https://github.com/yoheinakajima/babyagi)

[^7]: *Oxford English Dictionary*, entry "agent, n.", senses 1
    ("one who acts") and 6 ("a person or thing that acts to
    produce a particular result"), accessed 2026-05-23.
    [oed.com/dictionary/agent_n](https://www.oed.com/dictionary/agent_n)

[^8]: OpenAI Agents SDK (Python), documentation site, accessed
    2026-05-23.
    [openai.github.io/openai-agents-python/](https://openai.github.io/openai-agents-python/)

[^9]: OpenAI, *New tools for building agents*, 2025-03-11,
    accessed 2026-05-23.
    [openai.com/index/new-tools-for-building-agents/](https://openai.com/index/new-tools-for-building-agents/)

[^10]: Dennett, D. C., *Intentional Systems*, *The Journal of
    Philosophy* 68(4):87–106, 1971. DOI:
    [10.2307/2025382](https://doi.org/10.2307/2025382). The
    book-length treatment is Dennett, D. C., *The Intentional
    Stance*, MIT Press, 1987. Print-anchored citation.

[^11]: Bratman, M. E., *Intention, Plans, and Practical Reason*,
    Harvard University Press, 1987. Print-anchored citation; no
    canonical URL.

[^12]: Rao, A. S. & Georgeff, M. P., *BDI Agents: From Theory to
    Practice*, in *Proceedings of the First International
    Conference on Multi-Agent Systems* (ICMAS-95), pp. 312–319,
    1995. Print-anchored citation.', 'None. *Agent* remains the field''s load-bearing word and has not
been superseded by any neighboring term.

[^1]: Russell, S. & Norvig, P., *Artificial Intelligence: A
    Modern Approach*, 4th edition, Pearson, 2020. Chapter 2
    ("Intelligent Agents"), §2.1 "Agents and Environments,"
    p. 36. Identical phrasing across the 1st (1995), 2nd (2003),
    3rd (2010), and 4th (2020) editions. Print-anchored citation;
    no canonical URL.

[^2]: Wooldridge, M. & Jennings, N. R., *Intelligent agents:
    Theory and practice*, *The Knowledge Engineering Review*
    10(2):115–152, 1995. DOI:
    [10.1017/S0269888900008122](https://doi.org/10.1017/S0269888900008122).
    Accessed 2026-05-23.

[^3]: Anthropic, *Building effective agents*, 2024-12-19,
    accessed 2026-05-23.
    [anthropic.com/research/building-effective-agents](https://www.anthropic.com/research/building-effective-agents)

[^4]: Yao, S. et al., *ReAct: Synergizing Reasoning and Acting
    in Language Models*, arXiv:2210.03629, 2022, accessed
    2026-05-23.
    [arxiv.org/abs/2210.03629](https://arxiv.org/abs/2210.03629)

[^5]: Significant Gravitas, *AutoGPT*, GitHub repository, first
    release March 2023, accessed 2026-05-23.
    [github.com/Significant-Gravitas/AutoGPT](https://github.com/Significant-Gravitas/AutoGPT)

[^6]: Nakajima, Y., *BabyAGI*, GitHub repository, first release
    April 2023, accessed 2026-05-23.
    [github.com/yoheinakajima/babyagi](https://github.com/yoheinakajima/babyagi)

[^7]: *Oxford English Dictionary*, entry "agent, n.", senses 1
    ("one who acts") and 6 ("a person or thing that acts to
    produce a particular result"), accessed 2026-05-23.
    [oed.com/dictionary/agent_n](https://www.oed.com/dictionary/agent_n)

[^8]: OpenAI Agents SDK (Python), documentation site, accessed
    2026-05-23.
    [openai.github.io/openai-agents-python/](https://openai.github.io/openai-agents-python/)

[^9]: OpenAI, *New tools for building agents*, 2025-03-11,
    accessed 2026-05-23.
    [openai.com/index/new-tools-for-building-agents/](https://openai.com/index/new-tools-for-building-agents/)

[^10]: Dennett, D. C., *Intentional Systems*, *The Journal of
    Philosophy* 68(4):87–106, 1971. DOI:
    [10.2307/2025382](https://doi.org/10.2307/2025382). The
    book-length treatment is Dennett, D. C., *The Intentional
    Stance*, MIT Press, 1987. Print-anchored citation.

[^11]: Bratman, M. E., *Intention, Plans, and Practical Reason*,
    Harvard University Press, 1987. Print-anchored citation; no
    canonical URL.

[^12]: Rao, A. S. & Georgeff, M. P., *BDI Agents: From Theory to
    Practice*, in *Proceedings of the First International
    Conference on Multi-Agent Systems* (ICMAS-95), pp. 312–319,
    1995. Print-anchored citation.', NULL, 1, 'active', '2026-05-23T17:27:21.133Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at) VALUES ('8c99b9e0-b291-45cd-9f9c-190cba05b2a7', 'agent', 'tool', '2026-05-23T17:27:21.133Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at) VALUES ('5432e990-e176-4e01-bab1-f5624370bf5f', 'agent', 'loop', '2026-05-23T17:27:21.133Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at) VALUES ('3756584d-2208-42d7-abb0-5171e5f6e006', 'agent', 'harness', '2026-05-23T17:27:21.133Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at) VALUES ('6046938d-debe-4796-8d5e-b3b662c65537', 'agent', 'scaffold', '2026-05-23T17:27:21.133Z');

INSERT OR IGNORE INTO entries (id, slug, title, content_hash, definition, first_appearance, etymology, current_meaning, divergent_meanings, supersession_note, superseded_by_id, version, state, published_at) VALUES ('f75740a0-683b-4829-a98b-b4352077c6f0', 'harness', 'Harness', '1b30122e421e9887', 'A **harness**, in the agentic-AI vocabulary as it stands in late 2025
and 2026, has no canonical vendor-published definition. No major lab
ships a docs page that says *this is a harness*. The construct is
field-vernacular, and the field is not yet aligned on which of
several distinguishable referents the word picks out.

The closest formal-literature framing is recent and treats the term
as a load-bearing externalization-layer noun:

> "The surrounding harness that makes these modules reliable in
> practice ... capabilities that earlier systems expected the model
> to recover internally are now externalized into memory stores,
> reusable skills, interaction protocols, and the surrounding
> harness." [^1]

The working practitioner gloss — the one most readers will be
carrying into the term — is operational rather than definitional: a
harness is the control-loop and orchestration code that wraps an
LLM call so the combined system can take goal-directed actions over
multiple turns. Tool dispatch, message routing, retry and
escalation, state persistence, termination conditions: the wrapper
that turns a model into an agent.

Both framings are in active use. They do not contradict each other
— the externalization framing names *what* the harness contains;
the operational framing names *what the harness does* — but they
are not the same sentence, and the field has not settled on which
sentence to lead with. §4 and §5 carry the divergence rather than
smoothing it.

[^1]: *Externalization in LLM Agents*, arXiv:2604.08224,
    accessed 2026-05-23.
    [arxiv.org/pdf/2604.08224](https://arxiv.org/pdf/2604.08224)
    (Verifier note: abs/ counterpart preferred for canonical
    publication-date confirmation.)

[^2]: *AutoHarness: improving LLM agents by automatically
    synthesizing a code harness*, arXiv:2603.03329, accessed
    2026-05-23.
    [arxiv.org/pdf/2603.03329](https://arxiv.org/pdf/2603.03329)
    (Verifier note: arXiv-id year reflects mirror metadata; confirm
    canonical publication date via the abs/ landing page.)

[^3]: *General Modular Harness for LLM Agents in Multi-Turn Gaming
    Environments*, arXiv:2507.11633, accessed 2026-05-23.
    [arxiv.org/pdf/2507.11633](https://arxiv.org/pdf/2507.11633)

[^4]: *AgentHarm: A Benchmark for Measuring Harmfulness of LLM
    Agents*, arXiv:2410.09024, 2024-10-11, accessed 2026-05-23.
    [arxiv.org/pdf/2410.09024](https://arxiv.org/pdf/2410.09024)', 'No defensible single first-appearance citation exists. "Harness" is
borrowed from generic software engineering — the *test harness*
that exercises a unit under controlled conditions — and was applied
to LLM agents informally across 2023 and 2024 in practitioner blog
posts, mailing-list threads, and conference-talk vocabulary. No
single post coined the agentic usage; the term drifted in.

The earliest formal-literature usage that treats the construct as a
named object — the wrapper code that turns an LLM into a usable
agent — appears in:

> "AutoHarness: improving LLM agents by automatically synthesizing
> a code harness." [^2]

AutoHarness frames the harness as something that can be
*synthesized automatically*, which presupposes it is a definite,
authorable artifact. That presupposition is the load-bearing piece:
by the time the literature is automating the harness, the field is
treating "harness" as a noun for a specific class of code, even
without a shared definition of what that class contains.

Earlier informal usage almost certainly predates AutoHarness; the
researcher could not locate a defensible practitioner-coinage
anchor inside the bounded research window. The §2 framing here
reflects that absence honestly rather than nominating an arbitrary
blog post.

[^1]: *Externalization in LLM Agents*, arXiv:2604.08224,
    accessed 2026-05-23.
    [arxiv.org/pdf/2604.08224](https://arxiv.org/pdf/2604.08224)
    (Verifier note: abs/ counterpart preferred for canonical
    publication-date confirmation.)

[^2]: *AutoHarness: improving LLM agents by automatically
    synthesizing a code harness*, arXiv:2603.03329, accessed
    2026-05-23.
    [arxiv.org/pdf/2603.03329](https://arxiv.org/pdf/2603.03329)
    (Verifier note: arXiv-id year reflects mirror metadata; confirm
    canonical publication date via the abs/ landing page.)

[^3]: *General Modular Harness for LLM Agents in Multi-Turn Gaming
    Environments*, arXiv:2507.11633, accessed 2026-05-23.
    [arxiv.org/pdf/2507.11633](https://arxiv.org/pdf/2507.11633)

[^4]: *AgentHarm: A Benchmark for Measuring Harmfulness of LLM
    Agents*, arXiv:2410.09024, 2024-10-11, accessed 2026-05-23.
    [arxiv.org/pdf/2410.09024](https://arxiv.org/pdf/2410.09024)', 'From software-testing''s *test harness* — the scaffolding code that
exercises a unit under controlled conditions and inspects its
outputs. Carried into LLM-agent discourse with the metaphor intact:
the LLM is the unit; the harness exercises it and inspects results.
The etymology is short, uncontested, and does its work in one
sentence.

[^1]: *Externalization in LLM Agents*, arXiv:2604.08224,
    accessed 2026-05-23.
    [arxiv.org/pdf/2604.08224](https://arxiv.org/pdf/2604.08224)
    (Verifier note: abs/ counterpart preferred for canonical
    publication-date confirmation.)

[^2]: *AutoHarness: improving LLM agents by automatically
    synthesizing a code harness*, arXiv:2603.03329, accessed
    2026-05-23.
    [arxiv.org/pdf/2603.03329](https://arxiv.org/pdf/2603.03329)
    (Verifier note: arXiv-id year reflects mirror metadata; confirm
    canonical publication date via the abs/ landing page.)

[^3]: *General Modular Harness for LLM Agents in Multi-Turn Gaming
    Environments*, arXiv:2507.11633, accessed 2026-05-23.
    [arxiv.org/pdf/2507.11633](https://arxiv.org/pdf/2507.11633)

[^4]: *AgentHarm: A Benchmark for Measuring Harmfulness of LLM
    Agents*, arXiv:2410.09024, 2024-10-11, accessed 2026-05-23.
    [arxiv.org/pdf/2410.09024](https://arxiv.org/pdf/2410.09024)', 'Three live community facets, with the divergence between them large
enough to mislead a reader who imports one sense into a passage
written in another.

**Facet A — Researcher / academic ("modular harness").** A
composition of modules — perception, memory, reasoning — that a
single LLM backbone plugs into. The model is the engine; the
harness is the chassis. The strongest primary anchor:

> "A modular harness design for LLM agents can be composed of
> perception, memory, and reasoning components, enabling a single
> LLM/VLM backbone to tackle a wide spectrum of multi-turn gaming
> environments without domain-specific engineering." [^3]

This facet treats the harness as a *named architectural unit* with
internal structure (modules, slots), not as undifferentiated
wrapper code.

**Facet B — Practitioner / harness-builder community ("glue /
control loop").** Code that sits between the model and the task:
message routing, tool dispatch, retry logic, state persistence,
termination conditions. Authored by the agent''s developer, not
recovered by the model. The Externalization paper captures the
simplest form:

> "In its simplest incarnation, the harness can be seen as a
> control loop that calls the LLM and rejects unacceptable
> answers." [^1]

A harness in Facet B is *code you write*, not a model property and
not a fixed architectural shape. Most production agent runtimes
sit here.

**Facet C — Safety / evaluation community ("eval harness").** The
scaffolding that runs an agent against tasks and grades the
outputs — closer to the software-testing root. Active during
evaluation, not in production. The lineage is visible in the
AgentHarm benchmark name:

> "AgentHarm: A Benchmark for Measuring Harmfulness of LLM
> Agents." [^4]

The "harm" wordplay rides on "harness" because the benchmark is
itself the evaluation harness in this sense — the rig that scores
agent behavior, not the rig that runs agents in the world.

Convergence-finding (the structural reading): the field uses one
word for three distinguishable constructs — an architectural
composition (A), the runtime wrapper around an LLM call (B), and
the evaluation rig that scores an agent (C). A reader picking up
"harness" in a passage has to recover which of the three the
author meant from surrounding context. The agent-runtime sense
(B) is the dominant practitioner usage in 2026; the academic
sense (A) is the dominant publication usage; the eval sense (C)
remains live in safety work. None has displaced the others.

[^1]: *Externalization in LLM Agents*, arXiv:2604.08224,
    accessed 2026-05-23.
    [arxiv.org/pdf/2604.08224](https://arxiv.org/pdf/2604.08224)
    (Verifier note: abs/ counterpart preferred for canonical
    publication-date confirmation.)

[^2]: *AutoHarness: improving LLM agents by automatically
    synthesizing a code harness*, arXiv:2603.03329, accessed
    2026-05-23.
    [arxiv.org/pdf/2603.03329](https://arxiv.org/pdf/2603.03329)
    (Verifier note: arXiv-id year reflects mirror metadata; confirm
    canonical publication date via the abs/ landing page.)

[^3]: *General Modular Harness for LLM Agents in Multi-Turn Gaming
    Environments*, arXiv:2507.11633, accessed 2026-05-23.
    [arxiv.org/pdf/2507.11633](https://arxiv.org/pdf/2507.11633)

[^4]: *AgentHarm: A Benchmark for Measuring Harmfulness of LLM
    Agents*, arXiv:2410.09024, 2024-10-11, accessed 2026-05-23.
    [arxiv.org/pdf/2410.09024](https://arxiv.org/pdf/2410.09024)', 'Divergence is the entry. Three load-bearing splits:

1. **Harness as runtime (Facets A + B) vs. harness as evaluation
   rig (Facet C).** A runtime harness runs in production and
   persists across the agent''s lifetime; an evaluation harness
   runs during benchmarking and exists to score agent behavior.
   Same word, different artifacts, different lifecycles.
2. **Harness as authored code (Facet B) vs. harness as
   architectural composition (Facet A).** Facet B is the code a
   developer writes around the model; Facet A is a named
   architecture with slots (perception, memory, reasoning) that
   the model plugs into. A reader bringing Facet B to a Facet A
   paper will read the paper as describing a code module rather
   than an architectural pattern.
3. **Harness vs. scaffold (the cousin term, encyclopedia entry
   #9).** Community usage drifts between the two — some sources
   use "scaffold" and "harness" interchangeably for the wrapper
   sense — even though the etymologies have distinguishable
   intuitions. *Scaffold* carries the implication of an aid that
   comes off when the work is mature; *harness* carries the
   implication of a wrapper that stays. The practitioner drift
   between the two is itself a vocabulary instability the field
   has not resolved.

A note on scope: reflection''s own vocabulary uses *substrate* for
roughly the Facet B concept (the runtime that wraps the model into
an agent). That is house vocabulary, not a field convergence — the
agentscape entry does not import it. The point of naming the
non-convergence here is to warn readers that no single sense of
"harness" is the sense; the surrounding sentences tell you which.

[^1]: *Externalization in LLM Agents*, arXiv:2604.08224,
    accessed 2026-05-23.
    [arxiv.org/pdf/2604.08224](https://arxiv.org/pdf/2604.08224)
    (Verifier note: abs/ counterpart preferred for canonical
    publication-date confirmation.)

[^2]: *AutoHarness: improving LLM agents by automatically
    synthesizing a code harness*, arXiv:2603.03329, accessed
    2026-05-23.
    [arxiv.org/pdf/2603.03329](https://arxiv.org/pdf/2603.03329)
    (Verifier note: arXiv-id year reflects mirror metadata; confirm
    canonical publication date via the abs/ landing page.)

[^3]: *General Modular Harness for LLM Agents in Multi-Turn Gaming
    Environments*, arXiv:2507.11633, accessed 2026-05-23.
    [arxiv.org/pdf/2507.11633](https://arxiv.org/pdf/2507.11633)

[^4]: *AgentHarm: A Benchmark for Measuring Harmfulness of LLM
    Agents*, arXiv:2410.09024, 2024-10-11, accessed 2026-05-23.
    [arxiv.org/pdf/2410.09024](https://arxiv.org/pdf/2410.09024)', 'No supersession. "Harness" has not been retired, and no canonical
field-wide successor has emerged. Reflection''s *substrate* is house
vocabulary inside one project, not a field-wide replacement.

[^1]: *Externalization in LLM Agents*, arXiv:2604.08224,
    accessed 2026-05-23.
    [arxiv.org/pdf/2604.08224](https://arxiv.org/pdf/2604.08224)
    (Verifier note: abs/ counterpart preferred for canonical
    publication-date confirmation.)

[^2]: *AutoHarness: improving LLM agents by automatically
    synthesizing a code harness*, arXiv:2603.03329, accessed
    2026-05-23.
    [arxiv.org/pdf/2603.03329](https://arxiv.org/pdf/2603.03329)
    (Verifier note: arXiv-id year reflects mirror metadata; confirm
    canonical publication date via the abs/ landing page.)

[^3]: *General Modular Harness for LLM Agents in Multi-Turn Gaming
    Environments*, arXiv:2507.11633, accessed 2026-05-23.
    [arxiv.org/pdf/2507.11633](https://arxiv.org/pdf/2507.11633)

[^4]: *AgentHarm: A Benchmark for Measuring Harmfulness of LLM
    Agents*, arXiv:2410.09024, 2024-10-11, accessed 2026-05-23.
    [arxiv.org/pdf/2410.09024](https://arxiv.org/pdf/2410.09024)', NULL, 1, 'active', '2026-05-23T17:27:21.133Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at) VALUES ('b47577fb-1709-4069-95c4-0b965339549c', 'harness', 'agent', '2026-05-23T17:27:21.133Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at) VALUES ('ecdc3e9e-3241-4ac0-ae3a-7e441c27c24d', 'harness', 'loop', '2026-05-23T17:27:21.133Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at) VALUES ('105b757a-1f4b-487f-9f28-ded9951ec4fb', 'harness', 'scaffold', '2026-05-23T17:27:21.133Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at) VALUES ('b9969f49-4531-4056-8525-15a40c5a32fc', 'harness', 'tool', '2026-05-23T17:27:21.133Z');
