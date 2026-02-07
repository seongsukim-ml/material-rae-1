---
name: notion-academic-learning-capture
description: Capture academic conversations, paper notes, and research ideas into the Notion Learning Note database. Use when creating or updating Learning Notes with structured Key Insights, default Draft status, and controlled Type selection (Paper Review, Idea, Concept, Tutorial, Summary).
---

# Academic Learning Capture

Convert research conversations and notes into high-quality Notion Learning Notes with evidence-oriented structure.

## Quick start
1) Confirm scope: create a new note or update an existing one.
2) Validate the Learning Note data source schema.
3) Infer `Type` from source content.
4) Draft `Key Insights` in `Claim | Evidence | Implication` format.
5) Create/update the note with `Status = Draft`.

## Workflow

### 0) If Notion MCP is not connected
1. Add Notion MCP:
   - `codex mcp add notion --url https://mcp.notion.com/mcp`
2. Enable remote MCP client:
   - set `[features].rmcp_client = true` in `config.toml`
   - or run `codex --enable rmcp_client`
3. Login:
   - `codex mcp login notion`

After login, restart Codex, then continue.

### 1) Validate destination
- Data source name: `Learning Note`
- Data source id: `962cfed7-6ef5-43f1-b82a-68271019c179`
- Required properties:
  - `Note Title` (title)
  - `Key Insights` (rich_text)
  - `Status` (select)
  - `Type` (select)
  - `Date` (date)
  - `AI-generated` (checkbox)

If user requests `Data Key Insights`, map to `Key Insights` unless they explicitly request a schema change.

### 2) Extract academic content
- Structure source material as:
  - definitions
  - assumptions
  - method or argument
  - evidence
  - limitations
  - open questions
- Separate established facts from hypotheses.

### 3) Select Type
Choose exactly one:
1. `Paper Review`
2. `Idea`
3. `Concept`
4. `Tutorial`
5. `Summary`

Fallback: use `Summary` if confidence is low.

### 4) Compose Key Insights
- Write 3-5 lines:
  - `Claim: ... | Evidence: ... | Implication: ...`
- Prefer falsifiable claims and explicit evidence.
- Include one limitation/risk line if available.

### 5) Create/update page
- Default values:
  - `Status`: `Draft`
  - `AI-generated`: `true`
  - `Date`: today
- Set `Type` from Step 3.
- Set `Key Insights` from Step 4.
- Add relations (`📄 Paper`, `🌟 Projects`) when context is provided.

### 6) Return concise result
- Return:
  1. note title
  2. selected type
  3. key insights preview
  4. Notion page URL
  5. explicit confirmation: `Status = Draft`

