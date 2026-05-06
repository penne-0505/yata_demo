---
title: Cloudflare Pages Deployment Guide
status: active
draft_status: n/a
created_at: 2026-05-06
updated_at: 2026-05-06
references:
  - _docs/guide/demo-local-runtime/guide.md
related_issues: []
related_prs: []
---

# Cloudflare Pages デプロイ手順

## Overview

このガイドは、Cloudflare アカウント作成のみが完了している状態から、GitHub Actions 経由で YATA Demo の Web 版を Cloudflare Pages にデプロイする手順をまとめる。

YATA Demo の公開ビルドでは、必ず次の Dart define を指定する。

```bash
flutter build web --dart-define=YATA_DEMO_MODE=true
```

このリポジトリでは `.github/workflows/deploy-web.yml` が `main` への push と手動実行で Web ビルドを作成し、`build/web/` を Cloudflare Pages へアップロードする。Cloudflare Pages 側で Flutter を直接ビルドするのではなく、GitHub Actions 上で Flutter 3.35.5 をセットアップしてビルドする構成にしている。

この構成の意図は、Cloudflare Pages の build image に Flutter SDK が標準であることへ依存しないことにある。Cloudflare Pages は静的成果物の配信に寄せ、Flutter build の責務は GitHub Actions に置く。

## Prerequisites

- Cloudflare アカウントが作成済みであること。
- GitHub リポジトリにこのプロジェクトが push 済みであること。
- GitHub Actions を利用できること。
- Cloudflare Pages の project name として `yata-demo` を使う前提で進めること。

ローカル確認には、リポジトリの Flutter SDK を使う。

```bash
.fvm/flutter_sdk/bin/flutter build web --release --dart-define=YATA_DEMO_MODE=true
```

## Setup / Usage

### 1. Cloudflare Pages プロジェクトを作成する

