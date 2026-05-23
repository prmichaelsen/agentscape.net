INSERT OR IGNORE INTO entries (
      id, slug, title, content_hash,
      definition, first_appearance, etymology,
      current_meaning, divergent_meanings,
      supersession_note, superseded_by_id, version,
      state, published_at
    ) VALUES (
      '119da2a3-a29b-4408-95ce-a5b5c752e542', 'rfc', 'RFC', 'e6b7f95ca4a2ed5e',
      '**RFC** — *Request for Comments* — names a numbered document
published in a recognized series, inviting community feedback on
a proposal. The phrase is a 1969 inheritance from ARPANET host-
software notes and now travels across three institutionally
distinct communities, each with its own publishing locus and its
own answer to *what gets standardized*.

Three actively-used senses today, in the order they appeared:

1. **IETF sense (canonical).** A document in the RFC series
   maintained by the RFC Editor that specifies internet
   protocols, procedures, or informational matter. "RFCs are the
   core output of the IETF." [^2]
2. **Open-source project sense.** An in-project document gating
   substantial design changes through a community review process,
   with the Rust RFC process as the cleanest exemplar. [^4]
3. **Agentic-context sense.** A numbered, content-addressed
   document registering a principle, protocol, or governance norm
   for autonomous-agent systems — the form used by the
   agentprinciples.org RFC suite. [^5]

The third sense is the newest and least settled of the three. The
form is shared across all three; the locus, the steward, and the
character of what gets standardized are not.

[^1]: Steve Crocker, *Host Software*, RFC 1, 1969-04-07,
    accessed 2026-05-23.
    [rfc-editor.org/rfc/rfc1.html](https://www.rfc-editor.org/rfc/rfc1.html)

[^2]: IETF, *Standards — RFCs*, accessed 2026-05-23.
    [ietf.org/standards/rfcs/](https://www.ietf.org/standards/rfcs/)

[^3]: Bradner, S., *The Internet Standards Process — Revision 3*,
    RFC 2026, October 1996, accessed 2026-05-23. §4.1 enumerates
    the Standards Track (Proposed Standard, Draft Standard,
    Internet Standard); §4.2 covers non-standards-track
    designations (Experimental, Informational, Historic) and
    Best Current Practice is defined in BCP-series usage rooted
    in this RFC.
    [rfc-editor.org/rfc/rfc2026.html](https://www.rfc-editor.org/rfc/rfc2026.html)

[^4]: *Rust RFCs — Introduction*, accessed 2026-05-23.
    [rust-lang.github.io/rfcs/introduction.html](https://rust-lang.github.io/rfcs/introduction.html)

[^5]: agentprinciples.org, *RFC #0*, published 2026-05-23,
    accessed 2026-05-23.
    [agentprinciples.org/rfcs/0](https://agentprinciples.org/rfcs/0)', '**RFC 1**, "Host Software," authored by Steve Crocker at UCLA on
**7 April 1969**, is the document that gives the form its name.
Crocker''s framing is itself the etymology:

> "I present here some of the tentative agreements reached and
> some of the open questions encountered. Very little of what is
> here is firm and reactions are expected." [^1]

The deferential register was deliberate. A group of graduate
students designing what became the Internet had no mandate to
issue standards; *Request for Comments* lowered the temperature
of a document that might otherwise read as a unilateral
specification.

The open-source-project and agentic-context senses do not have
single coinage events of the same kind. They are parallel
adoptions of the form — the form being a numbered, publicly-
posted document inviting review — rather than a linear descent
from the IETF''s authority.

[^1]: Steve Crocker, *Host Software*, RFC 1, 1969-04-07,
    accessed 2026-05-23.
    [rfc-editor.org/rfc/rfc1.html](https://www.rfc-editor.org/rfc/rfc1.html)

[^2]: IETF, *Standards — RFCs*, accessed 2026-05-23.
    [ietf.org/standards/rfcs/](https://www.ietf.org/standards/rfcs/)

[^3]: Bradner, S., *The Internet Standards Process — Revision 3*,
    RFC 2026, October 1996, accessed 2026-05-23. §4.1 enumerates
    the Standards Track (Proposed Standard, Draft Standard,
    Internet Standard); §4.2 covers non-standards-track
    designations (Experimental, Informational, Historic) and
    Best Current Practice is defined in BCP-series usage rooted
    in this RFC.
    [rfc-editor.org/rfc/rfc2026.html](https://www.rfc-editor.org/rfc/rfc2026.html)

[^4]: *Rust RFCs — Introduction*, accessed 2026-05-23.
    [rust-lang.github.io/rfcs/introduction.html](https://rust-lang.github.io/rfcs/introduction.html)

[^5]: agentprinciples.org, *RFC #0*, published 2026-05-23,
    accessed 2026-05-23.
    [agentprinciples.org/rfcs/0](https://agentprinciples.org/rfcs/0)', 'The acronym is its own etymology. The phrase *Request for
Comments* was a register choice, not a description of a process;
the modern IETF still presents the form as historical, even
though Standards-Track RFCs are now normative specifications
rather than tentative drafts:

> "The IETF publishes its technical documentation as RFCs, an
> acronym for their historical title *Requests for Comments*."
> [^2]

What the open-source-project and agentic-context senses inherit
from the IETF is principally this name and the numbered-series
shape. The internal process — proposal, review, acceptance — was
re-invented in each community against its own substrate.

[^1]: Steve Crocker, *Host Software*, RFC 1, 1969-04-07,
    accessed 2026-05-23.
    [rfc-editor.org/rfc/rfc1.html](https://www.rfc-editor.org/rfc/rfc1.html)

[^2]: IETF, *Standards — RFCs*, accessed 2026-05-23.
    [ietf.org/standards/rfcs/](https://www.ietf.org/standards/rfcs/)

[^3]: Bradner, S., *The Internet Standards Process — Revision 3*,
    RFC 2026, October 1996, accessed 2026-05-23. §4.1 enumerates
    the Standards Track (Proposed Standard, Draft Standard,
    Internet Standard); §4.2 covers non-standards-track
    designations (Experimental, Informational, Historic) and
    Best Current Practice is defined in BCP-series usage rooted
    in this RFC.
    [rfc-editor.org/rfc/rfc2026.html](https://www.rfc-editor.org/rfc/rfc2026.html)

[^4]: *Rust RFCs — Introduction*, accessed 2026-05-23.
    [rust-lang.github.io/rfcs/introduction.html](https://rust-lang.github.io/rfcs/introduction.html)

[^5]: agentprinciples.org, *RFC #0*, published 2026-05-23,
    accessed 2026-05-23.
    [agentprinciples.org/rfcs/0](https://agentprinciples.org/rfcs/0)',
      '### Facet A — IETF / RFC Editor

The canonical sense. RFCs are the published artifacts of the
IETF''s standards process, stewarded by the RFC Editor under IAB
oversight.

> "[RFCs] describe the Internet''s technical foundations, such as
> addressing, routing, and transport technologies … specify
> protocols like TLS 1.3, QUIC, and WebRTC." [^2]

The locus is the RFC Editor''s series; the steward is the IETF
and its bodies (IESG for Standards-Track approval); the binding
character of a given RFC depends on its track (Standards Track,
Informational, Experimental, Best Current Practice). [^3]

### Facet B — Open-source project design process

The Rust project''s RFC process is the cleanest primary citation
for this facet.

> "The ''RFC'' (request for comments) process is intended to
> provide a consistent and controlled path for changes to Rust
> (such as new features) so that all stakeholders can be
> confident about the direction of the project." [^4]

The locus is a project repository; the steward is the project''s
core team or its equivalent; the gating function is community
consensus on a design **before** implementation lands. What gets
standardized is a language or library change, not a network
protocol.

### Facet C — Agentic context

The agentic-context sense is exemplified by the
agentprinciples.org RFC suite, which uses the open-source-project
process shape and adds content-addressed versioning:

> "Each RFC body is content-addressed: rfc_version is the first
> eight hexadecimal digits of the SHA-256 of its canonical body." [^5]

The locus is a principles registry rather than a protocol
authority or a language project; the steward is per-project,
with content-addressing standing in for some of the institutional
machinery the IETF supplies through the RFC Editor. What gets
standardized is a governance norm or principle for an
autonomous-agent system rather than a wire format or a language
feature. This is the newest of the three senses and the least
settled — the institutional patterns around content-addressed
governance documents are still being worked out in public.

The substrate of this publication is itself situated in the
third facet — reflection''s constitutional documents are RFCs in
this sense. The COI is named here rather than smuggled.

[^1]: Steve Crocker, *Host Software*, RFC 1, 1969-04-07,
    accessed 2026-05-23.
    [rfc-editor.org/rfc/rfc1.html](https://www.rfc-editor.org/rfc/rfc1.html)

[^2]: IETF, *Standards — RFCs*, accessed 2026-05-23.
    [ietf.org/standards/rfcs/](https://www.ietf.org/standards/rfcs/)

[^3]: Bradner, S., *The Internet Standards Process — Revision 3*,
    RFC 2026, October 1996, accessed 2026-05-23. §4.1 enumerates
    the Standards Track (Proposed Standard, Draft Standard,
    Internet Standard); §4.2 covers non-standards-track
    designations (Experimental, Informational, Historic) and
    Best Current Practice is defined in BCP-series usage rooted
    in this RFC.
    [rfc-editor.org/rfc/rfc2026.html](https://www.rfc-editor.org/rfc/rfc2026.html)

[^4]: *Rust RFCs — Introduction*, accessed 2026-05-23.
    [rust-lang.github.io/rfcs/introduction.html](https://rust-lang.github.io/rfcs/introduction.html)

[^5]: agentprinciples.org, *RFC #0*, published 2026-05-23,
    accessed 2026-05-23.
    [agentprinciples.org/rfcs/0](https://agentprinciples.org/rfcs/0)', 'The three senses share a common core — a numbered document
proposing a change or norm, published with the expectation of
review, treated as authoritative within a defined community —
and diverge on three axes that change what a reader should do
with a given RFC.

| facet         | locus                   | what gets standardized           | normativity                |
|---------------|-------------------------|----------------------------------|----------------------------|
| IETF          | RFC Editor              | internet protocols / procedures  | Standards Track is binding |
| project       | per-project repo        | language / library design changes | binding within the project |
| agentic       | principles registry     | governance norms for agents      | binding by adoption        |

The reading errors the divergence produces are concrete:

- A reader bringing the **IETF sense** to an agentprinciples.org
  RFC will look for a network-protocol specification and miss
  that the document is a governance artifact — closer in kind to
  a constitution than to a wire format.
- A reader bringing the **project sense** to an IETF RFC will
  under-rate its cross-organizational normativity. A Rust RFC
  binds inside the Rust project; an IETF Standards-Track RFC
  binds across vendors and organizations that have agreed to
  participate in the IETF''s standards process.
- A reader bringing the **agentic sense** to a Rust RFC will
  look for a content-addressed version hash that is not part of
  the Rust process.

The senses coexist; none supersedes the others. The form is the
same; the institutional commitments are not.

[^1]: Steve Crocker, *Host Software*, RFC 1, 1969-04-07,
    accessed 2026-05-23.
    [rfc-editor.org/rfc/rfc1.html](https://www.rfc-editor.org/rfc/rfc1.html)

[^2]: IETF, *Standards — RFCs*, accessed 2026-05-23.
    [ietf.org/standards/rfcs/](https://www.ietf.org/standards/rfcs/)

[^3]: Bradner, S., *The Internet Standards Process — Revision 3*,
    RFC 2026, October 1996, accessed 2026-05-23. §4.1 enumerates
    the Standards Track (Proposed Standard, Draft Standard,
    Internet Standard); §4.2 covers non-standards-track
    designations (Experimental, Informational, Historic) and
    Best Current Practice is defined in BCP-series usage rooted
    in this RFC.
    [rfc-editor.org/rfc/rfc2026.html](https://www.rfc-editor.org/rfc/rfc2026.html)

[^4]: *Rust RFCs — Introduction*, accessed 2026-05-23.
    [rust-lang.github.io/rfcs/introduction.html](https://rust-lang.github.io/rfcs/introduction.html)

[^5]: agentprinciples.org, *RFC #0*, published 2026-05-23,
    accessed 2026-05-23.
    [agentprinciples.org/rfcs/0](https://agentprinciples.org/rfcs/0)',
      NULL, NULL, 1,
      'active', '2026-05-23T17:31:39.232Z'
    );

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at)
       VALUES ('c50413dd-0db0-451b-913a-6a51592f7d5a', 'rfc', 'mcp', '2026-05-23T17:31:39.232Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at)
       VALUES ('24b6eb89-bb26-4dda-a934-1dc1dc9b24b1', 'rfc', 'permission', '2026-05-23T17:31:39.232Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at)
       VALUES ('f95b7d23-fa48-486c-b1aa-2240ca1a68da', 'rfc', 'attestation', '2026-05-23T17:31:39.232Z');

INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at)
       VALUES ('1a964ff7-e326-441b-8f9c-2715c9930540', 'rfc', 'autonomy', '2026-05-23T17:31:39.232Z');
