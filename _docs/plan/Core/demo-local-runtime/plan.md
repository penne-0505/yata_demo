---
title: Demo Local Runtime
status: active
draft_status: n/a
created_at: 2026-05-05
updated_at: 2026-05-06
references:
  - ../../../standards/documentation_guidelines.md
  - ../../../standards/documentation_operations.md
  - ../../../guide/demo-local-runtime/guide.md
related_issues: []
related_prs: []
---

## Overview
YATA を、認証・クラウド・マルチユーザー同期を前提にした業務アプリから、単一端末で業務フローを触れるデモ展示アプリへ切り替える。

狙いは Supabase 機能をただ隠すことではなく、注文、在庫、メニュー、売上確認という業務体験を起動直後から触れる状態にすること。公開デモではログインや空データは価値を伝えにくいため、固定デモユーザー、ローカル DB、seed data、no-op realtime を標準経路にする。

## Scope
- `main()` のデモ起動経路から `SupabaseClientService.initialize()` を外す。
- 認証状態を `demo-user` として固定し、`AuthGuard` による `/auth` 強制遷移をデモ経路で発生させない。
- `CrudRepository<T, String>` 契約を維持したまま、対象テーブルの delegate を Drift 実装へ差し替える。
- Drift schema を追加する。初期対象は以下とする。
  - `materials`
  - `material_categories`
  - `recipes`
  - `suppliers`
  - `stock_transactions`
  - `purchases`
  - `purchase_items`
  - `stock_adjustments`（既存 `StockOperationService` が参照するため、repository 差し替えの補助テーブルとして含める）
  - `menu_items`
  - `menu_categories`
  - `orders`
  - `order_items`
  - `daily_summaries`
  - `demo_seed_markers`（seed version と投入済み状態の管理用）
- デモ seed data を初回起動時に投入する。
- Realtime manager を no-op 実装へ差し替え、購読状態だけは成功扱いにする。
- CSV export をローカル DB から組み立てる経路へ寄せる。
- README または `_docs/guide/` に、デモモードの起動、データリセット、Supabase 非依存の前提を記録する。

## Non-Goals
- Supabase 連携の完全削除を最初のタスクでは行わない。
- 認証画面の UX 改修は対象外。デモ経路では通らないようにする。
- マルチユーザー分離、クラウド同期、外部バックアップは対象外。
- Supabase RPC と完全互換の export job 履歴管理は対象外。公開デモに必要な CSV 出力を優先する。
- 既存 UI の大規模再設計は対象外。業務フローを触れることを優先する。

## Requirements
- **Functional**: アプリ起動直後にログイン不要で `/order` に入り、注文作成、注文履歴、在庫確認、メニュー確認、売上サマリー確認がローカルデータで動作する。
- **Functional**: `demo-user` の `user_id` を持つデータとして読み書きできる。
- **Functional**: seed data はメニュー、材料、在庫、注文履歴、日次売上サマリーを含む。
- **Functional**: Realtime 購読開始/停止 API は成功し、UI 側の接続表示や refresh 前提を壊さない。
- **Functional**: CSV export は Supabase RPC なしで最低限のデータセットを出力できる。
- **Non-Functional**: Service/UI の変更は最小限にし、app wiring と infra local 実装で差し替える。
- **Non-Functional**: Supabase 依存の削除は段階的に行い、まず実行経路から外す。
- **Non-Functional**: 実装後は差分対象ファイルの `dart analyze` と対象ユニット/スモークテスト、可能ならデスクトップまたは web の起動確認を行う。

## Implementation Strategy
### 1. Demo runtime bootstrap
- `lib/main.dart` の Supabase 初期化をデモ経路で実行しない。
- 環境変数検証は logging / tracing のために残すが、Supabase URL/key 不足をデモ起動の警告以上にしない。
- `ProviderContainer` 作成時に demo overrides を渡せる構成を作る。

### 2. Demo auth
- `AuthRepositoryContract<UserProfile, AuthResponse>` のデモ実装を追加する。
- デモ実装は `demo-user` を常に現在ユーザーとして返し、refresh / signOut / callback はローカル完結にする。
- `AuthController` が起動時に認証済み状態へ遷移できることを確認する。
- `AuthGuard` 自体を壊さず、Provider override によって認証済み扱いにする。

### 3. Drift schema
- `drift`, `drift_flutter`, `sqlite3_flutter_libs`, `path`, `drift_dev` を追加する。
  - 現在の `.fvmrc` は Flutter 3.35.5 / Dart 3.9 系であり、既存 `riverpod_generator` が `source_gen ^2.0.0` を要求する。そのため Drift は `drift_dev 2.28.0` / `drift_flutter 0.2.7` 系で固定し、最新 2.32+ / 0.3+ 系への更新は SDK と generator 更新時に別途判断する。
- `lib/infra/local/database/` に `YataDemoDatabase` と table definitions を追加する。
- 既存 model の `toJson/fromJson` で使う snake_case key と Drift columns の対応を明示する。
- enum は既存 mapper/value を尊重し、DB には文字列として保存する。

