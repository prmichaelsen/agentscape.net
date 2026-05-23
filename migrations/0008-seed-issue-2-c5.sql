-- migrations/0008-seed-issue-2-c5.sql
-- C5 (slot=3) seeded into issue 2 after voice-gate PASS (editor 2026-05-23T17-13-00Z)
-- and verifier confirmation (2026-05-23T17-11-30Z). C5 spine: how the agentscape allocates
-- capital and direction via legible artifacts; category: asymmetry (one benchmark, priced).
PRAGMA foreign_keys = ON;

-- New spine_tag + category_tag (first appearances) -------------------
INSERT OR IGNORE INTO spine_tags (id, slug, label, description) VALUES
  ('spine-capital-allocation', 'spine-capital-allocation',
   'How capital and direction are allocated',
   'Sub-question: how the agentscape allocates capital and direction via legible artifacts.');

INSERT OR IGNORE INTO category_tags (id, slug, label, description) VALUES
  ('cat-asymmetry', 'cat-asymmetry', 'Asymmetry',
   'Pieces reporting a structural asymmetry between artifacts that look interchangeable.');

-- longform body ------------------------------------------------------
INSERT OR IGNORE INTO longform (id, slug, title, body, version, published_at) VALUES
  ('lf-issue-2-C5', 'one-benchmark-priced',
   'One benchmark, priced',
   '# One benchmark, priced

Five evaluation suites are routinely cited as the load-bearing
proof-points of agent capability in 2026: SWE-bench Verified,
GAIA, MLE-bench, Terminal-Bench, AgentBench. Four of them shape
where research goes. One of them prices a company. The asymmetry
is the finding.

SWE-bench Verified — the 500-task subset of the original Princeton
benchmark, [^1] human-validated by OpenAI''s Preparedness team in
August 2024 — is the only one of the five that appears in
fundraising narratives at the dollar amount. Cognition''s debut blog
for Devin led with a SWE-bench number. Bloomberg''s coverage of the
firm''s April 2026 funding talks at a $25B valuation, following a
September 2025 round at $10.2B, names the number in the same
paragraph as the customer roster: "On the SWE-bench benchmark of
real-world GitHub issues, Cognition has reported Devin achieving
13.86% end-to-end resolution versus prior baselines near 2%." [^2]
The fundraise was priced against the score. The investors knew
which number they were buying.

The model-vendor side of the same pattern is more legible still.
Every Claude flagship coding release from August 2025 forward
organizes its launch page around a SWE-bench Verified number.
Opus 4.1, August 2025: "advances our state-of-the-art coding
performance to 74.5% on SWE-bench Verified." [^3] Sonnet 4.5,
September 2025: 77.2%, with press framing the launch as "Tops
SWE-Bench Verified, Extends Coding Focus beyond 30 Hours." [^4]
Opus 4.5, November 2025: 80.9% on SWE-bench Verified — the first
flagship to cross the 80% line on the benchmark — paired with new
per-token pricing the vendor framed as "dramatically fewer tokens
than its predecessors." [^5] The benchmark score is the proof-point
the launch is built on; the price cut is the offer the score
justifies. Three releases in four months, one axis.

## The four that do not price

GAIA exists, is maintained jointly by Meta AI and Hugging Face, and
shipped a 466-question evaluation with a held-out test split where
GPT-4 plus tools scored 15% against a human baseline of 92%. [^6]
MLE-bench exists, was authored by OpenAI''s evals team in October
2024, and reframes 75 Kaggle competitions as agent tasks; its
launch result named AIDE as the reference scaffolding for the
field. [^7] Terminal-Bench exists, is a Stanford–Laude
Institute collaboration covering software-engineering, ML, security,
and data science tasks in terminal environments, and is currently on v2.0
with v3.0 in development. [^8] AgentBench exists, is maintained by
Tsinghua''s THUDM group across eight environments, and produced the
field''s most-cited early observation about the gap between
commercial and sub-70B open-source models. [^9]

All four direct research. None of them prices a round. The
funding-citation trail at the dollar amount, in the primary sources
this section was drafted against, is concentrated on a single
benchmark. The honest read is not that five evaluation suites are
load-bearing for capital. The honest read is that one of them is,
and the other four shape what gets worked on without that
specific lever attached.

## What is being priced

A benchmark that prices a fundraise is being asked to do work the
benchmark''s authors did not originally scope it for. Three pieces
of primary literature, published in 2025, name the gap.

The first is contamination. The SWE-MERA paper reports that
"SWE-bench reports 32.67% of successful patches involve direct
solution leakage and 31.08% pass due to inadequate test cases."
[^10a] A third of the patches the leaderboard scores as successful
either resolve via memorized solutions or pass tests that did not
actually exercise the bug. The contamination is not in the
marketing copy.

The second is mis-scoring. A separate 2025 paper, UTBoost, audits
the leaderboards directly: by generating additional test cases, the
authors identified 345 erroneous patches incorrectly labeled as
passed in the original SWE-bench, affecting 40.9% of SWE-Bench Lite
and 24.4% of SWE-Bench Verified leaderboard entries. [^10b] If the
figures hold, roughly one in four entries on the Verified
leaderboard carry corrections the published ranking does not.

The third is the maintainers'' own response. SWE-bench-Live, a 2025
release of 1,319 tasks created from GitHub issues filed since 2024,
was built specifically to address the contamination and
scalability concerns the static benchmark had accumulated. [^11]
The static variant did not become a Live variant because the field
was satisfied with how the static variant was being used. A
benchmark whose maintainers ship a contamination-resistant
successor is a benchmark whose maintainers know the original is
being gamed.

## The de-facto regulator

None of the institutions cited in this section elected the
benchmark''s authors as arbiters of which agent narratives are
credible. The benchmark became one anyway. Princeton''s NLP group
authored the original evaluation; OpenAI''s Preparedness team
authored the 500-task Verified subset; together they hold the only
legible proof-point that model-vendor launch pages, agent-startup
fundraise decks, and press coverage of the same all share. The
authority is not granted. It is what is left when no other artifact
is doing the work the field needs an artifact to do.

The deprecation cost is the structural observation the receipts
support. If Princeton and OpenAI''s Preparedness team announced
together that Verified scores prior to 2026 should be treated as
unreliable — and the contamination and mis-scoring evidence above
suggests they have grounds to — every fundraise narrative pinned to
a pre-2026 number would lose its anchor in a single news cycle.
That such an announcement is unlikely is not evidence that the
numbers are sound. It is evidence of the constraint the de-facto
regulator is under: announcing the floor is unsafe means
unwriting the prices.

The integrity question is not whether SWE-bench Verified is a good
benchmark. It is whether the numbers the funding decisions believe
they are buying are the numbers the leaderboard publishes. Three
pieces of 2025 primary literature say no, and the maintainers''
response — a Live variant, in progress — says they know.

---',
   1, '2026-05-23');

