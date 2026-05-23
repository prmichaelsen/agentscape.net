-- 0013-coi-8-reciprocity-pass.sql
--
-- COI #8 §6 reciprocity pass. Resolves 11 cross-link asymmetries
-- across the 8 voice-passed COI entries (agent, tool, skill,
-- prompt, permission, mcp, rfc, autonomy). Per-pair editorial
-- decision: reciprocate (add missing-side row), prune (delete
-- outbound row), or leave as-is.
--
-- Source commission: agentscape-editor followup
-- 2026-05-23T18-06-04Z-coi-8-section-6-reciprocity-pass.md
-- Source audit: agentscape-desk followup
-- 2026-05-23T18-05-04Z-coi-8-section-6-cross-link-audit.md
--
-- Decisions (per pair, asymmetry number from the commission):
--  1. agent→skill / +skill→agent ............... reciprocate
--  2. prompt→agent / +agent→prompt ............. reciprocate
--  3. mcp→agent / +agent→mcp ................... reciprocate
--  4. prompt→tool / -prompt→tool ............... prune
--  5. prompt→skill / +skill→prompt ............. reciprocate
--  6. prompt↔permission (both missing) ......... leave as-is
--  7. mcp→prompt / +prompt→mcp ................. reciprocate
--  8. rfc→permission / +permission→rfc ......... reciprocate
--  9. mcp↔autonomy (both missing) .............. leave as-is
-- 10. autonomy→rfc / +rfc→autonomy ............. reciprocate
-- 11. prompt↔autonomy (both missing) ........... leave as-is
--
-- Rationale per editorial frame: reciprocate where the inbound
-- reference names a defining relation for both sides; prune where
-- the outbound is incidental from the source side; leave-as-is
-- where neither direction is load-bearing for either entry's
-- defining-neighbor set.

-- ---------------------------------------------------------------
-- Reciprocations
-- ---------------------------------------------------------------

-- 1. skill → agent (skill exists to give agents capability)
INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at)
  VALUES ('b1bdf566-5aed-47ca-aee4-b03fc1efb3b5', 'skill', 'agent', '2026-05-23T18:06:30Z');

-- 2. agent → prompt (agents are configured by prompts)
INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at)
  VALUES ('3b4801fd-52b7-48e8-9798-66eda92ed0ba', 'agent', 'prompt', '2026-05-23T18:06:30Z');

-- 3. agent → mcp (MCP is a defining tool-extension protocol for agents)
INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at)
  VALUES ('a37e82ea-f965-4302-a333-bff2f7170e33', 'agent', 'mcp', '2026-05-23T18:06:30Z');

-- 5. skill → prompt (skills package prompts as a primary primitive)
INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at)
  VALUES ('6e211348-122c-4624-bc14-47792be52827', 'skill', 'prompt', '2026-05-23T18:06:30Z');

-- 7. prompt → mcp (MCP defines prompts as one of three primitives;
-- the prompt entry references MCP as a primary delivery surface)
INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at)
  VALUES ('940bdb10-ab3b-491c-87a4-a6c51efb07da', 'prompt', 'mcp', '2026-05-23T18:06:30Z');

-- 8. permission → rfc (agent-permission models are increasingly
-- governed by content-addressed RFCs; the relation is defining
-- from permission's side as standards emerge)
INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at)
  VALUES ('dc02797a-9d8a-496a-bfd1-2e399fde29f9', 'permission', 'rfc', '2026-05-23T18:06:30Z');

-- 10. rfc → autonomy (autonomy is among the load-bearing topics
-- RFC processes address in the agent-standards space)
INSERT OR IGNORE INTO entry_related (id, from_slug, to_slug, approved_at)
  VALUES ('4d45ddab-b2e2-416b-a2b9-28039c0ee3a3', 'rfc', 'autonomy', '2026-05-23T18:06:30Z');

-- ---------------------------------------------------------------
-- Prunes
-- ---------------------------------------------------------------

-- 4. delete prompt → tool (tool's defining neighbors are agent,
-- mcp, skill, permission; prompt is incidental from tool's side)
DELETE FROM entry_related WHERE from_slug = 'prompt' AND to_slug = 'tool';

-- ---------------------------------------------------------------
-- Leave-as-is decisions (no SQL): pairs 6, 9, 11
-- ---------------------------------------------------------------
-- 6. prompt ↔ permission: not defining for either entry; relation
--    mediated by tool, not direct.
-- 9. mcp ↔ autonomy: indirect — MCP extends capability; autonomy
--    is an operational mode. No defining edge.
-- 11. prompt ↔ autonomy: prompt is configuration; autonomy is
--     operational mode. Not direct neighbors.
