---
name: new-project
description: Add a GitHub repo to Anthony's home repo — repos.txt, clone-all, and an AGENTS.md map row. Use when onboarding a new or existing project into agent-home.
---

# New project

Add one checkout to this home. Do not invent map facts.

1. Append the GitHub repo name (the path segment, not the URL) as its own line in `repos.txt`. Keep comments (`#`) and blank lines intact.
2. From the home root, run `./scripts/clone-all.sh` (or `--ssh`). Confirm `repos/<name>` exists and `git status` in agent-home stays clean (`repos/` is gitignored).
3. Inspect **that** checkout: README, package.json / pyproject / go.mod, and deploy config (`wrangler.toml`, `vercel.json`, GitHub Actions, Cloudflare, Expo `extra`, homepage field). If you cannot open it, the map row is **not inspected**.
4. Add one row to the repo map in `AGENTS.md`: name, one-line purpose, stack, where it deploys (or none), status (`active` / `dormant` / `archived`), GitHub URL `https://github.com/ATConstantino-apps/<name>`.
5. Update **Relationships** only for facts you found (shared packages, domains, Cloudflare zones). Do not tie anything to The Compound unless the evidence is explicit; Compound stays isolated from Champion / Champion_App / championsapp.co.
6. Commit **only** home-repo files (`repos.txt`, `AGENTS.md`, maybe this skill). Commit project code inside `repos/<name>`.
