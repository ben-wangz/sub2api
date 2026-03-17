# Development Principles

## Sub2API Principles
- This repository is a fork; keep `main` as an upstream mirror and maintain our changes on `stable`.
- Use merge (not rebase) for shared/published branches.
- Frontend uses `pnpm`; keep `frontend/pnpm-lock.yaml` in sync when dependencies change.
- Avoid committing secrets (tokens, credentials, `.env`, private keys).

## Core Principles
- Pragmatic over dogmatic
- Single responsibility per function/class
- Minimal comment style
- After modification/refactoring/generation codes: no code summaries, only minimal change overviews
- No summary.md or similar files in interactive mode
- No "Project Structure" nor "Troubleshooting" in docs or skills as it's not persistent
- Designing and discussing before implementing large tasks
- Show design without detail codes
- Use utf8 by default, especially for Chinese text
- Check before using the Write tool: split into chunks if content exceeds 50 lines or 2000 characters or 3000 tokens

## Code Restrictions
- Comments only in English
- Single function < 200 lines
- Loop nesting <= 3 levels
- Sh scripts can be invokable via absolute paths: no dependence on working dir

## Test
- Ask before running tests

## Commit Message
- No info beyond changes (e.g., author)

## MCP
- serena
  - Priority use, unless alternative methods can significantly reduce token consumption
