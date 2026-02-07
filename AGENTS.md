# AGENTS.md

## Purpose
- This repository manages both material representation learning study content and Codex operations documentation.
- The `codex/` folder is the single source of truth for Codex maintenance knowledge (operating rules, change logs, and review procedures).

## Codex Folder Governance Rules
- All maintenance-related documents must be stored under `codex/`.
- If a document is added or removed, update `codex/INDEX.md` immediately.
- Any material change (rule update, workflow update, automation update) must be recorded in `codex/CHANGELOG.md` with a date.
- Policy changes must first update `codex/MAINTENANCE_POLICY.md` and include the rationale for the change.

## File Authoring Rules
- Use ASCII lowercase and hyphenated filenames. Example: `weekly-review-process.md`.
- Keep minimal metadata at the top of each document:
  - `owner`
  - `last_updated`
  - `status` (`draft`, `active`, `deprecated`)
- Procedure documents must include the sections: "Purpose", "Inputs", "Steps", "Failure Handling", and "Outputs".

## Default Reasoning Mode (Academic)
- For academic or research-related tasks, use academic reasoning by default.
- Structure reasoning in this order when applicable: definitions, assumptions, method, evidence, limitations, and conclusion.
- Separate established facts from hypotheses and clearly label uncertainty.
- Prefer precise terminology, explicit criteria, and reproducible steps over informal intuition.

## Notion Paper Retrieval Mode (Low-Cost)
- If the user asks to "load/fetch papers from Notion" for this project, execute retrieval directly via Notion MCP without deep synthesis by default.
- Use lightweight reasoning for retrieval-only tasks: concise output, minimal interpretation, and no long comparative analysis unless explicitly requested.
- Default target:
  - Paper data source id: `7b347469-96b1-4b82-8c3f-9265f487cd4d`
  - Project page id: `412f4daa-a4ff-454f-929e-dab38d3718fe` (`material representation learning + RAE`)
- Default filter policy:
  1. Primary filter: `Projects` relation contains project id `412f4daa-a4ff-454f-929e-dab38d3718fe`.
  2. Fallback filter: `Tags` contains `Representation Learning` and (`Short Name`/`Name`/`Summary` contains `RAE`).
- Return fields in this order unless the user asks otherwise:
  1. `Name`
  2. `Short Name`
  3. `Year`
  4. `Authors`
  5. `URL`
  6. `Status`
  7. `Notion page URL`

## Agent Operational Instructions
- When the user requests Codex maintenance or operations documentation work:
  1. Check existing documents in `codex/INDEX.md` first.
  2. Prefer updating existing documents over creating duplicates.
  3. After changes, append an entry in `codex/CHANGELOG.md`.
- Keep study notes (`lessons`, `papers`, `experiments`) separate from Codex operations documents.

## Learning Workspace Mode
- This repository is optimized for continuous study loops: `paper ingest -> data organization -> learning notes -> small experiments -> review`.
- Prefer small, repeatable increments instead of large one-shot changes.

### 1) Data organization defaults
- Use this learning-first directory layout:
  - `papers/pdf/` for paper PDFs
  - `papers/notes/` for paper note markdown files
  - `ideas/` for research and experiment ideas
  - `reading-log/` for date-based study logs
  - `assets/` for figures/tables/reference images
- Keep Notion retrieval artifacts under `papers/notion-paper-retriever/` for traceability:
  - `manifest.tsv`
  - `logs/downloaded.tsv`
  - `logs/failed.tsv`
  - `README.md`

### 2) Learning note defaults
- Use Notion `Learning Note` as the canonical note database.
- Keep local markdown notes under `papers/notes/`.
- Default paper-note filename format:
  - `YYYY__short-name__notion-page-id.md`
- Optional curated rename format (manual refinement):
  - `YYYY_FirstAuthor_Venue_ShortTitle.md`
- For academic consistency, structure note content as:
  - Definition
  - Assumptions
  - Method/Reasoning
  - Evidence
  - Limitations
  - Open Questions
- Ensure each paper note includes the minimum header:
  - paper title
  - source link
  - tags
  - read date (`YYYY-MM-DD`)

### 3) Small experiment defaults
- Keep experiments lightweight and reproducible.
- Place experiment runs under `experiments/` with one folder per run:
  - `experiments/YYYY-MM-DD__experiment-name/`
- Each run should include:
  - `README.md` (objective, setup, result summary)
  - `config` file(s)
  - `results` artifact(s)
- Record at least one numeric metric and one failure note when applicable.

### 4) Weekly maintenance cycle
- At least once per week:
  1. reconcile paper manifest vs downloaded files
  2. update or create pending Learning Notes
  3. summarize experiment outcomes and next actions

## Naming Conventions (Learning)
- Paper PDF (default):
  - `YYYY__short-name__notion-page-id.pdf`
- Paper note (default):
  - `YYYY__short-name__notion-page-id.md`
- Optional curated naming (manual refinement):
  - `YYYY_FirstAuthor_Venue_ShortTitle.pdf`
  - `YYYY_FirstAuthor_Venue_ShortTitle.md`
  - example: `2025_Lee_ICLR_MaterialRAE.pdf`
- Idea memo:
  - `YYYYMMDD_topic.md`
  - example: `20260207_latent-scaling-ablation.md`

## Skills
### Available local skills
- notion-academic-learning-capture: `./.agents/skills/notion-academic-learning-capture/SKILL.md`
- notion-paper-retriever: `./.agents/skills/notion-paper-retriever/SKILL.md`
