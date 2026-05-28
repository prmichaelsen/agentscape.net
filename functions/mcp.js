// POST /mcp — Streamable-HTTP MCP server (protocol 2025-03-26).
//
// Surfaces the agent-consumer tools per
// design.agentscape-agent-consumer-surface-decomposition~70a0af01:
//   - get_latest_issue       — most recent issue, full sections + citations
//   - search_issues          — substring/FTS-ish match on title + frame
//   - get_longform_by_slug   — encyclopedia entry by slug (current version)
//   - list_topics            — spine_tags + category_tags (controlled vocab)
//
// Read-only. No auth on read. Responses are application/json; the optional
// streaming surface (text/event-stream) is not used — every tool returns a
// single JSON-RPC response.

const PROTOCOL_VERSION = "2025-03-26";
const SERVER_NAME = "agentscape.net";
const SERVER_VERSION = "0.1.0";

function jsonRpcResponse(id, result) {
  return new Response(
    JSON.stringify({ jsonrpc: "2.0", id, result }),
    {
      headers: {
        "content-type": "application/json; charset=utf-8",
        "cache-control": "no-store",
      },
      status: 200,
    },
  );
}

function jsonRpcError(id, code, message, data) {
  const err = { code, message };
  if (data !== undefined) err.data = data;
  return new Response(
    JSON.stringify({ jsonrpc: "2.0", id, error: err }),
    {
      headers: {
        "content-type": "application/json; charset=utf-8",
        "cache-control": "no-store",
      },
      status: 200,
    },
  );
}

// ----------------------------------------------------------------------
// Tool catalog — kept inline so the endpoint is one file with no imports.
// ----------------------------------------------------------------------

const TOOLS = [
  {
    name: "get_latest_issue",
    description:
      "Return the most recently published agentscape issue, including its sections, citations, and any longform bodies. No arguments.",
    inputSchema: {
      type: "object",
      properties: {},
      additionalProperties: false,
    },
  },
  {
    name: "search_issues",
    description:
      "Substring-search issues by title or by section frame/structural argument. Returns the matching issues with the matching section IDs. Use for 'has agentscape covered X?' style queries.",
    inputSchema: {
      type: "object",
      properties: {
        query: {
          type: "string",
          description:
            "Free text. Matched case-insensitively against issue titles, section frames, and structural arguments.",
          minLength: 1,
          maxLength: 200,
        },
      },
      required: ["query"],
      additionalProperties: false,
    },
  },
  {
    name: "get_longform_by_slug",
    description:
      "Return the current published version of an encyclopedia (longform) entry by slug. The /c/<slug> surface in JSON form. Slug is the URL path component, e.g. 'agent', 'tool', 'loop'.",
    inputSchema: {
      type: "object",
      properties: {
        slug: {
          type: "string",
          description: "Entry slug, e.g. 'agent'.",
          minLength: 1,
          maxLength: 120,
          pattern: "^[a-z0-9][a-z0-9-]*$",
        },
      },
      required: ["slug"],
      additionalProperties: false,
    },
  },
  {
    name: "list_topics",
    description:
      "List agentscape's controlled-vocabulary tags. Returns two arrays: spine_tags (sub-question targets) and category_tags (piece type). These are the substrate for 'topic' filtering across the archive.",
    inputSchema: {
      type: "object",
      properties: {},
      additionalProperties: false,
    },
  },
];

// ----------------------------------------------------------------------
// Tool implementations
// ----------------------------------------------------------------------

async function toolGetLatestIssue(env) {
  const issue = await env.DB.prepare(
    `SELECT id, issue_number, slug, title, publish_date, masthead_state, archive_flag, created_at
       FROM issues
      WHERE deleted_at IS NULL
      ORDER BY issue_number DESC
      LIMIT 1`,
  ).first();
  if (!issue) {
    return { issue: null, sections: [] };
  }
  const { results: sections } = await env.DB.prepare(
    `SELECT
        s.id, s.section_id, s.title, s.frame, s.structural_argument,
        s.published_at, s.version,
        spine.slug AS spine_tag, spine.label AS spine_label,
        cat.slug   AS category_tag, cat.label AS category_label,
        lf.id AS longform_id, lf.slug AS longform_slug, lf.body AS body
      FROM sections s
      JOIN spine_tags    spine ON s.spine_tag_id    = spine.id
      JOIN category_tags cat   ON s.category_tag_id = cat.id
      LEFT JOIN longform lf    ON s.longform_id     = lf.id
      WHERE s.issue_id = ?
        AND s.deleted_at IS NULL
        AND s.superseded_by_id IS NULL
      ORDER BY s.section_id ASC`,
  )
    .bind(issue.id)
    .all();

  const sectionIds = sections.map((s) => s.id);
  let citations = [];
  if (sectionIds.length) {
    const placeholders = sectionIds.map(() => "?").join(",");
    const cr = await env.DB.prepare(
      `SELECT id, section_id, label, url, archive_url, kind, verified_at
         FROM citations
        WHERE section_id IN (${placeholders})
          AND deleted_at IS NULL
        ORDER BY id`,
    )
      .bind(...sectionIds)
      .all();
    citations = cr.results;
  }

  return {
    issue: {
      id: issue.id,
      issue_number: issue.issue_number,
      slug: issue.slug,
      title: issue.title,
      publish_date: issue.publish_date,
      masthead_state: issue.masthead_state,
      archive_flag: !!issue.archive_flag,
      created_at: issue.created_at,
      canonical_url: `https://agentscape.net/issues/${issue.issue_number}`,
    },
    sections: sections.map((s) => ({
      id: s.id,
      section_id: s.section_id,
      title: s.title,
      frame: s.frame,
      structural_argument: s.structural_argument,
      spine_tag: s.spine_tag,
      spine_label: s.spine_label,
      category_tag: s.category_tag,
      category_label: s.category_label,
      version: s.version,
      published_at: s.published_at,
      longform: s.longform_id
        ? {
            id: s.longform_id,
            slug: s.longform_slug,
            body: s.body,
            canonical_url: `https://agentscape.net/c/${s.longform_slug}`,
          }
        : null,
      citations: citations
        .filter((c) => c.section_id === s.id)
        .map((c) => ({
          id: c.id,
          label: c.label,
          url: c.url,
          archive_url: c.archive_url,
          kind: c.kind,
          verified_at: c.verified_at,
        })),
    })),
  };
}

