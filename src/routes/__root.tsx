import { Outlet, ScrollRestoration, createRootRoute } from "@tanstack/react-router";
import { Meta, Scripts } from "@tanstack/start";

export const Route = createRootRoute({
  meta: () => [
    { charSet: "utf-8" },
    { name: "viewport", content: "width=device-width, initial-scale=1" },
    { title: "agentscape.net" },
    {
      name: "description",
      content:
        "agentscape.net assesses emerging and converging tools, patterns, conventions and practices of the agentscape.",
    },
  ],
  component: RootComponent,
});

function RootComponent() {
  return (
    <html lang="en">
      <head>
        <Meta />
      </head>
      <body>
        <Outlet />
        <ScrollRestoration />
        <Scripts />
      </body>
    </html>
  );
}
