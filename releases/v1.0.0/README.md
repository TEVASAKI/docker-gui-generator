# Docker GUI Generator — v1.0.0

このフォルダは **v1.0.0** の成果物です。本体（`index.html`）とこのドキュメントを同じフォルダで配布・保管します。

## 内容

- **index.html** … 初心者向け Dockerfile + docker-compose.yml 生成ツール（リアルタイムプレビュー付き）
- **README.md** … 本バージョン用の説明（このファイル）

## 使い方

1. `index.html` をブラウザで開く（ダブルクリックまたはドラッグ＆ドロップ）
2. 左側のフォームでアプリ名・ベースイメージ・ポート・コマンドなどを入力
3. 右側で Dockerfile と docker-compose.yml のプレビューを確認
4. 「生成！」を押してから、各ボタンで Dockerfile / docker-compose.yml をダウンロード

## 機能（v1.0.0）

- 基本設定: アプリ名、ベースイメージ、公開ポート、起動コマンド
- マルチステージビルド（上級者向けオプション）
- docker-compose: MySQL 追加オプション
- リアルタイムプレビュー、ダウンロード

## 更新履歴

- **v1.0.0** … 初回リリース（Perplexity ポン出し版を整理）
