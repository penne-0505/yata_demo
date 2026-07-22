---
title: "Docs Template v1.0.0 Migration Decisions"
status: active
draft_status: n/a
intent_schema: 2
created_at: 2026-07-22
updated_at: 2026-07-22
references:
  - "_docs/plan/Docs/docs-template-v1-migration/plan.md"
  - "_docs/qa/Docs/docs-template-v1-migration/test-plan.md"
  - "_docs/reference/Docs/docs-template-v1-migration/artifact-ledger.md"
related_issues: []
related_prs: []
---

# Docs Template v1.0.0 Migration Decisions

## Context

この repository は release provenance lock 導入前の template を利用しており、project 固有の Flutter application、README、TODO、docs CI を持つ。upstream の現行 branch ではなく、owner が指定した release tag と full SHA を更新単位にする必要がある。

## Decisions

### DEC-001: B/U/P を immutable provenance として扱う

- **What**: B、tag と full SHA を持つ U、clean commit P を migration の三点として固定し、compatibility PASS 後の最後の write で U の lock を作る。
- **Why**: moving branch tip や migration 中の working tree を基準にすると、取り込んだ内容と記録された provenance が分離するため。
- **Change freedom**: 三点と final lock が再現可能なら、inventory の生成方式や作業 branch 名は変更できる。

### DEC-002: Project artifact を upstream より優先して保持する

- **What**: application/runtime/source/tests/build/assets、project README、project docs は保持し、共有 path は blind replacement せず pathwise merge する。
- **Why**: template update は docs workflow の更新であり、YATA の runtime behavior や利用者向け説明を変更する authority を含まないため。
- **Change freedom**: project artifact の byte preservation と意味の保持を証明できるなら、検証用 hash や diff command は変更できる。

### DEC-003: Compatibility と strict schema を別 gate にする

- **What**: 新 validator を legacy-compatible に導入して未変更 docs を先に検証し、その後に type-specific schema marker と strict fixture coverage を有効化する。
- **Why**: validator 導入失敗と live document migration 失敗を分離し、premature lock advancement を防ぐため。
- **Change freedom**: failure attribution が保持されるなら、validator 実行順や fixture implementation は変更できる。

### DEC-004: Template-self history を downstream に複製しない

- **What**: upstream の lifecycle-self-audit Plan、Intent、QA、verification は migration 対象外とする。
- **Why**: upstream template 自身の実装履歴を project の active guidance として置くと、project decision と upstream provenance の境界が不明になるため。
- **Change freedom**: upstream history への参照が必要になった場合は tag/SHA を介して外部 provenance として参照できる。

### DEC-005: Obsolete cleanup を証拠条件で制限する

- **What**: B=P、live reference なし、project customization なし、U で削除または replacement 済みの path だけを active surface から除く。
- **Why**: upstream deletion は project record の削除 authority ではなく、project-owned content を誤って失わないため。
- **Change freedom**: active discovery から確実に外れ、内容の消失を回避できるなら、remove の代わりに quarantine/deactivation を選べる。

### DEC-006: CI と local closure evidence を同じ契約にする

- **What**: CI に ACMR scope、full validator wrapper、fixture/hook/smoke/paired checks を反映し、full Markdown lint は zero issue とする。
- **Why**: local-only PASS や追加 path だけの validation では、既存 docs の編集や paired skill drift を main で検出できないため。
- **Change freedom**:同じ path coverage と failure semantics を満たすなら、CI step の分割や command composition は変更できる。

## Consequences / Impact

docs workflow tooling と migration records が増える。application source と runtime artifact は変更しない。legacy Markdown の lint debt は local fixes または exact-file directives で閉じる。

## Quality Implications

- inventory と raw final diff の差集合をゼロにする。
- schema marker の type mismatch、unknown marker、duplicate key を fixture で拒否する。
- compatibility と strict schema の verdict を別々に記録する。
- P の application/project artifact hash が final tree で維持されることを確認する。

## Intent-derived Invariants

None

## Enforced in (optional)

None

## Rollback / Follow-ups

commit を採用しないことで rollback できる。remote state と main branch は変更しない。pre-P docs が strict-clean になるまでの compatibility scope 解除は `TODO.md` の `Docs-Chore-14` で追跡する。
