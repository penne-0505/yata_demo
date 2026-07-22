---
title: "QA Test Plan: Docs Template v1.0.0 Migration"
status: active
draft_status: n/a
qa_status: planned
risk: Medium
qa_schema: 2
created_at: 2026-07-22
updated_at: 2026-07-22
references:
  - "_docs/intent/Docs/docs-template-v1-migration/decision.md"
  - "_docs/plan/Docs/docs-template-v1-migration/plan.md"
  - "_docs/reference/Docs/docs-template-v1-migration/artifact-ledger.md"
related_issues: []
related_prs: []
---

# QA Test Plan: Docs Template v1.0.0 Migration

## Source of Intent

- TODO: `Docs-Chore-14` (compatibility scope closure)
- Plan: `_docs/plan/Docs/docs-template-v1-migration/plan.md`
- Intent: `_docs/intent/Docs/docs-template-v1-migration/decision.md`

## Quality Goal

Docs template v1.0.0 の運用契約を再現可能な provenance と完全な diff accounting を伴って導入し、YATA の runtime と project-owned artifacts を変更しない。

## Acceptance Criteria

- AC-001: B/U/P と final lock が exact SHA で一致する。
- AC-002: upstream/project inventory と raw final diff の未分類 path がゼロである。
- AC-003: application、README、既存 project docs の preservation check が PASS する。
- AC-004: compatibility gate と strict schema fixtures が PASS する。
- AC-005: ACMR scope、validators、fixtures、hooks、smoke、paired skills、full lint が PASS する。
- AC-006: active stale jj/OpenCode artifacts がなく、cleanup 条件の evidence がある。
- AC-007: template-self lifecycle history が final tree にない。
- AC-008: project Flutter tests と Web build が PASS する。
- AC-009: pre-P docs の strict warning を解消し、unscoped PASS を review した後にだけ compatibility scope を解除または継続判断する。

## Decision Review Scope

- DEC-001: provenance と lock write order
- DEC-002: project artifact preservation
- DEC-003: compatibility/strict gate separation
- DEC-004: template-self history exclusion
- DEC-005: evidence-bounded obsolete cleanup
- DEC-006: local/CI closure parity

## Intent-derived Invariants

- None

## Risk Assessment

- Risk level: Medium
- Risk rationale: validators、CI、agent workflows、document schemas を同時に更新する migration である。
- Regression risk: project docs の誤置換、scope 漏れ、active stale workflow、lock の先行更新。
- Data safety risk: application data/schema は変更しない。
- Security / privacy risk: hooks と CI の外部入力・secret 境界を upstream security standard に照合する。
- UX risk: application UI は変更しない。
- Agent misbehavior risk: branch mixing、blind replacement、premature lock advancement、bulk schema edits、template-self history import。

## Test Strategy

- Unit: `scripts/test-validators.mjs`、`scripts/test-agent-workflow-hook.mjs`
- Integration: `scripts/check-docs.sh`、`scripts/test-agent-workflow-smoke.mjs`
- Manual QA: provenance review、inventory/ledger reconciliation、project artifact hashes
- Validator / static check: unscoped/scoped validators、full Markdown lint、conflict marker scan
- Diff review: P からの raw final diff と artifact ledger の双方向差集合

## Test Matrix

| ID | Source | Requirement / Optional Invariant | Test Type | Command / File | Expected Evidence | Status |
| --- | --- | --- | --- | --- | --- | --- |
| AC-001 | TODO | Exact B/U/P and final lock | static/manual | `git rev-parse`, lock review | Exact full SHA match | verified |
| AC-002 | TODO | Inventory and diff complete | diff review | artifact ledger comparison | Zero missing paths | verified |
| AC-003 | TODO | Project artifacts preserved | hash/diff | P vs final path sets | Zero unexpected changes | verified |
| AC-004 | TODO | Compatibility then strict schema | validator | wrappers and fixtures | Both gates PASS separately | verified |
| AC-005 | TODO | CI-equivalent validation | validator/lint | docs/hook/smoke/paired/lint commands | All exit 0, lint zero | verified |
| AC-006 | TODO | Obsolete active paths absent | static | B/P/U blob and `rg` checks | Conditions proven | verified |
| AC-007 | TODO | No template-self history | static | path scan | No lifecycle-self-audit paths | verified |
| AC-008 | TODO | Runtime behavior preserved | project test/build | pinned Flutter commands | Tests and Web build exit 0 | verified |
| AC-009 | TODO | Compatibility scope closure | validator/manual review | unscoped wrapper and CI scope review | Warning-free unscoped PASS and recorded scope decision; `Docs-Chore-14` owns the work | planned |

## Manual QA Checklist

- [x] Shared customized paths were merged rather than replaced.
- [x] Allowed resolution vocabulary and separate disposition are used in the ledger.
- [x] Lock creation was the last template integration content write.
- [x] Raw diff has zero paths absent from the ledger and vice versa.
- [ ] Compatibility scope removal is eligible; deferred until AC-009 is verified.

## Regression Checklist

- [x] P remains the sole commit parent.
- [x] No remote push or main ref update occurred.
- [x] Application/runtime/source/tests/build/assets are unchanged.
- [x] Project README and existing docs retain their project content.
- [x] No conflict markers or active stale jj/OpenCode skills remain.

## Out of Scope

- Flutter dependencies、application behavior、upstream template development history

## Open Questions

- None