-- section ------------------------------------------------------------
INSERT OR IGNORE INTO sections
  (id, issue_id, section_id, title, frame, structural_argument,
   spine_tag_id, category_tag_id, longform_id, slot, published_at) VALUES
  ('sec-issue-2-C5', 'issue-2', 'C5',
   'One benchmark, priced',
   'Five evaluation suites are routinely cited as load-bearing proof-points of agent capability in 2026; four direct research, one prices a fundraise. The asymmetry — SWE-bench Verified as the only suite appearing in capital-allocation narratives — is the finding.',
   'Structural-asymmetry reading across five named benchmarks with primary-source citation chain; contamination/mis-scoring evidence (SWE-MERA, UTBoost) sourced to 2025 papers; SWE-bench-Live cited as maintainer-side response; Terminal-Bench correctly attributed to Stanford x Laude Institute collaboration per editor re-stamp.',
   'spine-capital-allocation', 'cat-asymmetry', 'lf-issue-2-C5', 3, '2026-05-23');

-- citations (11 footnotes; verified_at stamped from C5 verifier pass)
INSERT OR IGNORE INTO citations (id, section_id, label, url, kind, verified_at) VALUES
  ('cit-issue-2-C5-1', 'sec-issue-2-C5',
   'Jimenez, Yang, Wettig, Yao, Pei, Press, Narasimhan, *SWE-bench: Can Language Models Resolve Real-World GitHub Issues?*, ICLR 2024 (arXiv...',
   'https://arxiv.org/abs/2310.06770',
   'paper', '2026-05-23T17:11:30Z'),
  ('cit-issue-2-C5-2', 'sec-issue-2-C5',
   'Bloomberg, *AI Coding Firm Cognition in Funding Talks at $25 Billion Value*, 2026-04-23. (paywalled). Open-surface confirmation of the $2...',
   'https://www.bloomberg.com/news/articles/2026-04-23/ai-coding-firm-cognition-in-funding-talks-at-25-billion-value',
   'press', '2026-05-23T17:11:30Z'),
  ('cit-issue-2-C5-3', 'sec-issue-2-C5',
   'Anthropic, *Claude Opus 4.1*, 2025-08. . Secondary framing at InfoQ, 2025-08.',
   'https://www.anthropic.com/news/claude-opus-4-1',
   'vendor-doc', '2026-05-23T17:11:30Z'),
  ('cit-issue-2-C5-4', 'sec-issue-2-C5',
   'Anthropic, *Claude Sonnet 4.5*, 2025-09. . The 77.2% SWE-bench Verified figure is reported on the launch page as the primary score (200K...',
   'https://www.anthropic.com/news/claude-sonnet-4-5',
   'vendor-doc', '2026-05-23T17:11:30Z'),
  ('cit-issue-2-C5-5', 'sec-issue-2-C5',
   'Anthropic, *Claude Opus 4.5*, 2025-11-24. . The launch page frames Opus 4.5 as "state-of-the-art on tests of real-world software engineer...',
   'https://www.anthropic.com/news/claude-opus-4-5',
   'vendor-doc', '2026-05-23T17:11:30Z'),
  ('cit-issue-2-C5-6', 'sec-issue-2-C5',
   'Mialon, Fourrier, Swift, Wolf, LeCun, Scialom, *GAIA: A Benchmark for General AI Assistants*, arXiv 2311.12983, 2023-11-21. Leaderboard h...',
   'https://huggingface.co/spaces/gaia-benchmark/leaderboard',
   'paper', '2026-05-23T17:11:30Z'),
  ('cit-issue-2-C5-7', 'sec-issue-2-C5',
   'Chan, Chowdhury, Jaffe et al., *MLE-bench: Evaluating Machine Learning Agents on Machine Learning Engineering*, arXiv 2410.07095, 2024-10...',
   'https://github.com/openai/mle-bench',
   'paper', '2026-05-23T17:11:30Z'),
  ('cit-issue-2-C5-8', 'sec-issue-2-C5',
   'Terminal-Bench (Stanford × Laude Institute collaboration). Landing: . v2.0 current; v3.0 in development. First public leaderboard activit...',
   'https://www.tbench.ai/',
   'vendor-doc', '2026-05-23T17:11:30Z'),
  ('cit-issue-2-C5-9', 'sec-issue-2-C5',
   'Liu et al., *AgentBench: Evaluating LLMs as Agents*, ICLR 2024 (arXiv 2308.03688, 2023-08; v3 2025-10). Maintained by Tsinghua THUDM.',
   'https://www.tbench.ai/',
   'paper', '2026-05-23T17:11:30Z'),
  ('cit-issue-2-C5-10', 'sec-issue-2-C5',
   'SWE-MERA, *A Dynamic Benchmark for Agenticly Evaluating Large Language Models on Software Engineering Tasks*, arXiv 2507.11059, 2025. Abs...',
   'https://arxiv.org/abs/2507.11059',
   'paper', '2026-05-23T17:11:30Z'),
  ('cit-issue-2-C5-11', 'sec-issue-2-C5',
   'Wang et al., *UTBoost: Rigorous Evaluation of Coding Agents on SWE-Bench*, arXiv 2506.09289, 2025. Abstract: "We identified 36 task insta...',
   'https://arxiv.org/abs/2506.09289',
   'paper', '2026-05-23T17:11:30Z'),
  ('cit-issue-2-C5-12', 'sec-issue-2-C5',
   'SWE-bench-Live, arXiv 2505.23419, 2025. 1,319 tasks from real GitHub issues filed since 2024, scoped to resist contamination and scaling...',
   'https://www.tbench.ai/',
   'paper', '2026-05-23T17:11:30Z');