### 4. Drift CRUD repository
- `CrudRepository<T, String>` を実装する `DriftCrudRepository<T>` を追加する。
- `create`, `bulkCreate`, `getById`, `updateById`, `deleteById`, `find`, `count` を既存 repository が使う範囲で実装する。
- `QueryFilter` / `OrderByCondition` は最初から全演算子対応を狙わず、現行 UI/Service が使う `eq`, `inList`, `gte`, `lte`, `isNull`, `ilike`, `or`, order/limit/offset を優先する。
- 未対応演算子は黙って無視せず、例外またはログで検知可能にする。
- 実装では既存 model の `toJson/fromJson` を維持し、`Supplier` / `DailySummary` の camelCase JSON とローカル DB の snake_case column は `DriftTableConfig` で対応付ける。

### 5. Provider wiring
- `GenericCrudRepository` の利用箇所をデモ経路では `DriftCrudRepository` に差し替える。
- 既存の feature repository wrapper は維持する。
- `RealtimeManagerContract` は `NoopRealtimeManager` へ差し替える。
- export repositories は `LocalCsvExportRepository` / `LocalCsvExportJobsRepository` へ差し替える。

### 6. Seed data
- 初回起動時に `DemoSeedService.ensureSeeded()` で deterministic seed を投入する。
- seed 済み判定は `demo_seed_markers` の `seed_key` / `seed_version` で管理し、毎起動で重複投入しない。
- `DemoSeedService.resetAndSeed()` をデモリセット用サービス境界として用意する。
- seed は現在日を基準に注文履歴と日次売上サマリーを作る。テストでは `clock` を注入して固定日付で検証する。

### 7. Local CSV export
- Supabase RPC ではなく Drift からデータを読み、`CsvExportRawResult` を返す。
- `sales_line_items`, `purchases_line_items`, `inventory_transactions`, `waste_log`, `menu_engineering_daily` を対象にする。
- `export_jobs` は `LocalCsvExportJobsRepository` の memory 実装で軽量記録する。
- 既存 `CsvExportService` の validation、rate limit、job log の境界は維持する。

### 8. Supabase dependency shrink
- 実行経路から Supabase が外れたことを確認した後、`supabase_flutter` / `gotrue` 依存削除の可否を調査する。
- すぐ消せない場合は、残存 import と理由を README または reference に明記する。

## Tasks
- `Core-Feat-5`: デモ起動経路と Provider override の入口を作る。完了。
- `Core-Feat-6`: 固定デモユーザー認証を実装する。完了。
- `Core-Feat-7`: Drift schema と database bootstrap を追加する。完了。
- `Core-Feat-8`: `DriftCrudRepository` と対象 repository wiring を追加する。完了。
- `Core-Feat-9`: seed data と reset service を追加する。完了。
- `Core-Refactor-10`: Realtime を no-op 化する。完了。
- `Core-Feat-11`: CSV export をローカル DB 実装へ差し替える。完了。
- `Docs-Doc-12`: デモモードの運用ドキュメントを更新する。完了。

## Test Plan
- `.fvm/flutter_sdk/bin/flutter pub get`
- `.fvm/flutter_sdk/bin/dart run build_runner build --delete-conflicting-outputs`
- 差分対象ファイルの `.fvm/flutter_sdk/bin/dart analyze`
  - リポジトリ全体の analyze は既存 lint が残っているため、デモ runtime とは別の cleanup として扱う
- `.fvm/flutter_sdk/bin/flutter test`
- Drift CRUD の unit test
  - create / bulkCreate / getById / updateById / deleteById / find / count
  - `eq`, `inList`, `gte`, `lte`, `isNull`, `ilike`, `or`, order/limit/offset
- Demo auth の unit test
  - 起動直後に `AuthState.isAuthenticated == true`
  - `currentUserIdProvider == "demo-user"`
  - `/auth` へ遷移した場合に `/order` へ戻る
- Seed の unit test
  - 初回投入される
  - 2回目起動で重複しない
  - reset 後に再投入される
- Demo runtime smoke test
  - `buildDemoOverrides()` で seeded Drift data を読み出せる
  - menu / order / inventory service が no-op Realtime で初期化できる
  - `CsvExportService` 経由で local CSV export が返る
- Export test
  - Supabase RPC なしで CSV 文字列が返る
  - 行数と header が期待通り

## Deployment / Rollout
- まず demo override を標準起動経路にする。
- Supabase 実装は削除せず残し、デモ経路の検証が通るまで fallback として保持する。
- デモ起動、注文作成、在庫変動、売上表示、CSV export が通ったら README を更新する。
- その後、Supabase 依存削除を別タスクとして実施可否判断する。

## Risks
- `QueryFilter` が Supabase/PostgREST 型に依存しているため、Drift 実装で完全互換を狙うと範囲が膨らむ。現行 UI/Service 使用分から実装し、未対応演算子を明示的に失敗させる。
- `AuthService` に Supabase session warm-up の概念が残っているため、demo auth だけでは一部 controller が待機する可能性がある。該当箇所は demo service または controller 側の小さな分岐で処理する。
- CSV export は既存 service が rate limit / job log を持つため、repository だけ差し替えても不要な制約が残る可能性がある。公開デモでは失敗しないことを優先し、job log は no-op から始める。
- 既存 `TODO.md` には `Core-Feat-4` が完了済みに近い内容で残っているが、現状コードには Drift 実装が見当たらない。今回の plan では現状コードを正として新規タスクを分割する。
