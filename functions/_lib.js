// Shared helpers for agentscape Pages Functions.
// Reads from the D1 binding `DB` (declared in wrangler.toml).

// SECURITY/DISCIPLINE: this module renders HTML by string concatenation.
// All untrusted inputs (anything derived from D1 or query params) MUST be
// run through htmlEscape() before interpolation. The longform body is
// passed through a minimal markdown renderer that itself escapes.

export function htmlEscape(s) {
  if (s === null || s === undefined) return "";
  return String(s)
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
    .replace(/"/g, "&quot;")
    .replace(/'/g, "&#39;");
}

// Minimal CommonMark-ish renderer. Handles headings, paragraphs,
// blockquotes, bullet lists, fenced/inline code, links, bold, italic,
// horizontal rules, and hard line breaks. Sufficient for editor-stamped
// section bodies; not a full CommonMark implementation.
export function renderMarkdown(md) {
  const lines = md.replace(/\r\n/g, "\n").split("\n");
  const out = [];
  let i = 0;
  let inList = false;
  let inPara = [];

  function flushPara() {
    if (inPara.length) {
      out.push("<p>" + renderInline(inPara.join(" ")) + "</p>");
      inPara = [];
    }
  }
  function closeList() {
    if (inList) {
      out.push("</ul>");
      inList = false;
    }
  }

  while (i < lines.length) {
    const ln = lines[i];

    // Fenced code
    if (/^```/.test(ln)) {
      flushPara();
      closeList();
      i++;
      const buf = [];
      while (i < lines.length && !/^```/.test(lines[i])) {
        buf.push(htmlEscape(lines[i]));
        i++;
      }
      i++; // consume closing fence
      out.push("<pre><code>" + buf.join("\n") + "</code></pre>");
      continue;
    }

    // Blank line — paragraph break
    if (/^\s*$/.test(ln)) {
      flushPara();
      closeList();
      i++;
      continue;
    }

    // Horizontal rule
    if (/^---+\s*$/.test(ln)) {
      flushPara();
      closeList();
      out.push("<hr />");
      i++;
      continue;
    }

    // Headings
    const h = ln.match(/^(#{1,6})\s+(.*)$/);
    if (h) {
      flushPara();
      closeList();
      const level = h[1].length;
      out.push(`<h${level}>${renderInline(h[2])}</h${level}>`);
      i++;
      continue;
    }

    // Blockquote
    if (/^>\s?/.test(ln)) {
      flushPara();
      closeList();
      const buf = [];
      while (i < lines.length && /^>\s?/.test(lines[i])) {
        buf.push(lines[i].replace(/^>\s?/, ""));
        i++;
      }
      out.push("<blockquote>" + renderInline(buf.join(" ")) + "</blockquote>");
      continue;
    }

    // Bullet list
    if (/^[-*]\s+/.test(ln)) {
      flushPara();
      if (!inList) {
        out.push("<ul>");
        inList = true;
      }
      const item = ln.replace(/^[-*]\s+/, "");
      out.push("<li>" + renderInline(item) + "</li>");
      i++;
      continue;
    }

    // Paragraph accumulation
    closeList();
    inPara.push(ln);
    i++;
  }
  flushPara();
  closeList();
  return out.join("\n");
}

function renderInline(s) {
  // Escape first, then re-introduce specific structural patterns.
  let out = htmlEscape(s);
  // Links: [text](url)
  out = out.replace(
    /\[([^\]]+)\]\(([^)\s]+)\)/g,
    (_m, t, u) => `<a href="${u}">${t}</a>`
  );
  // Bold **text**
  out = out.replace(/\*\*([^*]+)\*\*/g, "<strong>$1</strong>");
  // Italic *text* (avoid matching ** by requiring non-* boundaries)
  out = out.replace(/(^|[^*])\*([^*\n]+)\*(?!\*)/g, "$1<em>$2</em>");
  // Inline code `code`
  out = out.replace(/`([^`]+)`/g, "<code>$1</code>");
  return out;
}

export function layoutHtml({ title, description, body, canonical }) {
  const t = htmlEscape(title);
  const d = htmlEscape(description || "");
  const c = canonical ? `<link rel="canonical" href="${htmlEscape(canonical)}" />` : "";
  return `<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>${t}</title>
  <meta name="description" content="${d}" />
  <meta property="og:title" content="${t}" />
  <meta property="og:description" content="${d}" />
  ${c}
  <style>
    :root {
      color-scheme: light dark;
      --fg: #111827; --muted: #4b5563; --bg: #ffffff; --rule: #e5e7eb;
      --accent: #2563eb; --accent-strong: #1d4ed8;
    }
    @media (prefers-color-scheme: dark) {
      :root { --fg:#e5e7eb; --muted:#9ca3af; --bg:#0b1220; --rule:#1f2937;
              --accent:#60a5fa; --accent-strong:#93c5fd; }
    }
    html, body { margin:0; padding:0; background:var(--bg); color:var(--fg);
      font: 16px/1.6 ui-serif, Georgia, "Iowan Old Style", "Apple Garamond", serif; }
    main { max-width: 42rem; margin: 0 auto; padding: 3rem 1.5rem 5rem; }
    header.masthead { border-bottom: 1px solid var(--rule); padding-bottom:1rem; margin-bottom:2rem; }
    header.masthead a { color:var(--accent); font-weight:600; letter-spacing:-0.01em; text-decoration:none; }
    header.masthead .issue { color:var(--muted); font-style:italic; font-size:0.9rem; }
    h1 { font-size: 1.85rem; font-weight: 600; letter-spacing:-0.015em; line-height:1.2; margin: 0 0 0.5rem; color:var(--fg); }
    h2 { font-size: 1.2rem; margin-top: 2.5rem; color:var(--accent); }
    h3 { font-size: 1.05rem; margin-top: 1.75rem; color:var(--fg); }
    p, ul, ol { margin: 0 0 1.1rem; }
    blockquote { border-left: 3px solid var(--accent); padding-left: 0.9rem; color:var(--muted); margin: 0 0 1.1rem; font-style: italic; }
    a { color: var(--accent); }
    a:hover { color: var(--accent-strong); text-decoration: underline; }
    .spine-anchor { display:inline-block; font-size:0.78rem; letter-spacing:0.04em; text-transform:uppercase; color:var(--muted); border:1px solid var(--rule); padding:0.1rem 0.5rem; border-radius:999px; margin-bottom:0.75rem; }
    .frame { color:var(--muted); font-style:italic; margin: 0 0 1.5rem; }
    .section-divider { margin: 3rem 0; border:none; border-top:1px solid var(--rule); }
    .sources { font-size:0.95rem; color:var(--muted); }
    .sources a { color:var(--accent); }
    .coi { font-size:0.92rem; color:var(--muted); border-top:1px solid var(--rule); margin-top:2rem; padding-top:1rem; }
    pre, code { font-family: ui-monospace, SFMono-Regular, Menlo, monospace; font-size: 0.92em; }
    pre { background: rgba(0,0,0,0.04); padding: 0.75rem 1rem; border-radius: 0.4rem; overflow-x:auto; }
    @media (prefers-color-scheme: dark) {
      pre { background: rgba(255,255,255,0.06); }
    }
  </style>
</head>
<body>
  <main>
    <header class="masthead">
      <a href="/">agentscape.net</a>
      <div class="issue">assessing the agentic landscape</div>
    </header>
    ${body}
  </main>
</body>
</html>`;
}

export function jsonResponse(obj, init = {}) {
  return new Response(JSON.stringify(obj, null, 2), {
    headers: {
      "content-type": "application/json; charset=utf-8",
      "cache-control": "public, max-age=60",
      ...(init.headers || {}),
    },
    status: init.status || 200,
  });
}

export function htmlResponse(html, init = {}) {
  return new Response(html, {
    headers: {
      "content-type": "text/html; charset=utf-8",
      "cache-control": "public, max-age=60",
      ...(init.headers || {}),
    },
    status: init.status || 200,
  });
}
