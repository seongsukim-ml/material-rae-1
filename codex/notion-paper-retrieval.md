# Notion Paper Retrieval Protocol

- owner: gimseongsu
- last_updated: 2026-02-08
- status: active

## Purpose
- Define a stable, low-overhead protocol to fetch papers from Notion for the `material representation learning + RAE` project.

## Inputs
- User request to load or fetch papers from Notion.
- Optional user constraints (year range, status, tag, max item count).

## Steps
1. Use the default `Paper` data source id: `7b347469-96b1-4b82-8c3f-9265f487cd4d`.
2. Apply primary filter:
   - `Projects` relation contains `412f4daa-a4ff-454f-929e-dab38d3718fe`.
3. If primary filter is unavailable or returns zero unexpectedly, apply fallback filter:
   - `Tags` contains `Representation Learning`
   - AND (`Short Name` OR `Name` OR `Summary`) contains `RAE`
4. Return concise results with fields:
   - `Name`, `Short Name`, `Year`, `Authors`, `URL`, `Status`, `Notion page URL`
5. Use low-cost reasoning by default:
   - do not summarize deeply or compare methods unless requested.

## Failure Handling
- If Notion MCP is disconnected, report connection issue and ask to re-authenticate MCP.
- If schema changes (missing `Projects`, `Tags`, or key fields), report exactly which property is missing and switch to title-based fallback query.
- If the result set is too large, return top N by user rule or by most recent year.

## Outputs
- A concise paper list filtered for the target project context.
- Optional metadata note on which filter branch was used (primary or fallback).

