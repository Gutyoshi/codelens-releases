#!/usr/bin/env bash
# ==============================================================================
# ⚡ CodeLens Pro — macOS & Linux Native One-Line Installer
# Zero Node.js. Zero npm. Instant Execution.
# Usage: curl -fsSL https://codelens.cloud/install.sh | bash
# ==============================================================================

set -e

GREEN='\033[38;2;16;185;129m'
CYAN='\033[38;2;6;182;212m'
GRAY='\033[38;2;161;161;170m'
RED='\033[38;2;239;68;68m'
RESET='\033[0m'

echo ""
echo -e "${GREEN}  ██████╗ ██████╗ ██████╗ ███████╗██╗     ███████╗███╗   ██╗███████╗${RESET}"
echo -e "${GREEN} ██╔════╝██╔═══██╗██╔══██╗██╔════╝██║     ██╔════╝████╗  ██║██╔════╝${RESET}"
echo -e "${GREEN} ██║     ██║   ██║██║  ██║█████╗  ██║     █████╗  ██╔██╗ ██║███████╗${RESET}"
echo -e "${GREEN} ██║     ██║   ██║██║  ██║██╔══╝  ██║     ██╔══╝  ██║╚██╗██║╚════██║${RESET}"
echo -e "${GREEN} ╚██████╗╚██████╔╝██████╔╝███████╗███████╗███████╗██║ ╚████║███████║${RESET}"
echo -e "${GREEN}  ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚══════╝╚══════╝╚═╝  ╚═══╝╚══════╝${RESET}"
echo -e "${CYAN}  The Context Accelerator & Architecture Armor for Autonomous AI Agents${RESET}"
echo ""

# 1. Detecção de Sistema Operacional e Arquitetura
OS="$(uname -s)"
ARCH="$(uname -m)"

case "$OS" in
  Darwin)
    if [ "$ARCH" = "arm64" ]; then
      PACKAGE="codelens-darwin-arm64.tar.gz"
      PLATFORM_DESC="macOS Apple Silicon (arm64)"
    else
      PACKAGE="codelens-darwin-x64.tar.gz"
      PLATFORM_DESC="macOS Intel (x64)"
    fi
    ;;
  Linux)
    if [ "$ARCH" = "aarch64" ] || [ "$ARCH" = "arm64" ]; then
      PACKAGE="codelens-linux-arm64.tar.gz"
      PLATFORM_DESC="Linux ARM64"
    else
      PACKAGE="codelens-linux-x64.tar.gz"
      PLATFORM_DESC="Linux x86_64"
    fi
    ;;
  *)
    echo -e "${RED}❌ Sistema operacional não suportado via shell script: $OS${RESET}"
    echo "Para Windows, use no PowerShell:"
    echo "irm https://codelens.cloud/install.ps1 | iex"
    exit 1
    ;;
esac

echo -e "${GRAY}[1/3] Plataforma detectada: ${CYAN}${PLATFORM_DESC}${RESET}"

# 2. Diretório de Instalação
INSTALL_DIR="$HOME/.local/bin"
mkdir -p "$INSTALL_DIR"

DOWNLOAD_URL="https://github.com/Gutyoshi/codelens-releases/releases/latest/download/${PACKAGE}"
TEMP_ARCHIVE="/tmp/${PACKAGE}"
EXTRACT_DIR="/tmp/codelens_extracted_$$"

echo -e "${GRAY}[2/3] Baixando binário nativo pré-compilado...${RESET}"
if command -v curl >/dev/null 2>&1; then
  curl -fsSL "$DOWNLOAD_URL" -o "$TEMP_ARCHIVE"
elif command -v wget >/dev/null 2>&1; then
  wget -q "$DOWNLOAD_URL" -O "$TEMP_ARCHIVE"
else
  echo -e "${RED}❌ Nem curl nem wget encontrados para download.${RESET}"
  exit 1
fi

mkdir -p "$EXTRACT_DIR"
tar -xzf "$TEMP_ARCHIVE" -C "$EXTRACT_DIR"

if [ -f "$EXTRACT_DIR/codelens" ]; then
  mv "$EXTRACT_DIR/codelens" "$INSTALL_DIR/codelens"
elif [ -f "$EXTRACT_DIR/codelens.exe" ]; then
  mv "$EXTRACT_DIR/codelens.exe" "$INSTALL_DIR/codelens"
else
  echo -e "${RED}❌ Binário codelens não encontrado no arquivo descompactado.${RESET}"
  rm -rf "$TEMP_ARCHIVE" "$EXTRACT_DIR"
  exit 1
fi

chmod +x "$INSTALL_DIR/codelens"
rm -rf "$TEMP_ARCHIVE" "$EXTRACT_DIR"

echo -e "${GREEN}✓ Binário instalado com sucesso em: ${INSTALL_DIR}/codelens${RESET}"

# 3. Verificação do PATH
echo -e "${GRAY}[3/3] Verificando PATH do shell...${RESET}"
SHELL_CONFIG=""
case "$SHELL" in
  */zsh)
    SHELL_CONFIG="$HOME/.zshrc"
    ;;
  */bash)
    if [ -f "$HOME/.bashrc" ]; then
      SHELL_CONFIG="$HOME/.bashrc"
    else
      SHELL_CONFIG="$HOME/.bash_profile"
    fi
    ;;
  *)
    SHELL_CONFIG="$HOME/.profile"
    ;;
esac

if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
  if [ -n "$SHELL_CONFIG" ]; then
    echo "export PATH=\"\$HOME/.local/bin:\$PATH\"" >> "$SHELL_CONFIG"
    echo -e "${GREEN}✓ Adicionado ~/.local/bin ao PATH em ${SHELL_CONFIG}${RESET}"
  fi
  export PATH="$INSTALL_DIR:$PATH"
fi

echo ""
echo -e "${CYAN}══════════════════════════════════════════════════════════════════════════${RESET}"
echo -e "${GREEN}⚡ Instalação Concluída! Abrindo assistente de configuração...${RESET}"
echo -e "${CYAN}══════════════════════════════════════════════════════════════════════════${RESET}"
echo ""

# Executa o assistente interativo da chave
"$INSTALL_DIR/codelens"
