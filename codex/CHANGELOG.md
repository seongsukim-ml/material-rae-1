# Codex Maintenance Changelog

- owner: gimseongsu
- last_updated: 2026-02-08
- status: active

## 2026-02-08
- Added `AGENTS.md`: designated `codex/` as the single source of truth for Codex maintenance documentation.
- Added `codex/INDEX.md`: defined indexing and synchronization rules for maintenance documents.
- Added `codex/MAINTENANCE_POLICY.md`: defined operations workflow, failure handling, and review cadence.
- Updated all internal maintenance instructions to English and added default academic reasoning guidance in `AGENTS.md`.
- Added `codex/notion-paper-retrieval.md`: standardized Notion paper loading protocol for `material representation learning + RAE`.
- Updated `AGENTS.md`: added a low-cost reasoning retrieval mode and default filter policy for Notion paper fetch requests.
- Added `codex/skills/notion-academic-learning-capture/SKILL.md`: drafted an academic workflow skill for creating Learning Notes with `Status=Draft`, controlled `Type`, and structured `Key Insights`.
- Added `.agents/skills/notion-paper-retriever/SKILL.md`: created a local skill in the project-recognized path for Notion paper retrieval.
- Updated `AGENTS.md`: registered local project skills including `notion-paper-retriever`.
- Updated `AGENTS.md`: changed skill paths to relative paths and added a learning-operations workflow for data organization, Learning Notes, and small experiments.
- Updated `AGENTS.md`: aligned learning workspace guidance with a study-centric layout (`papers/pdf`, `papers/notes`, `ideas`, `reading-log`, `assets`) and explicit naming conventions.
- Added `papers/notes/_template.md`: baseline paper-note template.
- Added `papers/README.md`: paper storage and naming policy, including fallback ingestion naming.
- Added `ideas/_template.md` and `reading-log/_template.md`: starter templates for idea tracking and weekly reading logs.
- Updated `AGENTS.md` and `papers/README.md`: set fallback naming (`YYYY__short-name__notion-page-id`) as the default for PDFs and notes.
- Cleanup: moved non-essential files to `unused/` (`.DS_Store` files, legacy `codex/skills/notion-academic-learning-capture/SKILL.md`, and redundant `papers/notion-paper-retriever/by-year` symlink tree).
- Updated `codex/MAINTENANCE_POLICY.md`: added workspace baseline, default fallback naming policy, and a study maintenance checklist.
