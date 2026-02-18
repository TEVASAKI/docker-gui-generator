# .wslconfig GUI Generator（完全版）

`.wslconfig` を GUI で生成する単一 HTML アプリです（ビルド不要 / Tailwind CDN）。  
このブランチでは **全設定項目をほぼ網羅した「完全版 GUI」** に拡張しています。

## ファイル

- `wsl-config-generator.html` … 本体（.wslconfig 完全版 GUI）
- `README.md` … このファイル

## 機能概要（完全版での主な追加分）

- **[general] セクション**
  - `instanceIdleTimeout` など、WSL 全体に関わる一般設定
- **[wsl2] 基本設定**
  - `memory` / `processors` / `swap` のシンプルなリソース制限
  - ブラウザから物理メモリ・CPU コア数を検出し、推奨値を自動セット
- **[wsl2] 詳細設定（中級者向け）**
  - `swapFile` / `localhostForwarding` / `vmIdleTimeout` / `kernel` / `kernelCommandLine`
  - `nestedVirtualization` / `pageReporting` / `guiApplications` / `debugConsole`
- **[wsl2] ネットワーク設定（中級者向け）**
  - `networkingMode`（NAT / mirrored / bridged / virtioproxy / none）
  - `dnsTunneling` / `dnsProxy` / `firewall` / `autoProxy`
  - `vmSwitch` / `macAddress` / `dhcp` / `ipv6` / `ignoredPorts`
- **[experimental] 実験的機能（上級者向け）**
  - `autoMemoryReclaim`（モード選択可） / `sparseVhd`
  - `useWindowsDnsCache` / `bestEffortDnsParsing` / `dnsTunnelIpAddress`
  - `initialAutoProxyTimeout` / `hostAddressLoopback`
  - `defaultVhdSize` / `maxCrashDumpCount`
- **リアルタイムプレビュー**
  - 入力値の変更に応じて `.wslconfig` 本文と PowerShell コマンドを即時更新
- **警告・バリデーション**
  - 物理メモリに対して過大な `memory` 設定時に警告を表示
- **セクション折りたたみ**
  - クリックで `[general] / [wsl2] 詳細 / ネットワーク / experimental` を開閉可能

## 使い方

1. ブラウザで `wsl-config-generator.html` を開く。
2. 画面上部の「検出: メモリ / CPU コア」表示を確認する。
3. 必要に応じて各セクション（[general] / [wsl2] / ネットワーク / experimental）を展開し、値を入力・調整する。
4. 右側の **「リアルタイムプレビュー」** に生成される `.wslconfig` 内容を確認する。
5. 下部の完了セクションで次を選ぶ。
   - 「設定をコピー」 … `.wslconfig` 本文をコピー
   - 「コマンドをコピー」 … PowerShell で `.wslconfig` を生成するコマンドをコピー
6. 管理者権限の PowerShell で貼り付け・実行し、`wsl --shutdown` → Docker Desktop 再起動などの手順に従って適用する。

## 注意点

- `memory` / `processors` は「物理リソースの 50–75%」程度を目安にする。
- ネットワークや experimental の項目は、用途や環境（VPN / Hyper-V / Windows バージョンなど）に依存します。
  - よく分からない場合は **デフォルト値のまま** にしておくことを推奨します。

