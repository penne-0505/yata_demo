---
title: "Docs Template v1.0.0 Migration Plan"
status: active
draft_status: n/a
created_at: 2026-07-22
updated_at: 2026-07-22
references:
  - "_docs/intent/Docs/docs-template-v1-migration/decision.md"
  - "_docs/qa/Docs/docs-template-v1-migration/test-plan.md"
  - "_docs/reference/Docs/docs-template-v1-migration/artifact-ledger.md"
related_issues: []
related_prs: []
---

# Docs Template v1.0.0 Migration Plan

## Overview

`yata_demo` の legacy docs template を、既存アプリケーションと project 固有資料を保持したまま、upstream release `v1.0.0` へ provenance-locked migration する。

## Scope

- clean cutoff P `43314d34037e54ad967ea09c809f353e6710f6a8`
- legacy baseline B `1f7c92c53fa9df63de05da046a049507fcb4efac`
- upstream tag `v1.0.0` / U `f71e9ab20466ea2972158334261f5ae2b2265754`
- validators、fixtures、standards、templates、paired skills、hooks、CI
- compatibility validation、strict schema validation、最終 provenance lock
- raw final diff と migration inventory の完全照合
- 継続 task `Docs-Chore-14` による compatibility scope の解除条件管理

## Non-Goals

- application/runtime/source/tests/build/assets の変更
- project README の template README への置換
- project docs の内容変更。ただし本 migration の Plan、Intent、QA、ledger は追加する
- upstream template 自身の lifecycle self-audit Plan、Intent、QA history の導入
- dependency update、Flutter SDK update、remote push、main branch 更新

## Requirements

- **Functional**: B/U/P の path union を upstream delta と project relation の二軸で分類し、各 path に `apply`、`merge`、`keep`、`remove`、`defer` の resolution と別個の disposition を記録する。
- **Functional**: compatibility gate を通過するまで `docs-template.lock.json` を作らず、lock を最後の migration write とする。
- **Functional**: schema marker は document type と一致させ、unknown marker と重複 frontmatter key を fixture で拒否する。
- **Non-Functional**: CI は `DD_SCOPE_DIFF_FILTER=ACMR` を用い、local/CI の validator command を一致させる。
- **Non-Functional**: `DD_SCOPE_BASE=P` の compatibility scope は pre-P docs が strict-clean になるまで維持する。解除は別 task で unscoped PASS を確認した場合だけ行う。
- **Non-Functional**: full repository Markdown lint を zero issue にする。広域 ignore は追加せず、local fixes または exact-file directives だけを使う。
- **Non-Functional**: obsolete artifact cleanup は B=P、参照なし、project customization なし、U で削除または replacement 済みの全条件を満たす path に限定する。

## Tasks

1. P の branch、dirty manifest、ownership、baseline results を固定する。
2. B→U と B→P の三者 inventory を作る。
3. U の validator/fixture を compatibility mode で導入し、未変更 project docs に対して実行する。
4. standards、templates、paired skills、hooks、CI、root guidance を pathwise に統合する。
5. project docs を strict schema 対象として分類し、必要な marker と fixtures を検証する。
6. active stale jj/OpenCode artifacts を exact cleanup 条件に従って除外する。
7. compatibility PASS 後に最終 lock を作る。
8. unscoped/scoped docs、full lint、fixtures、hooks、smoke、paired skills、Flutter tests/build、diff preservation を検証し、unscoped strict-clean までは `Docs-Chore-14` で compatibility scope を維持する。

## QA Plan

- QA document: `_docs/qa/Docs/docs-template-v1-migration/test-plan.md`
- Risk level: Medium
- Unit: validator fixtures と hook unit tests
- Integration: `scripts/check-docs.sh`、agent workflow smoke、paired skill comparison
- Manual QA: raw diff inventory、provenance、project customization preservation
- Validator / static check: full Markdown lint、frontmatter/intent/QA/TODO/link validators
- DEC review: DEC-001〜DEC-006 の Why と Change freedom を final diff に照合する

## Deployment / Rollout

isolated worktree の専用 branch に P の direct child を 1 commit 作成する。push、main/ref 更新は行わない。rollback はこの child commit を採用しないことで完了する。initial migration 後の compatibility scope 解除は `TODO.md` の `Docs-Chore-14` が管理する。
