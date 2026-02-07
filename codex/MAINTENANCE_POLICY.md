# Codex Maintenance Policy

- owner: gimseongsu
- last_updated: 2026-02-08
- status: active

## Purpose
- Prevent fragmentation of Codex operational knowledge and maintain a reproducible maintenance routine.

## Scope
- This policy applies only to operations documentation under `codex/`.
- Research content (papers, lessons, experiments) must be managed in separate domain folders.

## Workspace Baseline
- Keep the study workspace aligned to this baseline:
  - `papers/pdf/` (canonical paper access path)
  - `papers/notes/` (paper notes)
  - `papers/notion-paper-retriever/` (Notion retrieval manifests/logs)
  - `ideas/` (research and experiment ideas)
  - `reading-log/` (date-based learning logs)
  - `assets/` (figures/tables/images)
- Default paper naming policy:
  - PDF: `YYYY__short-name__notion-page-id.pdf`
  - note: `YYYY__short-name__notion-page-id.md`

## Inputs
- User requests about operations
- Automation or workflow changes
- Failure cases and retrospectives

## Steps
1. Classify change requests as one of: new document, update existing document, or deprecation.
2. Validate impact: check whether links or procedures in other documents will break.
3. Apply updates with emphasis on purpose and executable steps.
4. Sync the entry list in `codex/INDEX.md`.
5. Record date, summary, and rationale in `codex/CHANGELOG.md`.

## Study Maintenance Checklist
1. Reconcile `papers/notion-paper-retriever/manifest.tsv` against `papers/notion-paper-retriever/raw/`.
2. Confirm `papers/pdf/` remains the canonical access path (symlink or file).
3. Ensure new paper notes use the default fallback naming.
4. Ensure `reading-log/` has an entry for the current review cycle.
5. Move redundant or temporary artifacts to `unused/` instead of deleting immediately.

## Failure Handling
- If document conflicts or duplication are detected:
  1. Stop creating new files.
  2. Draft a consolidation update for existing documents first.
  3. Re-check for broken links after consolidation.

## Outputs
- Updated policy document
- Synchronized index
- Date-stamped change history
- Workspace consistency report (manifest/files/notes alignment)

## Review Cadence
- Weekly: check missing links in recently changed documents.
- Monthly: review documents not updated for more than 30 days.
- Quarterly: run a structure simplification and duplication cleanup review.
