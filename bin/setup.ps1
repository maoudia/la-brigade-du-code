# =============================================================
# bin/setup.ps1 — One command after git clone (Windows PowerShell)
# =============================================================

$ErrorActionPreference = "Stop"

function Write-Check { param($msg) Write-Host "  $([char]0x2713) $msg" -ForegroundColor Green }
function Write-Cross { param($msg) Write-Host "  $([char]0x2717) $msg" -ForegroundColor Red }
function Write-Warn  { param($msg) Write-Host "  ! $msg" -ForegroundColor Yellow }
function Write-Info  { param($msg) Write-Host "  -> $msg" -ForegroundColor Cyan }

Write-Host ""
Write-Host "=======================================" -ForegroundColor Blue
Write-Host "   La Brigade du Code" -ForegroundColor Blue
Write-Host "   Pre-flight Check (PowerShell)" -ForegroundColor Blue
Write-Host "=======================================" -ForegroundColor Blue
Write-Host ""

$errors = 0

# --- Check git ---
try {
  $gitVersion = (git --version 2>&1) -replace "git version ", ""
  Write-Check "git             $gitVersion"
} catch {
  Write-Cross "git             not found"
  Write-Info  "Install from https://git-scm.com/download/win"
  $errors++
}

# --- Check docker ---
try {
  $dockerVersion = (docker --version 2>&1) -replace "Docker version ", "" -replace ",.*", ""
  Write-Check "docker          $dockerVersion"
} catch {
  Write-Cross "docker          not found"
  Write-Info  "Install Docker or Podman (with docker alias): https://podman.io or https://docs.docker.com/get-docker/"
  $errors++
}

# --- Check docker compose ---
try {
  $composeVersion = (docker compose version 2>&1) -replace "Docker Compose version v", ""
  Write-Check "docker compose  $composeVersion"
} catch {
  Write-Cross "docker compose  not found"
  Write-Info  "Install docker compose plugin: https://docs.docker.com/compose/install/"
  $errors++
}

Write-Host ""

if ($errors -gt 0) {
  Write-Host "Please install missing tools above, then re-run .\bin\setup.ps1" -ForegroundColor Red
  exit 1
}

Write-Host "Checking mise..." -ForegroundColor Yellow

$miseCmd = $null
if (Get-Command mise -ErrorAction SilentlyContinue) {
  $miseVersion = (mise --version 2>&1)
  Write-Check "mise            $miseVersion (global)"
  $miseCmd = "mise"
} else {
  Write-Warn "mise not found globally"
  Write-Info "Installing mise locally via winget..."
  winget install --id jdx.mise -e --source winget
  $miseCmd = "mise"
}

Write-Host ""
Write-Host "Installing tools from mise.toml..." -ForegroundColor Yellow
& $miseCmd install

Write-Host ""
Write-Host "Trusting mise config..." -ForegroundColor Yellow
& $miseCmd trust

Write-Host ""
& $miseCmd run banner-windows

Write-Host ""
Write-Host "Setup complete! You are ready to cook." -ForegroundColor Green
Write-Host ""
Write-Host "Quick start:"
Write-Host "  mise run service    # start backend + frontend"
Write-Host "  mise run docker     # start with Docker Compose"
Write-Host "  mise tasks          # list all available tasks"
Write-Host ""
