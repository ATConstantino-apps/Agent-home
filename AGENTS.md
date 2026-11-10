# agent-home

Run Claude Code or Cursor from this repo. Shared skills, steering, and wiki live here. Project git checkouts live in `repos/<name>` (gitignored). Commit inside each project repo. Never commit project code into agent-home.

Project `AGENTS.md` / `README.md` win for that repo. This file is the map and the standing rules.

Clone or update checkouts: `scripts/clone-all.sh` (HTTPS default; `--ssh` or `CLONE_PROTOCOL=ssh`). Manifest: `repos.txt`.

## Repo map

Inspected 2026-11-10. This token could read public `ATConstantino-apps` GitHub only. Private/missing GitHub repos are **not inspected** — do not invent purpose, stack, or status. Refresh this table after access is granted.

| Repo | Purpose | Stack | Deploys | Status | GitHub |
|------|---------|-------|---------|--------|--------|
| the-compound | not inspected (GitHub 404) | GitHub not inspected. Cloudflare Worker `the-compound` (D1 + Email Sending) on a dedicated zone | `thecompoundai.com`, `www.thecompoundai.com` (Worker routes; zone `thecompoundai.com`) | not inspected on GitHub; Worker last modified 2026-11-10 | https://github.com/ATConstantino-apps/the-compound |
| Spin_Solve | not inspected | not inspected | not inspected | not inspected | https://github.com/ATConstantino-apps/Spin_Solve |
| kept | not inspected | not inspected | not inspected | not inspected | https://github.com/ATConstantino-apps/kept |
| room-planner | not inspected | not inspected | not inspected | not inspected | https://github.com/ATConstantino-apps/room-planner |
| home-assistant-workbench | not inspected | not inspected | not inspected | not inspected | https://github.com/ATConstantino-apps/home-assistant-workbench |
| Sicily-2028 | not inspected | not inspected | not inspected | not inspected | https://github.com/ATConstantino-apps/Sicily-2028 |
| Restaurant-LMS | not inspected | not inspected | not inspected | not inspected | https://github.com/ATConstantino-apps/Restaurant-LMS |
| yellow-house-listing | not inspected | not inspected | not inspected | not inspected | https://github.com/ATConstantino-apps/yellow-house-listing |
| Mangia | not inspected | not inspected | not inspected | not inspected | https://github.com/ATConstantino-apps/Mangia |
| Champion_App | not inspected | not inspected | not inspected | not inspected | https://github.com/ATConstantino-apps/Champion_App |
| Champion | not inspected | not inspected | not inspected | not inspected | https://github.com/ATConstantino-apps/Champion |
| Tracker | Habit tracker / dashboard (GitHub description; README empty; `App.js` is the Expo starter) | Expo 50, React Native 0.73, React 18.2 | none (no homepage; no wrangler/vercel/netlify/fly/expo `extra` deploy config) | archived | https://github.com/ATConstantino-apps/Tracker |
| Recipes_Meal_Plan | not inspected | not inspected | not inspected | not inspected | https://github.com/ATConstantino-apps/Recipes_Meal_Plan |

## Relationships

**Hard isolation:** The Compound is standalone. No shared domain, email sender, or Cloudflare zone with Champion, Champion_App, or championsapp.co.

Observed 2026-11-10 (Cloudflare API, not GitHub):

- Zone `thecompoundai.com` — Worker `the-compound` on apex + www only. MX is Cloudflare’s. Email Sending is bound on that Worker.
- Zone `championsapp.co` — DNS to Vercel (`A` `76.76.21.21`; `www` CNAME `cname.vercel-dns.com`). No Worker hostnames on this zone.
- Same Cloudflare *account*, two zones — that is not a shared zone. Do not reuse Compound routes, senders, or zone settings on Champion, or the reverse.

Champion vs Champion_App: GitHub not inspected. Treat them as the championsapp.co family for isolation. Do not assume which repo (if either) deploys there.

No other GitHub-visible links (only Tracker was readable).

## Standing rules (every project)

- Never commit, print, or paste secrets or one-time login links.
- UI work: before shipping, run design checks — 390×844 phone screenshots, readability, overlap/cropping, longest-copy test, then an independent critique.
- No AI-slop design: gradient blobs, emoji-as-icons, generic hype copy, cookie-cutter card grids.
- Don’t spend money without asking.
- Small, clearly named commits. Commit in the project repo, not here.
