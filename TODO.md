# Project Task Management Rules

## 0. System Metadata
- **Current Max ID**: `Next ID No: 13` (※タスク追加時にインクリメント必須)
- **ID Source of Truth**: このファイルの `Next ID No` 行が、全プロジェクトにおける唯一のID発番元である。

## 1. Task Lifecycle (State Machine)
タスクは以下の順序で単方向に遷移する。逆行は原則禁止とする。

### Phase 0: Inbox (Human Write-only)
- **Location**: `# Inbox (Unsorted)` セクション
- **Description**: 人間がアイデアや依頼を書き殴る場所。フォーマット不問。ID未付与。
- **Exit Condition**: LLMが内容を解析し、IDを付与して `Backlog` へ構造化移動する。

### Phase 1: Backlog (Structured)
- **Location**: `# Backlog` セクション
- **Status**: タスクとして認識済みだが、着手準備未完了。
- **Entry Criteria**: 
  - IDが一意に採番されている。
  - 必須フィールド（Title, ID, Priority, Size, Area, Description）が埋まっている。
- **Exit Condition**: `Ready` の要件を満たす。

### Phase 2: Ready (Actionable)
- **Location**: `# Ready` セクション
- **Status**: いつでも着手可能な状態。
- **Entry Criteria**:
  - **Plan Requirement**:
    - `Size: M` 以上 (M, L, XL): `Plan` フィールドに有効な `_docs/plan/...` へのリンクが**必須**。
    - `Size: S` 以下 (XS, S): `Plan` は **None** でよい。
  - **Dependencies**: 解決済み（または明確化済み）である。
  - **Steps**: 具体的な実行手順（またはPlanへのポインタ）が記述されている。
- **Exit Condition**: 作業者がタスクに着手する。

### Phase 3: In Progress
- **Location**: `# In Progress` セクション
- **Status**: 現在実行中。
- **Entry Criteria**: 作業者がアサインされている（または自律的に着手）。

### Phase 4: Done
- **Location**: なし（行削除）
- **Exit Action**: `Goal` 達成を確認後、リストから物理削除する。

## 2. Schema & Validation
各タスクは以下の厳格なスキーマに従うこと。

| Field | Type | Constraint / Value Set |
| :--- | :--- | :--- |
| **Title** | `String` | `[Category] Title` 形式。Categoryは後述のEnum参照。 |
| **ID** | `String` | `{Area}-{Category}-{Number}` 形式。不変の一意キー。 |
| **Priority** | `Enum` | `P0` (Critical), `P1` (High), `P2` (Medium), `P3` (Low) |
| **Size** | `Enum` | `XS` (<0.5d), `S` (1d), `M` (2-3d), `L` (1w), `XL` (>2w) |
| **Area** | `Enum` | タスクの論理的な対象領域を表す値。`Plan` がある場合は原則として `_docs/plan/<Area>/...` 配下に対応付ける。 |
| **Dependencies**| `List<ID>`| 依存タスクIDの配列 `[Core-Feat-1, UI-Bug-2]`。なしは `[]`。 |
| **Goal** | `String` | 完了条件（Definition of Done）。 |
| **Steps** | `Markdown` | 進行管理用のチェックリスト（詳細は後述）。 |
| **Description** | `String` | タスクの詳細。 |
| **Plan** | `Path` | `Size >= M` の場合必須。`_docs/plan/` へのパス。`Size < M` は `None` 可。 |

## 3. Field Usage Guidelines

### Area & Directory Mapping
- **Rule**: `Area` フィールドはタスクの論理的な対象領域を表す分類ラベルとして扱う。
- **Planとの対応**: `Plan` が存在する場合は、原則として `Area` に対応する `_docs/plan/<Area>/...` 配下へ配置する。
- **New Area**: 新しい領域のタスクを作成する場合、`Size >= M` などで `Plan` が必要になった時点で、必要に応じて `_docs/plan/<Area>/` を作成する。
- **Example**:
  - `Area: Core` かつ `Plan: _docs/plan/Core/auth-feature.md`
  - `Area: Docs` かつ `Plan: None`

### Steps vs Plan
タスクの規模に応じて `Steps` の記述方針を切り替えること。情報の二重管理を避ける。

- **Case A: Planあり (Size >= M)**
  - `Steps` は **「Planを実行するための進行管理チェックリスト」** として機能する。
  - 詳細な仕様やコードは Plan に記述し、Steps には複製しない。
  - 例: `1. [ ] Planの "DB Schema" セクションに従いマイグレーション作成`

- **Case B: Planなし (Size < M)**
  - `Steps` に **「具体的な作業手順」** を直接記述する。
  - 例: `1. [ ] src/utils/format.ts の dateFormat 関数を修正`

## 4. Defined Enums

