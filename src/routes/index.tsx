import { createFileRoute } from "@tanstack/react-router";

export const Route = createFileRoute("/")({
  component: Home,
});

function Home() {
  // Placeholder until issue #1 lands. Date is the bootstrap date,
  // not the publish date.
  const firstIssueDate = "first issue: forthcoming";
  return (
    <main
      style={{
        fontFamily: "system-ui, -apple-system, sans-serif",
        maxWidth: "640px",
        margin: "4rem auto",
        padding: "0 1rem",
        lineHeight: 1.5,
      }}
    >
      <header>
        <h1 style={{ margin: 0, fontSize: "1.75rem" }}>agentscape.net</h1>
        <p style={{ marginTop: "0.25rem", color: "#555" }}>
          the agent ecosystem report — a weekly field report on the agent
          ecosystem
        </p>
      </header>
      <section style={{ marginTop: "2rem" }}>
        <blockquote
          style={{
            borderLeft: "3px solid #888",
            paddingLeft: "1rem",
            margin: 0,
            fontStyle: "italic",
          }}
        >
          agentscape.net assesses emerging and converging tools, patterns,
          conventions and practices of the agentscape
        </blockquote>
      </section>
      <p style={{ marginTop: "2rem", color: "#666" }}>{firstIssueDate}</p>
    </main>
  );
}