async function toolSearchIssues(env, args) {
  const q = (args && typeof args.query === "string" ? args.query : "").trim();
  if (!q) {
    throw { code: -32602, message: "search_issues: 'query' must be non-empty string" };
  }
  const like = `%${q}%`;

  // Match issues whose title contains q OR which contain a section matching q.
  const { results: titleHits } = await env.DB.prepare(
    `SELECT id, issue_number, slug, title, publish_date, masthead_state
       FROM issues
      WHERE deleted_at IS NULL AND title LIKE ? COLLATE NOCASE
      ORDER BY issue_number DESC`,
  )
    .bind(like)
    .all();

  const { results: sectionHits } = await env.DB.prepare(
    `SELECT
        i.id AS issue_id, i.issue_number, i.slug AS issue_slug, i.title AS issue_title,
        i.publish_date, i.masthead_state,
        s.section_id, s.title AS section_title, s.frame, s.structural_argument
       FROM sections s
       JOIN issues i ON s.issue_id = i.id
      WHERE s.deleted_at IS NULL
        AND s.superseded_by_id IS NULL
        AND i.deleted_at IS NULL
        AND ( s.title LIKE ? COLLATE NOCASE
           OR s.frame LIKE ? COLLATE NOCASE
           OR s.structural_argument LIKE ? COLLATE NOCASE )
      ORDER BY i.issue_number DESC, s.section_id ASC`,
  )
    .bind(like, like, like)
    .all();

  // Build issue-level grouping.
  const byIssue = new Map();
  for (const i of titleHits) {
    byIssue.set(i.id, {
      issue_number: i.issue_number,
      slug: i.slug,
      title: i.title,
      publish_date: i.publish_date,
      masthead_state: i.masthead_state,
      canonical_url: `https://agentscape.net/issues/${i.issue_number}`,
      matched_in: ["title"],
      matched_sections: [],
    });
  }
  for (const s of sectionHits) {
    if (!byIssue.has(s.issue_id)) {
      byIssue.set(s.issue_id, {
        issue_number: s.issue_number,
        slug: s.issue_slug,
        title: s.issue_title,
        publish_date: s.publish_date,
        masthead_state: s.masthead_state,
        canonical_url: `https://agentscape.net/issues/${s.issue_number}`,
        matched_in: ["section"],
        matched_sections: [],
      });
    } else if (!byIssue.get(s.issue_id).matched_in.includes("section")) {
      byIssue.get(s.issue_id).matched_in.push("section");
    }
    byIssue.get(s.issue_id).matched_sections.push({
      section_id: s.section_id,
      title: s.section_title,
      frame: s.frame,
    });
  }

  return {
    query: q,
    count: byIssue.size,
    issues: Array.from(byIssue.values()).sort(
      (a, b) => b.issue_number - a.issue_number,
    ),
  };
}

async function toolGetLongformBySlug(env, args) {
  const slug = args && typeof args.slug === "string" ? args.slug.trim() : "";
  if (!slug || !/^[a-z0-9][a-z0-9-]*$/.test(slug)) {
    throw { code: -32602, message: "get_longform_by_slug: 'slug' must match ^[a-z0-9][a-z0-9-]*$" };
  }
  const entry = await env.DB.prepare(
    `SELECT * FROM entries
       WHERE slug = ?
         AND superseded_by_id IS NULL
         AND deleted_at IS NULL
       LIMIT 1`,
  )
    .bind(slug)
    .first();
  if (!entry) {
    return { entry: null };
  }
  const { results: related } = await env.DB.prepare(
    `SELECT to_slug AS slug FROM entry_related WHERE from_slug = ? ORDER BY to_slug`,
  )
    .bind(slug)
    .all();
  return {
    entry: {
      id: entry.id,
      slug: entry.slug,
      title: entry.title,
      content_hash: entry.content_hash,
      version: entry.version,
      state: entry.state,
      published_at: entry.published_at,
      created_at: entry.created_at,
      definition: entry.definition,
      first_appearance: entry.first_appearance,
      etymology: entry.etymology,
      current_meaning: entry.current_meaning,
      divergent_meanings: entry.divergent_meanings,
      supersession_note: entry.supersession_note,
      canonical_url: `https://agentscape.net/c/${entry.slug}`,
    },
    related: related.map((r) => r.slug),
  };
}

