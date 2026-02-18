<#
.SYNOPSIS
  バージョンを指定して releases/vX.Y.Z/ に成果物（本体＋README）を作成する。

.DESCRIPTION
  src/index.html を releases/vX.Y.Z/ にコピーし、
  そのバージョン用の README.md を生成する。
  既存の releases/vX.Y.Z/README.md がある場合は上書きしない（手動編集を尊重）。

.PARAMETER Version
  セマンティックバージョン（例: 1.0.0, 1.1.0）。先頭の "v" はあってもなくてもよい。

.EXAMPLE
  .\src\scripts\release.ps1 -Version "1.1.0"
  .\src\scripts\release.ps1 -Version "v2.0.0"
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string] $Version
)

# "v" を正規化（v1.0.0 -> v1.0.0、1.0.0 -> v1.0.0）
$ver = $Version.Trim()
if (-not $ver.StartsWith('v')) { $ver = "v$ver" }

$projectRoot = $PSScriptRoot
# src/scripts/ -> 2階層上でプロジェクトルート
foreach ($i in 1..2) { $projectRoot = Split-Path -Parent $projectRoot }

$srcIndex = Join-Path $projectRoot "src" "index.html"
$releaseDir = Join-Path $projectRoot "releases" $ver
$releaseIndex = Join-Path $releaseDir "index.html"
$releaseReadme = Join-Path $releaseDir "README.md"

if (-not (Test-Path $srcIndex)) {
    Write-Error "ソースが見つかりません: $srcIndex"
    exit 1
}

New-Item -ItemType Directory -Path $releaseDir -Force | Out-Null

# 本体をコピー
Copy-Item -Path $srcIndex -Destination $releaseIndex -Force
Write-Host "OK: $releaseIndex"

# README: 存在しなければ作成、あればスキップ（手動編集を保持）
if (-not (Test-Path $releaseReadme)) {
    $readmeContent = @"
# Docker GUI Generator — $ver

このフォルダは **$ver** の成果物です。本体（``index.html``）とこのドキュメントを同じフォルダで配布・保管します。

## 内容

- **index.html** … 初心者向け Dockerfile + docker-compose.yml 生成ツール（リアルタイムプレビュー付き）
- **README.md** … 本バージョン用の説明（このファイル）

## 使い方

1. ``index.html`` をブラウザで開く
2. フォームで設定を入力し、プレビューを確認
3. 「生成！」のあと、Dockerfile / docker-compose.yml をダウンロード

## 更新履歴

- **$ver** … このリリース
"@
    Set-Content -Path $releaseReadme -Value $readmeContent -Encoding UTF8
    Write-Host "OK: $releaseReadme (新規作成)"
} else {
    Write-Host "SKIP: $releaseReadme (既存のため上書きしません)"
}

Write-Host ""
Write-Host "リリース完了: $releaseDir"
Write-Host "ルートの README.md の「更新履歴」に $ver の内容を追記してください。"