### Categories (Title & ID)
ID生成およびタイトルのプレフィックスには以下のみを使用する。
- `Feat` (New Feature)
- `Enhance` (Improvement)
- `Bug` (Fix)
- `Refactor` (Code Structuring)
- `Perf` (Performance)
- `Doc` (Documentation)
- `Test` (Testing)
- `Chore` (Maintenance/Misc)

### Areas (Examples)
**※`Area` は論理的な分類ラベルであり、`Plan` がある場合に原則 `_docs/plan/<Area>/...` と対応する。**
- `Core`: 基盤ロジック
- `UI`: プレゼンテーション層
- `Docs`: ドキュメント整備自体
- `General`: 特定ドメインに属さない雑多なタスク
- `DevOps`: CI/CD, 環境構築

## 5. Operational Workflows (for LLM)

### [Action] Create Task from Inbox
1. `Next ID No` を読み取り、割り当て予定のIDを決定する。
2. `Next ID No` をインクリメントしてファイルを更新する。
3. Inboxの内容を解析し、最適な `Area` と `Category` を決定する。
4. IDを生成する（例: `Core-Feat-24`）。
5. タスクをフォーマットし、`Backlog` の末尾に追加する。
6. 元のInbox行を削除する。

### [Action] Promote to Ready
1. **Size check**:
   - `Size >= M` ならば、`Plan` フィールドが有効なリンクであることを検証する。リンク切れや未作成の場合は移動を拒否する。
   - `Size < M` ならば、`Plan` が `None` でも許容する。
2. **Steps check**: `Steps` が具体的か（あるいはPlanへのポインタとして機能しているか）確認する。
3. **Dependency check**: 依存タスクが完了済みか確認する。
4. 全てクリアした場合のみ `Ready` セクションへ移動する。

## 6. Task Definition Examples (Few-Shot)

以下の例を参考に、サイズ（Size）に応じた記述ルール（Planの有無、Stepsの粒度）を厳守すること。

### Case A: Feature Implementation (Size >= M)
**Rule**: `Plan` へのリンクが必須。`Steps` はPlanの参照ポインタとして記述する。

```markdown
- **Title**: [Feat] User Authentication Flow
- **ID**: Core-Feat-25
- **Priority**: P0
- **Size**: M
- **Area**: Core
- **Dependencies**: []
- **Goal**: ユーザーがEmail/Passwordでサインアップおよびログインできる状態にする。
- **Steps**:
  1. [ ] Planの "Schema Design" セクションに基づき、Userテーブルのマイグレーションを作成・適用
  2. [ ] Planの "API Specification" に従い、`/auth/login` エンドポイントを実装
  3. [ ] Planの "Security" に記載されたJWT発行ロジックを実装
  4. [ ] E2Eテストを実施し、ログインフローの疎通を確認
- **Description**: 新規サービスの基盤となる認証機能を実装する。
- **Plan**: `_docs/plan/Core/auth-feature.md`
````

### Case B: Small Fix / Maintenance (Size \< M)

**Rule**: `Plan` は `None` でよい。`Steps` に具体的なコード修正手順を記述する。

```markdown
- **Title**: [Bug] Fix typo in Submit button
- **ID**: UI-Bug-26
- **Priority**: P2
- **Size**: XS
- **Area**: UI
- **Dependencies**: []
- **Goal**: ログイン画面のボタンのラベルが "Subimt" から "Submit" に修正されている。
- **Steps**:
  1. [ ] `src/components/LoginForm.tsx` を開く
  2. [ ] Submitボタンのラベル文字列を修正する
  3. [ ] ブラウザで表示を確認し、レイアウト崩れがないか確認
- **Description**: ユーザーから報告された誤字の修正。
- **Plan**: None
```

### Case C: New Area / Doc Task (Size S)

**Rule**: `Plan: None` のタスクでは、Area定義のためだけに `_docs/plan/` 配下のディレクトリ作成は不要。

```markdown
- **Title**: [Doc] Add Deployment Guide
- **ID**: DevOps-Doc-27
- **Priority**: P1
- **Size**: S
- **Area**: DevOps
- **Dependencies**: [Core-Feat-25]
- **Goal**: 新メンバー向けのデプロイ手順書が `_docs/guide/deployment.md` に作成されている。
- **Steps**:
  1. [ ] `_docs/guide/deployment.md` を作成し、ステージング環境へのデプロイ手順を記述
  2. [ ] 必要に応じて関連する参照先やリンクを更新
