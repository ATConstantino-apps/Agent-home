# agent-home

Run Claude Code or Cursor from this repo. Shared skills, steering, and wiki live here. Project git checkouts live in `repos/<name>` (gitignored). Agent-home itself is not cloned into `repos/`. Commit inside each project repo. Never commit project code into agent-home.

Project `AGENTS.md` / `README.md` win for that repo. This file is the map and the standing rules.

Clone or update checkouts: `scripts/clone-all.sh` (HTTPS default; `--ssh` or `CLONE_PROTOCOL=ssh`). Manifest: `repos.txt`.

## Repo map

Status: **active** = pushed in the last ~60 days (since 2026-09-11); **dormant** = older and not archived; **archived** = GitHub archived flag. “unknown” means the files do not say.

| Repo | Purpose | Stack | Deploys | Status | GitHub |
| --- | --- | --- | --- | --- | --- |
| the-compound | Invite-only web app where Anthony curates how real people use AI for his extended family | Next.js 16, React 19, SQLite locally / Cloudflare D1 in prod, vinext + Wrangler, Cloudflare Email Sending | Cloudflare Worker `the-compound` at https://thecompoundai.com | active (pushed 2026-11-10) | https://github.com/ATConstantino-apps/the-compound |
| Spin_Solve | Multiplayer Wheel-of-Fortune-style word game with a five-reel slot machine | React 18 (CRA), TypeScript, Tailwind, Firebase Auth + Cloud Firestore | Vercel at https://spin-solve.vercel.app; Firebase project `spin-solve` | active (pushed 2026-11-04) | https://github.com/ATConstantino-apps/Spin_Solve |
| kept | Local-first PWA to photograph and keep cards people give you | Static HTML/CSS/JS PWA, IndexedDB, three.js, JSZip; optional Cloudflare Pages Function for vision transcription | Cloudflare Pages project `kept`, behind Cloudflare Access; URL unknown | active (pushed 2026-10-16) | https://github.com/ATConstantino-apps/kept |
| room-planner | Mobile-first 3D room and furniture planner | Static ES modules, three.js 0.160, IndexedDB; no build step | Cloudflare Pages project `room-planner` at https://room-planner-9vh.pages.dev, behind Cloudflare Access | active (pushed 2026-10-21) | https://github.com/ATConstantino-apps/room-planner |
| home-assistant-workbench | Knowledge and skills workspace for Anthony’s Home Assistant instance (no HA config in the repo; changes go live via MCP) | Markdown knowledge base, Claude skills, ha-mcp | none (live instance is edited via MCP, not deployed from this repo) | active (pushed 2026-11-08) | https://github.com/ATConstantino-apps/home-assistant-workbench |
| Sicily-2028 | Private family site to compare four versions of a 14-night Sicily 2028 trip and drop ideas into a shared Google Doc | React 18, Vite, Tailwind | Vercel (README: unguessable subdomain; URL unknown) | active (pushed 2026-10-11) | https://github.com/ATConstantino-apps/Sicily-2028 |
| Restaurant-LMS | Staff training LMS: video courses assigned to employees, with progress, bookmarks, and notifications (admin / manager / employee) | Next.js 16, React 19, Prisma, PostgreSQL, Supabase Auth, Tailwind + shadcn | unknown (README is the stock Next.js template; no deploy config or URL) | archived (pushed 2026-02-07) | https://github.com/ATConstantino-apps/Restaurant-LMS |
| yellow-house-listing | Lightweight listing site for 2702 N 53rd St (photos, details, interest form; family’s personal contact info stays off the page) | Static HTML/JS | Vercel at https://yellow-house-listing.vercel.app | dormant (pushed 2026-07-07) | https://github.com/ATConstantino-apps/yellow-house-listing |
| Mangia | Mobile-friendly website for Mangia Italiana (menu, catering, online ordering via Toast) | Static HTML/CSS, Bootstrap 5 | Vercel at https://mangiawebsite.vercel.app | dormant (pushed 2025-02-22) | https://github.com/ATConstantino-apps/Mangia |
| Champion_App | Fitness accountability platform that connects users with personal champions | React 18, Vite, Tailwind, Firebase (Auth, Firestore, Storage, Cloud Functions), Stripe, Anthropic | Vercel at https://www.championsapp.co (apex https://championsapp.co redirects there) and https://champion-app-ochre.vercel.app; Firebase Cloud Functions | archived (pushed 2025-11-20) | https://github.com/ATConstantino-apps/Champion_App |
| Champion | Early static site for an “accountability app for any goal” (landing page / blog plan) | HTML/CSS/JS, Node build (`marked`, Express dev server), gh-pages | GitHub Pages at https://atconstantino-apps.github.io/Champion | dormant (pushed 2025-01-16) | https://github.com/ATConstantino-apps/Champion |
| Recipes_Meal_Plan | Recipe aggregator and meal planner: paste a recipe, extract ingredients and macros, plan the week | React 18, Vite, TypeScript, Tailwind, Claude API (package.json also lists Supabase and Firebase) | Vercel (URL unknown) | archived (pushed 2025-01-16) | https://github.com/ATConstantino-apps/Recipes_Meal_Plan |
| Tracker | Habit tracker / dashboard | Expo 50, React Native 0.73 | none | archived (pushed 2025-01-24) | https://github.com/ATConstantino-apps/Tracker |

## Relationships

- The Compound is standalone. Its README states there are no ties to championsapp.co or Champions. Do not share a domain, email sender, or Cloudflare zone with Champion, Champion_App, or championsapp.co.
- Champion is an earlier static marketing/landing site (GitHub Pages, last push 2025-01-16). Champion_App, created eight days later, is the later full product and is the one whose Vercel config serves championsapp.co. There is no “champions” repo. Champion’s files do not reference Champion_App.
- No other cross-repo code or documented links turned up. Mangia, Restaurant-LMS, and Recipes_Meal_Plan are all food-adjacent, but the files do not connect them. kept and room-planner both sit on Cloudflare Pages behind Access, as separate projects.

## Standing rules (every project)

- Never commit, print, or paste secrets or one-time login links.
- UI work: before shipping, run design checks — 390×844 phone screenshots, readability, overlap/cropping, longest-copy test, then an independent critique.
- No AI-slop design: gradient blobs, emoji-as-icons, generic hype copy, cookie-cutter card grids.
- Don’t spend money without asking.
- Small, clearly named commits. Commit in the project repo, not here.
