# Decisions

## 2026-11-10 — Adopt the home-repo pattern

**Decision:** Keep one home repo (`ATConstantino-apps/agent-home`) for shared skills, steering (`AGENTS.md` / `CLAUDE.md`), and this wiki. Run the coding agent from here. Clone project repos into gitignored `repos/<name>` via `repos.txt` + `scripts/clone-all.sh`. Commit each project in its own git repo.

**Why:** Matt Pocock’s home-repo pattern ([post](https://x.com/mattpocockuk/status/2120260969750540327)): one place to run agents across many checkouts, with a pruned map instead of extra tooling. Plain clone + gitignore is enough.

**Consequences:**

- Project `AGENTS.md` / README override home rules for that repo.
- The Compound stays isolated from Champion / Champion_App / championsapp.co (no shared domain, email sender, or Cloudflare zone).
- The repo map is only as true as the last inspection. Private GitHub repos this environment cannot read stay **not inspected**.
