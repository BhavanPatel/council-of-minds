#!/usr/bin/env bash
set -euo pipefail

# ─────────────────────────────────────────────────────────────────────────────
# Council of Minds — Remote Bootstrap
# Usage: curl -sL https://raw.githubusercontent.com/BhavanPatel/council-of-minds/main/setup.sh | bash
# ─────────────────────────────────────────────────────────────────────────────

INSTALL_DIR="${HOME}/.council-of-minds"
REPO_URL="https://github.com/BhavanPatel/council-of-minds.git"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'
BOLD='\033[1m'

echo ""
echo -e "${CYAN}${BOLD}  Council of Minds — Setup${NC}"
echo ""

# Check git
if ! command -v git &>/dev/null; then
  echo -e "  ${RED}✗${NC} git is required. Install it first."
  exit 1
fi

# Clone or update
if [ -d "$INSTALL_DIR" ]; then
  echo -e "  ${GREEN}✓${NC} Found existing installation at ${INSTALL_DIR}"
  echo -e "  ${CYAN}Pulling latest...${NC}"
  cd "$INSTALL_DIR"
  git pull --quiet
else
  echo -e "  ${CYAN}Cloning to ${INSTALL_DIR}...${NC}"
  git clone --quiet "$REPO_URL" "$INSTALL_DIR"
fi

echo -e "  ${GREEN}✓${NC} Repository ready"
echo ""

# Setup CLI symlink
BIN_SRC="${INSTALL_DIR}/bin/council"
TARGET_BIN=""

if [ -w "/usr/local/bin" ]; then
  TARGET_BIN="/usr/local/bin/council"
else
  mkdir -p "${HOME}/.local/bin"
  TARGET_BIN="${HOME}/.local/bin/council"
fi

chmod +x "$BIN_SRC"
ln -sf "$BIN_SRC" "$TARGET_BIN"
echo -e "  ${GREEN}✓${NC} CLI installed: ${TARGET_BIN}"

# Check PATH
if [[ "$TARGET_BIN" == "${HOME}/.local/bin/council" ]]; then
  if ! echo "$PATH" | grep -q "${HOME}/.local/bin"; then
    echo ""
    echo -e "  ${YELLOW}[note]${NC} Add to your shell profile:"
    echo -e "    export PATH=\"\$HOME/.local/bin:\$PATH\""
  fi
fi

echo ""
echo -e "${CYAN}${BOLD}  Setup complete!${NC}"
echo ""
echo -e "  Now run:"
echo ""
echo -e "    ${GREEN}council install${NC}"
echo ""
echo -e "  This will detect your AI clients and install the council."
echo ""
