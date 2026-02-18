# Docker GUI Generator

初心者向け **Dockerfile + docker-compose.yml 生成ツール**。リアルタイムプレビュー付き。  
Perplexity で作成したポン出しツールをベースに、これから機能追加・改善していくプロジェクトです。

---

## フォルダ構成

```
20260216_docker_GUI_generator/
├── README.md              ← このファイル（逐次更新）
├── docs/                  ← 開発用ドキュメント
│   └── DEVELOPMENT.md
├── src/                   ← 開発中の本体（ここをいじる）
│   ├── index.html
│   ├── apps/               ← サブアプリ置き場（ビルド不要の単一HTMLなど）
│   │   └── wsl-config-generator/
│   │       ├── wsl-config-generator.html
│   │       └── README.md
│   └── scripts/
│       └── release.ps1    ← バージョン上げ＆成果物作成スクリプト
└── releases/              ← バージョンごとの成果物（本体＋ドキュメント同一フォルダ）
    └── v1.0.0/
        ├── index.html
        └── README.md
```

- **開発** … `src/` の `index.html` を編集する。
- **成果物** … バージョンを上げたら `releases/vX.Y.Z/` に「本体 + そのバージョン用 README」をまとめて作成する。
- **README.md** … プロジェクト全体の説明・使い方・履歴はこのファイルに逐次追記する。

---

## 使い方（利用者向け）

- **最新版を使う場合** … `releases/` 内のいちばん新しいバージョン（例: `releases/v1.0.0/`）の `index.html` をブラウザで開く。
- **開発中のものを試す場合** … `src/index.html` をブラウザで開く。

---

## 開発の進め方

1. 機能追加・修正は **`src/index.html`** に対して行う。
2. 動作確認後、**バージョンを決めて** `src/scripts/release.ps1` を実行し、`releases/vX.Y.Z/` を作成する。
3. **ルートの README.md** に「変更内容・バージョン・日付」を追記する（下記「更新履歴」を更新）。

詳細は `docs/DEVELOPMENT.md` を参照。

---

## リリース手順（バージョンを上げるとき）

1. `src/` の修正を完了し、動作確認する。
2. PowerShell でプロジェクトルートに移動し、次を実行:
   ```powershell
   .\src\scripts\release.ps1 -Version "1.1.0"
   ```
3. `releases/v1.1.0/` が作成されるので、必要なら中身の README を編集。
4. ルートの **README.md** の「更新履歴」に v1.1.0 の内容を追記する。

---

## 更新履歴

- **v1.0.0** … 初回。フォルダ構成・開発環境を整備。Perplexity ポン出し版を `src/` と `releases/v1.0.0/` に配置。
- **dev（feature/wslconfig-complete-gui）** … `.wslconfig` 完全版 GUI ジェネレータ用サブアプリを `src/apps/wsl-config-generator/` に追加。

（以降、バージョンアップのたびにここに追記していく）
