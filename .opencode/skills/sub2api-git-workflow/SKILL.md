---
name: sub2api-git-workflow
description: Maintain this fork with upstream sync (main mirror) + stable branch + merge-only strategy
compatibility: opencode
metadata:
  repo: sub2api
  upstream: git@github.com:Wei-Shaw/sub2api.git
---

## Purpose

Define how we manage Git for this fork so that maintenance operations stay consistent over time.

Scope: Git workflow only. CI behavior is out of scope.

## Hard rules (do not violate)

- `main` is an upstream mirror branch; only fast-forward sync is allowed (`git merge --ff-only upstream/main`)
- `stable` is the stable branch for this repo (fixed name)
- Use merge to maintain shared history; do not recommend rebasing shared/published branches

## Remotes

- `origin`: your fork
- `upstream`: upstream OSS repo: `git@github.com:Wei-Shaw/sub2api.git`

Example (adjust to your local setup):

```bash
git remote -v

# origin: git@github.com:ben-wangz/sub2api.git
git remote add upstream git@github.com:Wei-Shaw/sub2api.git
git fetch upstream --prune
```

## Branches

- `main`: upstream mirror; no custom commits; fast-forward sync only
- `stable`: stable branch (fixed name); carries this fork's long-term maintenance changes
- `feat/upstream/*`: branch off `main`, intended for PRs to upstream
- `feat/local/*`: branch off `stable`, intended to stay in this fork only

## Sync upstream -> `main` (ff-only)

```bash
git fetch upstream --prune
git checkout main
git merge --ff-only upstream/main
git push origin main
```

## Merge `main` -> `stable` (merge strategy)

```bash
git checkout stable
git merge main
git push origin stable
```

## Upstream PR flow

```bash
git checkout main
git pull --ff-only origin main
git checkout -b feat/upstream/<topic>

# Work and commit...

git push -u origin feat/upstream/<topic>
```

If this change also needs to land in `stable`: prefer waiting until upstream merges it, then sync `main` and merge into `stable`. In urgent cases you can cherry-pick, but expect extra conflict/duplication handling during later upstream syncs.

## Branch protection suggestions

- `main`: protected; no direct pushes; fast-forward sync only
- `stable`: protected; merge via PR
