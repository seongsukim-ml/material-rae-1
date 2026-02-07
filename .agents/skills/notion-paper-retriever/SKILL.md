---
name: notion-paper-retriever
description: Retrieve papers from Notion for the material representation learning + RAE project using low-cost reasoning. Use when the user asks to load or fetch papers from Notion and return concise metadata lists.
---

# Notion Paper Retriever

Fetch project-relevant papers from Notion with minimal overhead and consistent filtering.

## Quick start
1) Query the `Paper` data source.
2) Apply primary project relation filter.
3) Fallback to tag and keyword filters when needed.
4) Return concise fields in fixed order.

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

### 1) Use default targets
- Paper data source id: `7b347469-96b1-4b82-8c3f-9265f487cd4d`
- Project page id: `412f4daa-a4ff-454f-929e-dab38d3718fe`

### 2) Apply filters
1. Primary filter:
   - `Projects` relation contains `412f4daa-a4ff-454f-929e-dab38d3718fe`
2. Fallback filter:
   - `Tags` contains `Representation Learning`
   - and (`Short Name` or `Name` or `Summary`) contains `RAE`

### 3) Return fields (fixed order)
1. `Name`
2. `Short Name`
3. `Year`
4. `Authors`
5. `URL`
6. `Status`
7. `Notion page URL`

### 4) Reasoning mode
- Use low-cost reasoning by default for retrieval tasks.
- Avoid deep synthesis unless explicitly requested.

### 5) Failure handling
- If relation/tag fields are missing, report the missing field and fallback to title keyword search.
- If results are large, return top N (if specified) or newest by year.