- **Description**: オンボーディングコスト削減のため、暗黙知になっているデプロイ手順をドキュメント化する。
- **Plan**: None
```

--- 

## Inbox
- 

---

## Backlog


- **Title**: [Chore] Review and customize AGENTS.md
- **ID**: Docs-Chore-1
- **Priority**: P2
- **Size**: XS
- **Area**: Docs
- **Dependencies**: []
- **Goal**: `AGENTS.md` がプロジェクトのニーズに応じて必要に応じて編集されている。
- **Steps**:
  1. [ ] `AGENTS.md` を開き、既存の内容を確認
  2. [ ] 必要に応じて編集（特定コマンドの使用指示など）
  3. [ ] 変更を保存
- **Description**: AGENTS.mdをレビューし、プロジェクトの要件に応じてカスタマイズする。
- **Plan**: None

- **Title**: [Chore] Customize README.md for project
- **ID**: Docs-Chore-2
- **Priority**: P0
- **Size**: S
- **Area**: Docs
- **Dependencies**: []
- **Goal**: `README.md` がプロジェクトの概要、目的、使用方法に合わせて編集されている。
- **Steps**:
  1. [ ] 現在のREADME.mdを確認
  2. [ ] プロジェクト名、概要、説明をプロジェクトに合わせて書き換え
  3. [ ] 使用方法セクションを編集
  4. [ ] 不要なテンプレート固有の記述を削除または修正
  5. [ ] 変更を保存
- **Description**: README.mdをテンプレートからプロジェクト固有の内容に書き換える。
- **Plan**: None

- **Title**: [Chore] Update LICENSE.txt author attribution
- **ID**: Docs-Chore-3
- **Priority**: P2
- **Size**: XS
- **Area**: Docs
- **Dependencies**: []
- **Goal**: `LICENSE.txt` の著作者名が正しいものに編集されている。
- **Steps**:
  1. [ ] `LICENSE.txt` を開き、著作者名を確認
  2. [ ] 正しい著作者名に編集
  3. [ ] 変更を保存
- **Description**: LICENSEファイルの著作者表示をプロジェクトに合わせて更新する。
- **Plan**: None

- **Title**: [Feat] Demo Runtime Bootstrap
- **ID**: Core-Feat-5
- **Priority**: P0
- **Size**: M
- **Area**: Core
- **Dependencies**: []
- **Goal**: デモ起動経路で Supabase 初期化を呼ばず、Provider override を通じてローカル実装へ差し替えられる入口が用意されている。
- **Steps**:
  1. [x] Plan の "Demo runtime bootstrap" に従い、`lib/main.dart` の Supabase 初期化をデモ経路から外す
  2. [x] demo 用 override builder を `lib/app/wiring/` 配下に追加する
  3. [x] `ProviderContainer` 作成時に demo overrides を適用する
  4. [x] Supabase URL/key が未設定でもデモ起動が継続することを確認する
- **Description**: 認証・DB・Realtime の差し替え前提となるデモ専用 runtime bootstrap を作る。
- **Plan**: `_docs/plan/Core/demo-local-runtime/plan.md`

- **Title**: [Feat] Fixed Demo User Auth
- **ID**: Core-Feat-6
- **Priority**: P0
- **Size**: M
- **Area**: Core
- **Dependencies**: [Core-Feat-5]
- **Goal**: 起動直後に `demo-user` として認証済み扱いになり、`/auth` を経由せず主要画面へ入れる。
- **Steps**:
  1. [x] Plan の "Demo auth" に従い、`AuthRepositoryContract` のデモ実装を追加する
  2. [x] `authRepositoryProvider` を demo override で差し替える
  3. [x] `currentUserIdProvider` が `demo-user` を返すことをテストする
  4. [x] `AuthGuard` が `/order` への表示を妨げないことを確認する
- **Description**: Google OAuth と Supabase session warm-up を公開デモ経路から外し、固定ユーザーで業務フローを開始できるようにする。
- **Plan**: `_docs/plan/Core/demo-local-runtime/plan.md`

- **Title**: [Feat] Drift Demo Database Schema
- **ID**: Core-Feat-7
- **Priority**: P0
- **Size**: M
- **Area**: Core
- **Dependencies**: [Core-Feat-5]
- **Goal**: デモ対象テーブルの Drift schema と database bootstrap が追加され、build_runner で生成コードを作れる。
- **Steps**:
  1. [x] Plan の "Drift schema" に従い、Drift 関連依存を `pubspec.yaml` に追加する
  2. [x] `lib/infra/local/database/` に `YataDemoDatabase` と対象 table definitions を追加する
  3. [x] enum と DateTime の保存形式を既存 model の JSON key と対応させる
  4. [x] `dart run build_runner build --delete-conflicting-outputs` が通ることを確認する
- **Description**: Supabase テーブル相当のローカル永続化基盤を Drift で作る。
- **Plan**: `_docs/plan/Core/demo-local-runtime/plan.md`

- **Title**: [Feat] Drift CRUD Repository Wiring
- **ID**: Core-Feat-8
- **Priority**: P0
- **Size**: M
- **Area**: Core
- **Dependencies**: [Core-Feat-6, Core-Feat-7]
- **Goal**: `materials` から `daily_summaries` までの対象 repository が、デモ経路では `DriftCrudRepository` 経由で読み書きできる。
- **Steps**:
  1. [x] Plan の "Drift CRUD repository" に従い、`CrudRepository<T, String>` の Drift 実装を追加する
  2. [x] 現行 UI/Service が使う `QueryFilter` / `OrderByCondition` を Drift query に変換する
  3. [x] `GenericCrudRepository` 利用箇所を demo override で `DriftCrudRepository` に差し替える
  4. [x] CRUD と主要検索条件の unit test を追加する
- **Description**: feature repository wrapper と Service/UI を維持しながら、データアクセスだけをローカル DB へ差し替える。
- **Plan**: `_docs/plan/Core/demo-local-runtime/plan.md`

- **Title**: [Feat] Demo Seed Data And Reset
- **ID**: Core-Feat-9
- **Priority**: P0
- **Size**: M
- **Area**: Core
- **Dependencies**: [Core-Feat-8]
- **Goal**: 初回起動直後にメニュー、材料、在庫、注文履歴、売上サマリーが投入され、必要時にデモデータをリセットできる。
- **Steps**:
  1. [x] Plan の "Seed data" に従い、deterministic seed dataset を追加する
  2. [x] seed marker によって重複投入を防ぐ
  3. [x] reset service を追加し、DB 初期化と seed 再投入を一連の操作にする
  4. [x] seed 初回投入、重複防止、reset 後再投入の test を追加する
- **Description**: 空の業務アプリにならないよう、公開デモに必要な初期データと再現性を作る。
- **Plan**: `_docs/plan/Core/demo-local-runtime/plan.md`

- **Title**: [Refactor] No-op Realtime For Demo
- **ID**: Core-Refactor-10
- **Priority**: P1
- **Size**: S
- **Area**: Core
- **Dependencies**: [Core-Feat-8]
- **Goal**: デモ経路では Realtime 購読が Supabase に接続せず成功扱いになり、UI の接続表示や refresh 導線が壊れない。
- **Steps**:
  1. [x] `RealtimeManagerContract` の no-op 実装を追加する
  2. [x] `startMonitoring` / `stopMonitoring` / `getActiveSubscriptions` / `getStats` をローカル状態で完結させる
  3. [x] `realtimeManagerProvider` を demo override で差し替える
  4. [x] メニュー・注文・在庫画面の初期ロードが Realtime 接続なしで失敗しないことを確認する
- **Description**: サーバー同期なしのデモでも、既存 Service/UI の Realtime 前提を崩さないためのダミー実装を入れる。
- **Plan**: None

- **Title**: [Feat] Local CSV Export
- **ID**: Core-Feat-11
- **Priority**: P1
- **Size**: M
- **Area**: Core
- **Dependencies**: [Core-Feat-8, Core-Feat-9]
- **Goal**: Supabase RPC を使わず、ローカル DB から主要データセットの CSV export ができる。
- **Steps**:
  1. [x] Plan の "Local CSV export" に従い、`CsvExportRepositoryContract` のローカル実装を追加する
  2. [x] `CsvExportJobsRepositoryContract` を memory/no-op または Drift 実装で差し替える
  3. [x] orders / order_items / materials / menu_items / daily_summaries の CSV を組み立てる
  4. [x] CSV header、行数、文字列エスケープの test を追加する
- **Description**: 公開デモで export 機能を非表示にせず、クラウドなしで完結する CSV 出力へ寄せる。
- **Plan**: `_docs/plan/Core/demo-local-runtime/plan.md`

- **Title**: [Doc] Document Demo Local Runtime
- **ID**: Docs-Doc-12
- **Priority**: P1
- **Size**: S
- **Area**: Docs
- **Dependencies**: [Core-Feat-5, Core-Feat-6, Core-Feat-7, Core-Feat-8, Core-Feat-9, Core-Refactor-10, Core-Feat-11]
- **Goal**: README または `_docs/guide/` に、デモモードの起動方法、ローカル DB、seed/reset、Supabase 非依存の前提が記載されている。
- **Steps**:
  1. [x] 実装結果に合わせて README の概要と起動手順を更新する
  2. [x] 必要に応じて `_docs/guide/` にデモ運用ガイドを追加する
  3. [x] Supabase 依存が残る場合は、残存理由と削除条件を明記する
  4. [x] ドキュメント内のコマンドが実際に存在することを確認する
- **Description**: デモ化後の開発者・展示担当者向け運用情報を、実装と矛盾しない形で残す。
- **Plan**: None

---

## Ready

---

## In Progress
