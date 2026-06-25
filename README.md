# YATA Demo

<img width="1901" height="1165" alt="image" src="https://github.com/user-attachments/assets/1db80c2e-af97-4d1c-a154-d427c11e09cd" />
<img width="1901" height="1165" alt="image" src="https://github.com/user-attachments/assets/0e9e26ab-7098-4e8d-8263-db4764af8d63" />
<img width="1901" height="1165" alt="image" src="https://github.com/user-attachments/assets/33ba108e-2efb-4f82-869c-c6635031913f" />
<img width="1901" height="1165" alt="image" src="https://github.com/user-attachments/assets/cfc1b92e-524e-4340-92d8-61d083905e77" />
<img width="1901" height="1165" alt="image" src="https://github.com/user-attachments/assets/7c570681-a65c-4fd7-943a-6a0982f4aac5" />
<img width="1901" height="1165" alt="image" src="https://github.com/user-attachments/assets/9de22869-69a4-45e1-84eb-1bc1ad83fe5e" />


YATA は、小規模な飲食・屋台オペレーション向けの注文、在庫、メニュー、売上確認アプリです。
**このリポジトリはローカルデモです。**ログイン、Supabase 初期化、Realtime 接続、Supabase RPC を**使わず**、固定ユーザーと Drift のローカル DB だけで主要な業務フローを触れます。(本来はこれらスタックを用いる前提の実装です。)

## 現在の runtime

- 標準: `YATA_DEMO_MODE=true`
- 認証: `demo-user` として起動直後から認証済み
- DB: Drift / SQLite の `yata_demo`
- 初期データ: 起動時に `DemoSeedService.ensureSeeded()` が投入
- Realtime: `NoopRealtimeManager` が接続済み扱いで購読を保持
- CSV export: `LocalCsvExportRepository` がローカル DB から CSV を生成

Supabase 実装と依存はまだ残していますが、標準のデモ経路では `SupabaseClientService.initialize()`、Supabase Auth、Realtime、RPC export を呼びません。Supabase 経路を使う場合だけ `--dart-define=YATA_DEMO_MODE=false` を指定します。

## セットアップ

このプロジェクトは FVM の Flutter 3.35.5 を前提にしています。

```bash
.fvm/flutter_sdk/bin/flutter pub get
.fvm/flutter_sdk/bin/dart run build_runner build --delete-conflicting-outputs
```

デモモードでは `.env` に Supabase の実値は不要です。`EnvValidator` は `.env` がなくても起動を継続し、Supabase 必須値の不足をデモ起動のブロッカーにしません。

## 起動

```bash
.fvm/flutter_sdk/bin/flutter run -d linux
```

デモ起動後は `/order` を入口に、注文作成、注文履歴、在庫確認、メニュー確認、売上分析プレビュー、CSV export をローカルデータで試せます。

## 配布版とログ

Linux AppImage や Windows portable zip でも標準はローカルデモモードです。`.env` を同梱しない限り Supabase へ接続せず、ログはアプリのサポートディレクトリに `app-YYYYMMDD-NN.log` 形式の NDJSON として保存されます。

Windows 配布物は単体 exe ではなく、`yata_demo.exe`、`flutter_windows.dll`、`data/` などをまとめた portable zip です。zip を展開して `yata_demo.exe` を起動します。

開発用に `.env` で `LOG_DIR=./_logs` を指定した場合だけ、カレントディレクトリ基準の `_logs/` に保存されます。`.env` と `_logs/` は公開リポジトリへ含めない前提です。

Supabase 経路を明示的に使う場合:

```bash
.fvm/flutter_sdk/bin/flutter run -d linux --dart-define=YATA_DEMO_MODE=false
```

この場合は `SUPABASE_URL` と `SUPABASE_ANON_KEY` を `.env`、OS 環境変数、または `--dart-define` で設定してください。

## デモデータ

初回起動時に `demo_seed_markers` を確認し、seed version が未適用なら次のデータを投入します。

- 材料カテゴリ、材料、仕入先
- メニューカテゴリ、メニュー、レシピ
- 仕入、在庫トランザクション、廃棄ログ
- カート、注文履歴、注文明細
- 日次売上サマリー

売上分析画面は公開デモ向けの固定プレビューとして、KPI、売上トレンド、カテゴリ構成、時間帯分析、分析結果を表示します。現時点では `AnalyticsService` や `DailySummaryRepository` に接続せず、presentation 層だけで表示を完結させています。

デモデータを初期状態に戻す場合は、開発用コードやテストから `DemoSeedService.resetAndSeed()` を呼びます。`ensureSeeded()` は同一 seed version の重複投入を防ぎます。

## CSV export

ローカル export は次の dataset に対応しています。

- `sales_line_items`
- `purchases_line_items`
- `inventory_transactions`
- `waste_log`
- `menu_engineering_daily`

既存の `CsvExportService` は維持し、repository と job log をデモ経路で `LocalCsvExportRepository` / `LocalCsvExportJobsRepository` に差し替えています。Supabase RPC は使いません。

## Web 版のビルドとデプロイ

ブラウザからデモを試せる Web 版をビルドできます。

```bash
.fvm/flutter_sdk/bin/flutter build web --release --dart-define=YATA_DEMO_MODE=true
```

ビルド成果物は `build/web/` に出力されます。

### 注意事項

- **レスポンシブ対応はしていません**。本アプリはタブレットなどでの使用を見越して開発したため、PC ブラウザでの使用を前提としています。スマートフォンでの表示はスコープ外です。
- **Web 版はインメモリ DB** を使用します。ページをリロードするとデモデータが初期状態に戻ります。
- **ログ出力は Console のみ** です。ファイルログは出力されません。

### Cloudflare Pages へのデプロイ

詳細は `_docs/guide/deployment/cloudflare-pages.md` を参照してください。GitHub Actions で自動デプロイする場合：

1. Cloudflare Dashboard で API トークンを作成
2. GitHub リポジトリの Secrets に `CLOUDFLARE_API_TOKEN` と `CLOUDFLARE_ACCOUNT_ID` を設定
3. `.github/workflows/deploy-web.yml` が push 時に自動実行されます

## 検証

```bash
.fvm/flutter_sdk/bin/flutter test
```

今回のデモ runtime は、差分対象ファイルの `dart analyze` と、seed、Drift CRUD、no-op Realtime、local CSV export、provider wiring のテストで検証しています。リポジトリ全体の `dart analyze` は既存 lint が残っているため、全体 lint の解消は別作業として扱います。詳細は `_docs/guide/demo-local-runtime/guide.md` と `_docs/plan/Core/demo-local-runtime/plan.md` を参照してください。