1. [Cloudflare Dashboard](https://dash.cloudflare.com/) にアクセスする。
2. **Workers & Pages** を開く。
3. **Create application** を選ぶ。
4. **Pages** の作成画面へ進む。
5. Git provider の接続が求められた場合は、GitHub を接続して対象リポジトリへのアクセスを許可する。
6. Project name に `yata-demo` を指定する。

Cloudflare Pages の Git integration を使って Cloudflare 側でビルドする構成も選べるが、このプロジェクトでは `.github/workflows/deploy-web.yml` から `build/web/` をアップロードする。Cloudflare 側の build command / build output directory を設定する場合でも、実際の継続デプロイは GitHub Actions 側を正とする。

### 2. Cloudflare API Token を作成する

1. Cloudflare Dashboard 右上のユーザーアイコンから **My Profile** を開く。
2. **API Tokens** を開く。
3. **Create Token** を選ぶ。
4. **Custom token** を選ぶ。
5. token name に `GitHub Actions YATA Demo Pages Deploy` など用途が分かる名前を付ける。
6. Permissions に次を設定する。
   - Account / Cloudflare Pages / Edit
   - User / User Details / Read
7. Account Resources は `yata-demo` を作成する対象アカウントに絞る。
8. **Continue to summary** で内容を確認し、**Create Token** を実行する。
9. 表示された token を控える。

API Token は再表示できない。GitHub Secrets に登録した後は、ローカルファイルやドキュメントに残さない。

token 作成後、Cloudflare の token 一覧で **Test** を実行し、有効な token として検証できることを確認する。

### 3. Cloudflare Account ID を確認する

Cloudflare Dashboard で対象アカウントを開き、Account ID を確認する。表示位置は Cloudflare Dashboard の UI 変更で変わることがあるが、Workers & Pages やアカウント概要の API / Account details 周辺に表示される。

Account ID は、API Token の Account Resources で許可したアカウントと一致している必要がある。複数アカウントを持っている場合、ここがずれると Wrangler はログイン済み表示になっても Pages project の取得で `Authentication error [code: 10000]` になる。

### 4. GitHub Secrets を登録する

GitHub リポジトリで次を登録する。

1. **Settings** を開く。
2. **Secrets and variables** > **Actions** を開く。
3. **New repository secret** を選ぶ。
4. 次の 2 つを作成する。

| Secret name | Value |
| --- | --- |
| `CLOUDFLARE_API_TOKEN` | 手順 2 で作成した Cloudflare API Token |
| `CLOUDFLARE_ACCOUNT_ID` | 手順 3 で確認した Cloudflare Account ID |

### 5. GitHub Actions からデプロイする

`.github/workflows/deploy-web.yml` は次の条件で実行される。

- `main` branch への push
- GitHub Actions 画面からの `workflow_dispatch`

初回は GitHub の **Actions** タブから **Deploy Web to Cloudflare Pages** を選び、**Run workflow** で手動実行するのが確認しやすい。

workflow は次の順に実行される。

1. repository checkout
2. Flutter 3.35.5 のセットアップ
3. `flutter pub get`
4. `flutter build web --release --dart-define=YATA_DEMO_MODE=true`
5. `cloudflare/wrangler-action@v3` で `build/web/` を Cloudflare Pages project `yata-demo` へ deploy

成功後、Cloudflare Pages の deployment URL または `https://yata-demo.pages.dev` を開く。

### 6. 公開後の確認

次を確認する。

- `/order` を開ける。
- 注文作成、注文履歴、在庫、メニュー、売上確認へ遷移できる。
- デモデータが表示される。
- ページをリロードしても route が 404 にならない。
- Web 版ではリロードによりインメモリ DB が初期化される。

## Best Practices

- `YATA_DEMO_MODE=true` を必ず付けて Web ビルドする。
- Supabase 接続を使う公開ビルドに切り替える場合は、このガイドとは別に環境変数、Auth、Realtime、データ保護の運用手順を作る。
- Cloudflare API Token は最小権限にし、GitHub Secrets 以外へ保存しない。
- Cloudflare Pages project name を変える場合は、`.github/workflows/deploy-web.yml` の `pages deploy build/web --project-name=...` も同時に更新する。
- SPA の直接アクセスを維持するため、`web/_redirects` を削除しない。

## Troubleshooting

### GitHub Actions が `CLOUDFLARE_API_TOKEN` を見つけられない

GitHub repository の Actions secrets に `CLOUDFLARE_API_TOKEN` が登録されているか確認する。Environment secrets ではなく repository secrets に入れる構成が最も単純。

### Cloudflare Pages の権限エラーになる

`/accounts/***/pages/projects/yata-demo` への request で `Authentication error [code: 10000]` が出る場合、ビルドではなく Cloudflare API Token の権限か account/project の紐づきが原因。

確認すること:

- `CLOUDFLARE_API_TOKEN` が古い token のままではない。
- token permissions に `Account / Cloudflare Pages / Edit` が含まれている。
- token permissions に `User / User Details / Read` が含まれている。
- token の Account Resources が、`CLOUDFLARE_ACCOUNT_ID` の account を許可している。
- `yata-demo` Pages project が、その `CLOUDFLARE_ACCOUNT_ID` の account 側に存在している。
- GitHub Secrets の `CLOUDFLARE_ACCOUNT_ID` に別 account の ID を入れていない。

token の権限は後から既存 token を細かく直すより、上記 permissions で作り直して GitHub Secrets の `CLOUDFLARE_API_TOKEN` を差し替える方が確実。

### `build/web` が見つからない

workflow の Flutter build が失敗している。Actions log の `Build web` step を確認し、`flutter pub get` や build error を先に解消する。

### `/order` などを直接開くと 404 になる

`web/_redirects` が build output に含まれていない可能性がある。ローカルで次を確認する。

```bash
.fvm/flutter_sdk/bin/flutter build web --release --dart-define=YATA_DEMO_MODE=true
test -f build/web/_redirects
```

`_redirects` の内容は次の 1 行にする。

```text
/* /index.html 200
```

### 公開したアプリが Supabase 接続を要求する

`YATA_DEMO_MODE=true` なしでビルドされている。`.github/workflows/deploy-web.yml` の build command が次の形になっているか確認する。

```bash
flutter build web --release --dart-define=YATA_DEMO_MODE=true
```

## References

- [Cloudflare Pages: Git integration](https://developers.cloudflare.com/pages/get-started/git-integration/)
- [Cloudflare Pages: Build configuration](https://developers.cloudflare.com/pages/configuration/build-configuration/)
- [Cloudflare Pages: Use Direct Upload with continuous integration](https://developers.cloudflare.com/pages/how-to/use-direct-upload-with-continuous-integration/)
- [Demo local runtime guide](../demo-local-runtime/guide.md)