async function toolListTopics(env) {
  const { results: spine } = await env.DB.prepare(
    `SELECT slug, label, description FROM spine_tags ORDER BY slug`,
  ).all();
  const { results: category } = await env.DB.prepare(
    `SELECT slug, label, description FROM category_tags ORDER BY slug`,
  ).all();
  return {
    note:
      "Agentscape's 'topics' substrate is two controlled vocabularies. spine_tags are the sub-questions a section advances; category_tags are the piece type. The /api/v1/topics/ surface is not yet shipped — this tool is the current way to enumerate them.",
    spine_tags: spine,
    category_tags: category,
  };
}

// ----------------------------------------------------------------------
// JSON-RPC dispatch
// ----------------------------------------------------------------------

async function dispatch(env, req) {
  const { jsonrpc, id, method, params } = req || {};
  if (jsonrpc !== "2.0") {
    return jsonRpcError(id ?? null, -32600, "Invalid Request: jsonrpc must be '2.0'");
  }
  try {
    if (method === "initialize") {
      return jsonRpcResponse(id, {
        protocolVersion: PROTOCOL_VERSION,
        capabilities: {
          tools: { listChanged: false },
        },
        serverInfo: { name: SERVER_NAME, version: SERVER_VERSION },
        instructions:
          "Agentscape is a publication on the agentic landscape. Use list_topics to discover controlled-vocabulary tags. Use get_latest_issue for the most recent issue. Use search_issues to check archive coverage of a topic. Use get_longform_by_slug to fetch an encyclopedia entry.",
      });
    }
    if (method === "notifications/initialized") {
      // Per MCP, notifications have no response.
      return new Response(null, { status: 202 });
    }
    if (method === "tools/list") {
      return jsonRpcResponse(id, { tools: TOOLS });
    }
    if (method === "tools/call") {
      const name = params?.name;
      const args = params?.arguments || {};
      let result;
      if (name === "get_latest_issue") {
        result = await toolGetLatestIssue(env);
      } else if (name === "search_issues") {
        result = await toolSearchIssues(env, args);
      } else if (name === "get_longform_by_slug") {
        result = await toolGetLongformBySlug(env, args);
      } else if (name === "list_topics") {
        result = await toolListTopics(env);
      } else {
        return jsonRpcError(id, -32601, `Unknown tool: ${name}`);
      }
      // MCP tool-call result envelope: content[] with type 'text'.
      return jsonRpcResponse(id, {
        content: [
          {
            type: "text",
            text: JSON.stringify(result, null, 2),
          },
        ],
        isError: false,
      });
    }
    if (method === "ping") {
      return jsonRpcResponse(id, {});
    }
    return jsonRpcError(id, -32601, `Method not found: ${method}`);
  } catch (e) {
    if (e && typeof e === "object" && typeof e.code === "number") {
      return jsonRpcError(id, e.code, e.message, e.data);
    }
    return jsonRpcError(id, -32603, `Internal error: ${e && e.message ? e.message : String(e)}`);
  }
}

export async function onRequestPost(context) {
  const { request, env } = context;
  let body;
  try {
    body = await request.json();
  } catch (e) {
    return jsonRpcError(null, -32700, "Parse error: invalid JSON");
  }
  return dispatch(env, body);
}

export async function onRequestGet() {
  // Discovery / probe. Tells a human-curious visitor and a probing client
  // that this is the MCP endpoint, expects POST with JSON-RPC.
  return new Response(
    JSON.stringify(
      {
        endpoint: "agentscape.net/mcp",
        protocol: "MCP Streamable HTTP",
        protocolVersion: PROTOCOL_VERSION,
        serverInfo: { name: SERVER_NAME, version: SERVER_VERSION },
        usage:
          "POST JSON-RPC 2.0 envelopes to this URL. Start with method='initialize', then 'tools/list', then 'tools/call' with name + arguments.",
        tools: TOOLS.map((t) => ({ name: t.name, description: t.description })),
      },
      null,
      2,
    ),
    {
      headers: {
        "content-type": "application/json; charset=utf-8",
        "cache-control": "public, max-age=300",
      },
      status: 200,
    },
  );
}

export async function onRequestOptions() {
  // CORS preflight — MCP clients may run in browsers.
  return new Response(null, {
    status: 204,
    headers: {
      "access-control-allow-origin": "*",
      "access-control-allow-methods": "GET, POST, OPTIONS",
      "access-control-allow-headers": "content-type, mcp-session-id",
      "access-control-max-age": "86400",
    },
  });
}
