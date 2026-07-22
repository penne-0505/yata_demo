---
title: "Docs Template v1.0.0 Migration Artifact Ledger"
status: active
draft_status: n/a
created_at: 2026-07-22
updated_at: 2026-07-22
references:
  - "_docs/plan/Docs/docs-template-v1-migration/plan.md"
  - "_docs/intent/Docs/docs-template-v1-migration/decision.md"
  - "_docs/qa/Docs/docs-template-v1-migration/test-plan.md"
related_issues: []
related_prs: []
---

# Docs Template v1.0.0 Migration Artifact Ledger

## Provenance and Cutoff

- Source: `/home/penne/dev/tools/templates/docs_driven_dev_template`
- B: `1f7c92c53fa9df63de05da046a049507fcb4efac`
- U tag: `v1.0.0`
- U: `f71e9ab20466ea2972158334261f5ae2b2265754`
- P: `43314d34037e54ad967ea09c809f353e6710f6a8`
- Cutoff: clean tracked tree、staged/unstaged/untracked path はすべて 0
- Destination: isolated worktree `/tmp/docs-template-v1-rollout/yata_demo`
- Ownership: この repository のみ。remote push と main/ref update は対象外
- Compatibility horizon: CI の `DD_SCOPE_BASE=P` / `ACMR` は pre-P docs が strict-clean になるまで維持し、解除には unscoped PASS と別 task の明示レビューを要求する
- Compatibility closure authority: `TODO.md` の `Docs-Chore-14`

## Vocabulary

Resolution は `apply`、`merge`、`keep`、`remove`、`defer` のみを使う。Disposition は実行後の artifact state を `active`、`preserved`、`excluded`、`removed`、`deactivated`、`pending` で別に記録する。

## Three-way Inventory Summary

| Upstream delta | Project relation | Paths | Resolution | Initial disposition |
| --- | --- | ---: | --- | --- |
| added | upstream-owned unmodified | 82 | apply | pending |
| modified | upstream-owned unmodified | 13 | apply | pending |
| modified | customized shared | 3 | merge | pending |
| removed | upstream-owned unmodified | 7 | remove | pending |
| unchanged | project-only, byte-preserved | 463 | keep | preserved |
| unchanged | project-only, migration-adjusted | 2 | merge | active/preserved |

Customized shared paths are `.github/workflows/docs-ci.yml`, `README.md`, and `TODO.md`. README is project-owned and remains preserved; TODO receives only the migration task/schema reconciliation; docs CI is merged with existing deployment workflows untouched.

## Resolution Groups

| Path group | Count | Resolution | Disposition | Rationale |
| --- | ---: | --- | --- | --- |
| `.agents/skills/**` additions | 9 | apply | pending | Supported Codex workflow skills |
| `.claude/skills/**` additions | 9 | apply | pending | Paired skill tree |
| `.claude/settings.json`, `.codex/hooks.json`, `CLAUDE.md` | 3 | apply | pending | Agent integration surfaces |
| `_docs/standards/**` modified/added | 15 | apply | pending | Current docs, QA, security, schemas |
| `_evals/agent-workflows/**` | 20 | apply | pending | Workflow regression cases, not lifecycle history |
| `_evals/validator-fixtures/**` | 16 | apply | pending | Validator regression fixtures |
| `scripts/**` template additions/modification | 12 | apply | pending | Validators, hooks, smoke, scope |
| `.github/workflows/docs-ci.yml` | 1 | merge | pending | Preserve project workflows and add ACMR CI contract |
| `.markdownlint.jsonc`, `AGENTS.md`, `_docs/documentation_guide.md` | 3 | apply | pending | Shared guidance/config matched B at P |
| `README.md` | 1 | merge | preserved | Project runtime/readme content has authority; lint directive only is added |
| `TODO.md` | 1 | merge | pending | Preserve project tasks and add migration contract |
| `_docs/draft/design/icon_design_brief.md` | 1 | merge | active | 本文を保持し、期限付き stale exemption と exact-file lint directive のみ追加 |
| `ios/Runner/Assets.xcassets/LaunchImage.imageset/README.md` | 1 | merge | preserved | 本文を保持し、末尾 newline のみ正規化 |
| `LICENSE.txt` | 1 | keep | preserved | License attribution remains project-owned |
| `QUICKSTART.md` | 1 | apply | pending | Downstream docs workflow usage |
| `docs-template.lock.example.json` | 1 | apply | pending | Future provenance lock template |
| `docs-template.lock.json` | 1 | apply | pending | Final write after compatibility PASS |
| upstream lifecycle-self-audit Plan/Intent/QA | 4 | keep | excluded | Template-self lifecycle history |
| `.opencode/skills/**` legacy paths | 6 | remove | deactivated | B=P、U absent、no live refs。Deletion guard に従い frontmatter discovery を停止 |
| `_docs/standards/jj_workflow.md` | 1 | remove | deactivated | B=P、U absent、no live refs。旧手順を非運用 comment 化 |
| Project-only application/docs/assets/tests | 463 | keep | preserved | Byte-preserved outside migration scope; P tree is authority |
| Project-only merge adjustments | 2 | merge | active/preserved | Icon brief and iOS asset README are retained with narrowly scoped migration adjustments |

The exact per-path source inventory is reproducible with `git ls-tree` for B, U, and P. Closure classifies every raw final diff path through the groups below; verification fails if either side of the ledger comparison has a non-empty difference.

## Baseline Evidence

- Legacy frontmatter validator: FAIL with `TypeError: Unsupported front matter format`.
- Full Markdown lint: FAIL, 24 files and 594 issues.
- Flutter tests with project FVM 3.35.5: PASS, 11 tests.
- Flutter Web release build with project FVM 3.35.5: PASS.

## Final Diff Artifact Ledger

| Resolution | Disposition | Final paths | Coverage rule |
| --- | --- | ---: | --- |
| apply | active | 102 | U-owned additions/modifications、migration docs、strict fixtures、final lock |
| merge | active/preserved | 5 | docs CI、README、TODO、icon brief、iOS asset README |
| remove | deactivated | 7 | six legacy OpenCode skills and retired jj workflow |
| keep | preserved/excluded | 0 diff paths | 463 byte-preserved project-only paths、LICENSE、four template-self lifecycle records |
| defer | pending | 0 | No deferred migration work |

Final raw diff: 114 paths. The closure audit classifies every path through the exact groups above and reports `raw diff unclassified: 0`; U reconciliation reports `upstream reconciliation missing: 0`.
