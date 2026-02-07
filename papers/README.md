# Papers Workspace

## Structure
- `papers/pdf/`: canonical paper PDF location
- `papers/notes/`: per-paper markdown notes
- `papers/notion-paper-retriever/`: Notion retrieval manifest and download logs

## Naming Rules
- Default PDF filename:
  - `YYYY__short-name__notion-page-id.pdf`
- Default note filename:
  - `YYYY__short-name__notion-page-id.md`
- Optional curated rename format:
  - `YYYY_FirstAuthor_Venue_ShortTitle.pdf`
  - `YYYY_FirstAuthor_Venue_ShortTitle.md`

## Notes
- `papers/pdf/` may contain symlinks to `papers/notion-paper-retriever/raw/` to avoid duplicate storage.
