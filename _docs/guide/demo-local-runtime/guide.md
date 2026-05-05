---
title: Demo Local Runtime Guide
status: active
draft_status: n/a
created_at: 2026-05-06
updated_at: 2026-05-06
references:
  - ../../standards/documentation_guidelines.md
  - ../../standards/documentation_operations.md
  - ../../plan/Core/demo-local-runtime/plan.md
related_issues: []
related_prs: []
---

## Overview
このガイドは、YATA を展示用のローカルデモとして起動、検証、リセットするための運用手順をまとめる。

標準起動は `YATA_DEMO_MODE=true` で、Supabase を使わない。アプリは固定ユーザー `demo-user` として認証済みになり、Drift / SQLite のローカル DB に投入された seed data から注文、在庫、メニュー、売上、CSV export を動かす。

## Prerequisites
- Flutter は `.fvmrc` の `3.35.5` を使う。
- Dart / Flutter コマンドは `.fvm/flutter_sdk/bin/` 配下を使う。
- デモモードでは `.env` と Supabase 実値は不要。
- Supabase 経路を検証する場合だけ `YATA_DEMO_MODE=false` と Supabase 環境変数を用意する。

## Setup / Usage
依存関係と generated code を準備する。

```bash
.fvm/flutter_sdk/bin/flutter pub get
.fvm/flutter_sdk/bin/dart run build_runner build --delete-conflicting-outputs
```

デモモードで起動する。

```bash
.fvm/flutter_sdk/bin/flutter run -d linux
```

Supabase 経路を明示的に使う。

```bash
.fvm/flutter_sdk/bin/flutter run -d linux --dart-define=YATA_DEMO_MODE=false
```

起動時のデモ初期化は `lib/main.dart` に集約されている。`DemoRuntimeConfig.isEnabled` が true のとき、`buildDemoOverrides()` を `ProviderContainer` に適用し、settings load 後に `DemoSeedService.ensureSeeded()` を実行する。

## Demo Data
seed は `lib/infra/local/demo/demo_seed_service.dart` にある。`demo_seed_markers` に `yata-demo-core` と seed version を記録し、同一 version の重複投入を避ける。

初期データには次を含める。

- `materials`, `material_categories`
- `suppliers`
- `menu_items`, `menu_categories`, `recipes`
- `purchases`, `purchase_items`
- `stock_transactions`
- `orders`, `order_items`
- `daily_summaries`

データを初期状態へ戻す場合は `DemoSeedService.resetAndSeed()` を使う。テストでは in-memory DB に対して同じサービスを使うため、seed の再現性を保てる。

## Local Runtime Components
`buildDemoOverrides()` は次を差し替える。

- `authRepositoryProvider`: `DemoAuthRepository`
- `authServiceProvider`: 初期状態から authenticated
- `realtimeManagerProvider`: `NoopRealtimeManager`
- CRUD repository providers: `DriftCrudRepository`
- `csvExportRepositoryProvider`: `LocalCsvExportRepository`
- `csvExportJobsRepositoryProvider`: `LocalCsvExportJobsRepository`

`NoopRealtimeManager` は Supabase に接続しないが、`startMonitoring` / `stopMonitoring` / `getActiveSubscriptions` / `getStats` をローカル状態で返す。既存 Service/UI は接続済みとして扱える。

## CSV Export
CSV export は既存の `CsvExportService` を通す。デモ経路では repository が `LocalCsvExportRepository` に差し替わり、Supabase RPC ではなく Drift の query から CSV を組み立てる。

対応 dataset:

- `sales_line_items`
- `purchases_line_items`
- `inventory_transactions`
- `waste_log`
- `menu_engineering_daily`

デモ seed の organization / location は export request 上では `demo-org` / `demo-location` を使う。ローカル実装はマルチテナント分離ではなく、展示用 dataset の CSV 生成を優先している。

## Best Practices
- デモ runtime で必要な差し替えは `lib/app/wiring/override_demo.dart` に集約する。
- Service/UI を Supabase と Drift の両方に分岐させず、repository contract と provider override で吸収する。
- seed を変更する場合は `DemoSeedService.seedVersion` を上げ、`DemoSeedService` のテストも更新する。
- Drift schema を変更した場合は `schemaVersion` と migration を更新し、`build_runner` を実行する。
- Supabase 依存を削除する場合は、非デモ経路で残っている import と Auth/export 実装を先に整理する。
- 現時点のリポジトリ全体 `dart analyze` は既存 lint で失敗する。デモ runtime の変更確認では差分対象ファイルの `dart analyze` と `flutter test` を最低ラインにする。

## Troubleshooting
`flutter` コマンドが想定外の Dart SDK を使う場合:

```bash
.fvm/flutter_sdk/bin/flutter --version
```

`.env` がないというログが出る:
デモモードでは正常。Supabase 初期化はスキップされ、必須環境変数の不足は起動ブロッカーにならない。

Drift の generated file と schema がずれる:

```bash
.fvm/flutter_sdk/bin/dart run build_runner build --delete-conflicting-outputs
```

CSV export が rate limit で失敗する:
`CsvExportService` の既存 rate limit は維持されている。デモ中に連続 export する場合は時間を空けるか、テストでは新しい `ProviderContainer` / `LocalCsvExportJobsRepository` を使う。

## References
- `README.md`
- `_docs/plan/Core/demo-local-runtime/plan.md`
- `lib/app/wiring/override_demo.dart`
- `lib/infra/local/demo/demo_seed_service.dart`
- `lib/infra/local/export/local_csv_export_repository.dart`
- `lib/infra/realtime/noop_realtime_manager.dart`
