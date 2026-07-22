---
title: "QA Verification: Docs Template v1.0.0 Migration"
status: active
draft_status: n/a
qa_status: partial
risk: Medium
qa_schema: 2
created_at: 2026-07-22
updated_at: 2026-07-22
references:
  - "_docs/intent/Docs/docs-template-v1-migration/decision.md"
  - "_docs/plan/Docs/docs-template-v1-migration/plan.md"
  - "_docs/qa/Docs/docs-template-v1-migration/test-plan.md"
  - "_docs/reference/Docs/docs-template-v1-migration/artifact-ledger.md"
related_issues: []
related_prs: []
---

# QA Verification: Docs Template v1.0.0 Migration

## Summary

Legacy B から release `v1.0.0` / U への compatibility migration と strict schema migration を別 gate で検証した。project runtime/source/tests、README 本文、project docs の意味を保持し、template-self history を除外した。

## Verification Verdict

Verdict: PARTIAL

## Independent-review remediation

- Evidence: current `TODO.md` listed only `Docs-Chore-1` through `Docs-Chore-3` and `Docs-Doc-12`, while its `Next ID No` was 14; no `Docs-Chore-13` task or completion authority existed. The QA source is therefore reassigned to the newly allocated `Docs-Chore-14` and `Next ID No` advances to 15.
- Evidence: `git diff --name-only P..HEAD` contains both `_docs/draft/design/icon_design_brief.md` and `ios/Runner/Assets.xcassets/LaunchImage.imageset/README.md`. They are project-only at P but migration-adjusted in the final diff, so they are recorded as two merges rather than among the 463 byte-preserved project-only paths.
- Evidence: the checkout-equivalent `git ls-files -z --cached --others --exclude-standard '*.md'` command currently enumerates 98 Markdown files and completes with zero markdownlint issues.
- Disconfirming explanation considered: `Docs-Chore-13` could have been a deliberately removed completed task. No completion record, historical authority, or retained ID allocation substantiates that interpretation, so it is not used as the QA source.
- Decision and non-local effect: preserve `DD_SCOPE_BASE=P` / `ACMR` compatibility enforcement because the unscoped wrapper still reports a guide reference warning. `Docs-Chore-14` owns warning removal and the later CI/local scope decision; it prevents a migration record from implying that the support horizon has already ended.

## Commands Run

```bash
./scripts/check-docs.sh
DD_SCOPE_BASE=43314d34037e54ad967ea09c809f353e6710f6a8 ./scripts/check-docs.sh
DD_SCOPE_BASE=43314d34037e54ad967ea09c809f353e6710f6a8 DD_SCOPE_DIFF_FILTER=ACMR ./scripts/check-docs.sh
git ls-files -z --cached --others --exclude-standard '*.md' | xargs -0 npx --yes markdownlint-cli2
diff -ru .agents/skills .claude/skills
/home/penne/dev/active/yata_demo/.fvm/flutter_sdk/bin/flutter test
/home/penne/dev/active/yata_demo/.fvm/flutter_sdk/bin/flutter build web --release --dart-define=YATA_DEMO_MODE=true
npx --yes yaml-lint .github/workflows/docs-ci.yml
```

Result:

```text
Compatibility scoped A: PASS
Compatibility/scoped strict ACMR: PASS
Strict unscoped: PASS with one pre-existing non-fatal guide reference warning
Validator fixtures/hooks/smoke/paired skills: PASS
Tracked/untracked repository Markdown: 98 files, 0 issues
Raw diff ledger: 102 apply + 5 merge + 7 deactivated = 114 paths; 463 project-only paths byte-preserved and 2 project-only paths merged
Flutter tests: 11 passed
Flutter Web release build: PASS
CI workflow YAML: valid
```

## Automated Test Results

