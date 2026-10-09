# ==============================================================================
# ⚡ CodeLens Pro — Windows Native One-Line Installer
# Zero Node.js. Zero npm. Instant Execution.
# Usage: irm https://gateway-six-opal.vercel.app/install.ps1 | iex
# ==============================================================================

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$ErrorActionPreference = "Stop"

$ESC = [char]27
$GREEN = "$ESC[38;2;16;185;129m"
$CYAN = "$ESC[38;2;6;182;212m"
$GRAY = "$ESC[38;2;161;161;170m"
$RESET = "$ESC[0m"

Write-Host ""
Write-Host "$GREEN  ██████╗ ██████╗ ██████╗ ███████╗██╗     ███████╗███╗   ██╗███████╗$RESET"
Write-Host "$GREEN ██╔════╝██╔═══██╗██╔══██╗██╔════╝██║     ██╔════╝████╗  ██║██╔════╝$RESET"
Write-Host "$GREEN ██║     ██║   ██║██║  ██║█████╗  ██║     █████╗  ██╔██╗ ██║███████╗$RESET"
Write-Host "$GREEN ██║     ██║   ██║██║  ██║██╔══╝  ██║     ██╔══╝  ██║╚██╗██║╚════██║$RESET"
Write-Host "$GREEN ╚██████╗╚██████╔╝██████╔╝███████╗███████╗███████╗██║ ╚████║███████║$RESET"
Write-Host "$GREEN  ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚══════╝╚══════╝╚═╝  ╚═══╝╚══════╝$RESET"
Write-Host "$CYAN  The Context Accelerator & AST Protection Engine for Autonomous AI Agents$RESET"
Write-Host ""

$installDir = "$env:LOCALAPPDATA\Programs\CodeLens"
$exePath = "$installDir\codelens.exe"
$zipUrl = "https://gateway-six-opal.vercel.app/codelens-win-x64.zip"
$tempZip = "$env:TEMP\codelens-win-x64.zip"

Write-Host "$GRAY[1/3] Preparando diretório de instalação: $installDir$RESET"
if (!(Test-Path $installDir)) {
    New-Item -ItemType Directory -Force -Path $installDir | Out-Null
}

Write-Host "$GRAY[2/3] Baixando executável nativo compilado...$RESET"
try {
    Invoke-WebRequest -Uri $zipUrl -OutFile $tempZip -UseBasicParsing
    if (Test-Path $exePath) {
        $oldExe = "$installDir\codelens.exe.old"
        Remove-Item -Force $oldExe -ErrorAction SilentlyContinue
        Move-Item -Path $exePath -Destination $oldExe -Force -ErrorAction SilentlyContinue
    }
    Expand-Archive -Path $tempZip -DestinationPath $installDir -Force
    Remove-Item -Force $tempZip -ErrorAction SilentlyContinue

    $npmExe = "$env:APPDATA\npm\codelens.exe"
    if (Test-Path $npmExe) {
        $npmOld = "$env:APPDATA\npm\codelens.exe.old"
        Remove-Item -Force $npmOld -ErrorAction SilentlyContinue
        Move-Item -Path $npmExe -Destination $npmOld -Force -ErrorAction SilentlyContinue
        Copy-Item -Path $exePath -Destination $npmExe -Force -ErrorAction SilentlyContinue
    }

    Write-Host "$GREEN✓ CodeLens Pro instalado com sucesso em $exePath$RESET"
} catch {
    Write-Host "$ESC[38;2;239;68;68m❌ Erro durante a instalação do binário: $_$RESET"
    exit 1
}

Write-Host "$GRAY[3/3] Registrando no PATH do sistema...$RESET"
$userPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($userPath -notlike "*$installDir*") {
    $newUserPath = "$userPath;$installDir"
    [Environment]::SetEnvironmentVariable("Path", $newUserPath, "User")
    $env:Path = "$env:Path;$installDir"
    Write-Host "$GREEN✓ PATH atualizado com sucesso.$RESET"
} else {
    Write-Host "$GREEN✓ PATH já configurado.$RESET"
}

Write-Host ""
Write-Host "$CYAN══════════════════════════════════════════════════════════════════════════$RESET"
Write-Host "$GREEN⚡ Instalação Concluída! Abrindo assistente de configuração...$RESET"
Write-Host "$CYAN══════════════════════════════════════════════════════════════════════════$RESET"
Write-Host ""

& "$exePath"
