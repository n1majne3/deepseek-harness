# Local / CI helper: package unsigned DeepSeek Harness Desktop for Windows x64.
# Requires: Windows x64, Node 22.19+, pnpm 11.7.0, VS C++ Build Tools + Windows SDK.
$ErrorActionPreference = 'Stop'
Set-Location (Resolve-Path (Join-Path $PSScriptRoot '..'))
if (-not (Test-Path 'apps/desktop/.env.windows')) {
  Copy-Item 'apps/desktop/.env.windows.example' 'apps/desktop/.env.windows'
}
pnpm install --frozen-lockfile
pnpm run package:desktop:win:x64:unsigned
Write-Host "Artifacts under apps/desktop/.desktop-build/targets/win-x64/unsigned-artifacts/"
Get-ChildItem 'apps/desktop/.desktop-build/targets/win-x64/unsigned-artifacts' -ErrorAction SilentlyContinue