| Command / Test | Result | Notes |
| --- | --- | --- |
| Documentation wrapper, unscoped | PASS | Existing guide reference warning is non-fatal |
| Documentation wrapper, P-scoped A | PASS | Compatibility gate |
| Documentation wrapper, P-scoped ACMR | PASS | CI scope and strict fixtures |
| Frontmatter strict fixtures | PASS | Valid type markers accepted; duplicate, unknown, and wrong-type markers rejected |
| Hook unit and workflow smoke tests | PASS | Deletion, secret, audit, paired-skill checks |
| Full tracked Markdown lint | PASS | 98 files, zero issues; ignored Flutter ephemeral dependencies excluded from checkout-equivalent set |
| Paired skill comparison | PASS | `.agents/skills` and `.claude/skills` have no diff |
| Flutter project tests | PASS | 11 tests |
| Flutter Web release build | PASS | `build/web` created |
| Raw diff group audit | PASS | 102 apply + 5 merge + 7 deactivated = 114 paths; zero unclassified/ledger-only; 463 byte-preserved + 2 merged project-only paths |
| U reconciliation audit | PASS | Zero missing; four lifecycle-self-audit records excluded |

## Manual QA Results

| Checklist Item | Result | Notes |
| --- | --- | --- |
| B/U/P provenance | PASS | B, U tag/SHA, and clean P are exact |
| Lock write order/content | PASS | Compatibility passed before exact U lock creation |
| Shared customization | PASS | README body preserved; TODO and docs CI merged pathwise |
| Runtime preservation | PASS | No diff in runtime/source/tests/dependencies; project tests/build pass |
| Obsolete cleanup | PASS | Seven B=P/U-absent paths deactivated under deletion guard |
| Template-self history exclusion | PASS | All four lifecycle-self-audit paths absent |

## Acceptance Criteria Coverage

| ID | Result | Evidence |
| --- | --- | --- |
| AC-001 | PASS | Lock JSON and upstream tag both resolve to U |
| AC-002 | PASS | Artifact ledger: 102 apply + 5 merge + 7 deactivated = 114 paths, zero unclassified/missing; 463 byte-preserved + 2 merged project-only paths |
| AC-003 | PASS | Runtime diff and README body comparison are empty |
| AC-004 | PASS | Compatibility and strict schema fixtures pass separately |
| AC-005 | PASS | ACMR CI contract, wrappers, hooks, smoke, paired skills, lint pass |
| AC-006 | PASS | Blob/ref/discovery evidence and deactivated disposition |
| AC-007 | PASS | lifecycle-self-audit path scan is empty |
| AC-008 | PASS | 11 Flutter tests and Web release build pass |
| AC-009 | DEFERRED | Unscoped wrapper retains one pre-existing non-fatal guide reference warning; `Docs-Chore-14` owns strict cleanup and compatibility-scope review |

## Decision Conformance

| ID | Result | Why the implementation remains aligned |
| --- | --- | --- |
| DEC-001 | PASS | Immutable B/U/P and final U lock keep provenance reproducible |
| DEC-002 | PASS | Shared paths were merged and application paths were not edited |
| DEC-003 | PASS | Compatibility ran before strict markers/fixtures and final lock |
| DEC-004 | PASS | Upstream template lifecycle records were not imported |
| DEC-005 | PASS | Obsolete paths met all evidence gates and were deactivated rather than deleted |
| DEC-006 | PASS | CI uses fixed P, ACMR, full wrapper, and full checkout Markdown lint |

## Invariant Coverage

None

## Deferred / Not Covered

| ID | Reason | Follow-up |
| --- | --- | --- |
| Existing guide reference warning | Non-fatal pre-existing documentation hygiene outside migration scope | Review when the guide next changes |

## Residual Risks

- The P-scoped compatibility enforcement remains necessary while the unscoped wrapper has a guide reference warning. It must not be removed until `Docs-Chore-14` verifies a warning-free unscoped PASS and records the CI/local scope decision.

## Follow-up TODOs

- Docs-Chore-14: Resolve the pre-P guide reference warning, rerun unscoped validation, and review whether the P-scoped ACMR compatibility enforcement can be removed.
