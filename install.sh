#!/usr/bin/env bash
set -euo pipefail

# ─────────────────────────────────────────────────────────────────────────────
# Council of Minds — Install Script
# Detects installed AI coding clients and installs the council in their native format.
# Mirrors context-sect install pattern: git-aware, per-agent, proper path resolution.
# ─────────────────────────────────────────────────────────────────────────────

VERSION="2.3.0"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALL_DIR="${HOME}/.council-of-minds"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'
BOLD='\033[1m'

# ─────────────────────────────────────────────────────────────────────────────
# Helpers
# ─────────────────────────────────────────────────────────────────────────────

print_header() {
  echo ""
  echo -e "${PURPLE}${BOLD}  Council of Minds${NC} ${CYAN}v${VERSION}${NC}"
  echo -e "  ${CYAN}Multi-advisor deliberation for AI agents${NC}"
  echo ""
  echo -e "  36 cognitive lenses · 12 profiles · 3 modes (Full/Quick/Duo)"
  echo -e "  5-round deliberation · weighted voting · kill criteria · evidence labels"
  echo ""
  echo -e "  ─────────────────────────────────────────────────────────────"
  echo ""
}

log_info() { echo -e "  ${BLUE}[info]${NC} $1"; }
log_ok() { echo -e "  ${GREEN}[done]${NC} $1"; }
log_warn() { echo -e "  ${YELLOW}[warn]${NC} $1"; }
log_err() { echo -e "  ${RED}[error]${NC} $1"; }
log_step() { echo -e "  ${PURPLE}[$1]${NC} $2"; }

# ─────────────────────────────────────────────────────────────────────────────
# Detection
# ─────────────────────────────────────────────────────────────────────────────

declare -a DETECTED_CLIENTS=()

detect_clients() {
  log_step "1/3" "Detecting installed AI clients..."
  echo ""

  # Kiro
  if [ -d "$HOME/.kiro" ] || command -v kiro &>/dev/null || command -v kiro-cli &>/dev/null; then
    DETECTED_CLIENTS+=("kiro")
    echo -e "    ${GREEN}✓${NC} Kiro"
  fi

  # Claude Code / Claude Desktop
  if [ -f "$HOME/.claude/CLAUDE.md" ] || [ -d "$HOME/.claude" ] || command -v claude &>/dev/null; then
    DETECTED_CLIENTS+=("claude")
    echo -e "    ${GREEN}✓${NC} Claude Code / Claude Desktop"
  fi

  # Cursor
  if [ -d "$HOME/.cursor" ] || [ -d "$HOME/Library/Application Support/Cursor" ] || [ -d "/Applications/Cursor.app" ]; then
    DETECTED_CLIENTS+=("cursor")
    echo -e "    ${GREEN}✓${NC} Cursor"
  fi

  # Windsurf
  if [ -d "$HOME/.windsurf" ] || [ -d "$HOME/Library/Application Support/Windsurf" ] || [ -d "/Applications/Windsurf.app" ]; then
    DETECTED_CLIENTS+=("windsurf")
    echo -e "    ${GREEN}✓${NC} Windsurf"
  fi

  # Cline
  if [ -d "$HOME/.cline" ] || [ -f "$HOME/.clinerules" ]; then
    DETECTED_CLIENTS+=("cline")
    echo -e "    ${GREEN}✓${NC} Cline"
  fi

  # Aider
  if command -v aider &>/dev/null || [ -f "$HOME/.aider.conf.yml" ]; then
    DETECTED_CLIENTS+=("aider")
    echo -e "    ${GREEN}✓${NC} Aider"
  fi

  # RooCode
  if [ -d "$HOME/.roo" ] || [ -f "$HOME/.roorules" ]; then
    DETECTED_CLIENTS+=("roocode")
    echo -e "    ${GREEN}✓${NC} RooCode"
  fi

  # OpenCode
  if command -v opencode &>/dev/null || [ -f "$HOME/.config/opencode/config.json" ]; then
    DETECTED_CLIENTS+=("opencode")
    echo -e "    ${GREEN}✓${NC} OpenCode"
  fi

  # GitHub Copilot
  if find "${HOME}/.vscode/extensions" -maxdepth 1 -name "*copilot*" -print -quit 2>/dev/null | grep -q . || command -v gh &>/dev/null; then
    DETECTED_CLIENTS+=("github-copilot")
    echo -e "    ${GREEN}✓${NC} GitHub Copilot"
  fi

  # Codex
  if command -v codex &>/dev/null || [ -f "$HOME/.codex/config.toml" ]; then
    DETECTED_CLIENTS+=("codex")
    echo -e "    ${GREEN}✓${NC} OpenAI Codex"
  fi

  echo ""

  if [ ${#DETECTED_CLIENTS[@]} -eq 0 ]; then
    log_warn "No AI clients detected. Choose manually:"
    select_clients_manually
  fi
}

select_clients_manually() {
  echo ""
  echo "  Available clients:"
  echo "    1) Kiro"
  echo "    2) Claude Code"
  echo "    3) Cursor"
  echo "    4) Windsurf"
  echo "    5) Cline"
  echo "    6) Aider"
  echo "    7) RooCode"
  echo "    8) OpenCode"
  echo "    9) GitHub Copilot"
  echo "   10) OpenAI Codex"
  echo "    a) All"
  echo ""
  read -rp "  Select (comma-separated numbers, or 'a' for all): " selection </dev/tty

  if [[ "$selection" == "a" ]]; then
    DETECTED_CLIENTS=("kiro" "claude" "cursor" "windsurf" "cline" "aider" "roocode" "opencode" "github-copilot" "codex")
  else
    IFS=',' read -ra choices <<< "$selection"
    for choice in "${choices[@]}"; do
      choice=$(echo "$choice" | tr -d ' ')
      case "$choice" in
        1) DETECTED_CLIENTS+=("kiro") ;;
        2) DETECTED_CLIENTS+=("claude") ;;
        3) DETECTED_CLIENTS+=("cursor") ;;
        4) DETECTED_CLIENTS+=("windsurf") ;;
        5) DETECTED_CLIENTS+=("cline") ;;
        6) DETECTED_CLIENTS+=("aider") ;;
        7) DETECTED_CLIENTS+=("roocode") ;;
        8) DETECTED_CLIENTS+=("opencode") ;;
        9) DETECTED_CLIENTS+=("github-copilot") ;;
        10) DETECTED_CLIENTS+=("codex") ;;
      esac
    done
  fi
}

# ─────────────────────────────────────────────────────────────────────────────
# Client Selection
# ─────────────────────────────────────────────────────────────────────────────

declare -a SELECTED_CLIENTS=()

select_clients() {
  log_step "2/3" "Select which clients to install for:"
  echo ""

  if [ ${#DETECTED_CLIENTS[@]} -eq 1 ]; then
    SELECTED_CLIENTS=("${DETECTED_CLIENTS[@]}")
    log_info "Only one client detected — auto-selecting: ${DETECTED_CLIENTS[0]}"
    echo ""
    return
  fi

  echo -e "    ${BOLD}Detected clients:${NC}"
  echo ""
  for i in "${!DETECTED_CLIENTS[@]}"; do
    echo -e "    $((i+1)). ${DETECTED_CLIENTS[$i]}"
  done
  echo -e "    A. All detected clients"
  echo ""

  read -rp "  Select (numbers comma-separated, or A for all) [A]: " selection </dev/tty
  selection="${selection:-A}"

  if [[ "$selection" =~ ^[Aa]$ ]]; then
    SELECTED_CLIENTS=("${DETECTED_CLIENTS[@]}")
  else
    IFS=',' read -ra indices <<< "$selection"
    for idx in "${indices[@]}"; do
      idx="$(echo "$idx" | xargs)"
      if [[ "$idx" =~ ^[0-9]+$ ]] && [ "$idx" -ge 1 ] && [ "$idx" -le "${#DETECTED_CLIENTS[@]}" ]; then
        SELECTED_CLIENTS+=("${DETECTED_CLIENTS[$((idx-1))]}")
      fi
    done
  fi

  echo ""
  log_info "Installing for: ${SELECTED_CLIENTS[*]}"
  echo ""
}

# ─────────────────────────────────────────────────────────────────────────────
# Install Functions (per client)
# ─────────────────────────────────────────────────────────────────────────────

# Source directory for council content (always from the repo/install dir)
SRC_DIR="${SCRIPT_DIR}"

# Sync advisors: remove installed advisors that no longer exist in source
sync_advisors() {
  local target_dir="$1"
  [[ -d "$target_dir" ]] || return 0

  for installed_file in "$target_dir"/*.md; do
    [[ -f "$installed_file" ]] || continue
    local fname
    fname="$(basename "$installed_file")"
    if [[ ! -f "${SRC_DIR}/advisors/${fname}" ]]; then
      rm -f "$installed_file"
      echo -e "    ${RED}✗${NC} Removed ${fname} (no longer in council)"
    fi
  done
}

# Copy all advisor files from source to target directory
copy_advisors() {
  local target_dir="$1"
  for advisor_file in "${SRC_DIR}"/advisors/*.md; do
    [[ -f "$advisor_file" ]] || continue
    cp "$advisor_file" "$target_dir/"
  done
}

install_kiro() {
  echo -e "\n  ${BLUE}Installing for Kiro...${NC}"
  local target="${HOME}/.kiro"

  mkdir -p "${target}/agents/council-of-minds/advisors"
  mkdir -p "${target}/settings"

  # Copy agent definition (with corrected paths)
  cp "${SRC_DIR}/council-of-minds.json" "${target}/agents/council-of-minds/"
  cp "${SRC_DIR}/council-of-minds.md" "${target}/agents/council-of-minds/"
  copy_advisors "${target}/agents/council-of-minds/advisors/"
  cp "${SRC_DIR}/settings/council-of-minds.config.json" "${target}/settings/"

  # Remove advisors that no longer exist in source
  sync_advisors "${target}/agents/council-of-minds/advisors"

  log_ok "Kiro: ${target}/agents/council-of-minds/"
}

install_claude() {
  echo -e "\n  ${BLUE}Installing for Claude Code...${NC}"
  local target="${HOME}/.claude/council-of-minds"

  mkdir -p "${target}/advisors"
  cp "${SRC_DIR}/council-of-minds.md" "${target}/"
  copy_advisors "${target}/advisors/"
  cp "${SRC_DIR}/settings/council-of-minds.config.json" "${target}/"

  # Remove advisors that no longer exist in source
  sync_advisors "${target}/advisors"

  # Add include reference to CLAUDE.md
  local claude_md="${HOME}/.claude/CLAUDE.md"
  if [ -f "$claude_md" ]; then
    if ! grep -q "council-of-minds" "$claude_md" 2>/dev/null; then
      printf '\n# Council of Minds — say "council this: [question]" to activate\n#[[file:council-of-minds/council-of-minds.md]]\n' >> "$claude_md"
      echo -e "    ${GREEN}✓${NC} Added include reference to CLAUDE.md"
    fi
  else
    printf '# Council of Minds — say "council this: [question]" to activate\n#[[file:council-of-minds/council-of-minds.md]]\n' > "$claude_md"
    echo -e "    ${GREEN}✓${NC} Created CLAUDE.md with council reference"
  fi

  log_ok "Claude: ${target}/"
}

install_cursor() {
  echo -e "\n  ${BLUE}Installing for Cursor...${NC}"
  local target="${HOME}/.cursor/rules"

  mkdir -p "${target}/council-advisors"
  cp "${SRC_DIR}/council-of-minds.md" "${target}/council-of-minds.md"
  copy_advisors "${target}/council-advisors/"
  cp "${SRC_DIR}/settings/council-of-minds.config.json" "${target}/council-advisors/"

  # Remove advisors that no longer exist in source
  sync_advisors "${target}/council-advisors"

  log_ok "Cursor: ${target}/council-of-minds.md"
}

install_windsurf() {
  echo -e "\n  ${BLUE}Installing for Windsurf...${NC}"
  local target="${HOME}/.windsurf/rules"

  mkdir -p "${target}/council-advisors"
  cp "${SRC_DIR}/council-of-minds.md" "${target}/council-of-minds.md"
  copy_advisors "${target}/council-advisors/"
  cp "${SRC_DIR}/settings/council-of-minds.config.json" "${target}/council-advisors/"

  # Remove advisors that no longer exist in source
  sync_advisors "${target}/council-advisors"

  log_ok "Windsurf: ${target}/council-of-minds.md"
}

install_cline() {
  echo -e "\n  ${BLUE}Installing for Cline...${NC}"
  local target="${HOME}/.cline/rules"

  mkdir -p "${target}/council-advisors"
  cp "${SRC_DIR}/council-of-minds.md" "${target}/council-of-minds.md"
  copy_advisors "${target}/council-advisors/"

  # Remove advisors that no longer exist in source
  sync_advisors "${target}/council-advisors"

  log_ok "Cline: ${target}/council-of-minds.md"
}

install_aider() {
  echo -e "\n  ${BLUE}Installing for Aider...${NC}"
  local target="${HOME}/.aider/council-of-minds"

  mkdir -p "${target}/advisors"
  cp "${SRC_DIR}/council-of-minds.md" "${target}/"
  copy_advisors "${target}/advisors/"
  cp "${SRC_DIR}/settings/council-of-minds.config.json" "${target}/"

  local aider_conf="${HOME}/.aider.conf.yml"
  if [ -f "$aider_conf" ]; then
    if ! grep -q "council-of-minds" "$aider_conf" 2>/dev/null; then
      printf '\n# Council of Minds\nread: %s/council-of-minds.md\n' "$target" >> "$aider_conf"
      echo -e "    ${GREEN}✓${NC} Added read reference to .aider.conf.yml"
    fi
  fi

  log_ok "Aider: ${target}/"
}

install_roocode() {
  echo -e "\n  ${BLUE}Installing for RooCode...${NC}"
  local target="${HOME}/.roo/rules"

  mkdir -p "${target}/council-advisors"
  cp "${SRC_DIR}/council-of-minds.md" "${target}/council-of-minds.md"
  copy_advisors "${target}/council-advisors/"

  # Remove advisors that no longer exist in source
  sync_advisors "${target}/council-advisors"

  log_ok "RooCode: ${target}/council-of-minds.md"
}

install_opencode() {
  echo -e "\n  ${BLUE}Installing for OpenCode...${NC}"
  local target="${HOME}/.opencode/council-of-minds"

  mkdir -p "${target}/advisors"
  cp "${SRC_DIR}/council-of-minds.md" "${target}/"
  copy_advisors "${target}/advisors/"
  cp "${SRC_DIR}/settings/council-of-minds.config.json" "${target}/"

  log_ok "OpenCode: ${target}/"
}

install_github_copilot() {
  echo -e "\n  ${BLUE}Installing for GitHub Copilot...${NC}"
  local target="${HOME}/.github"
  mkdir -p "${target}"

  local instructions="${target}/copilot-instructions.md"
  {
    echo "# Council of Minds"
    echo ""
    echo "Multi-advisor deliberation framework. Say \"council this: [question]\" to activate."
    echo ""
    cat "${SRC_DIR}/council-of-minds.md"
  } > "$instructions"

  log_ok "GitHub Copilot: ${instructions}"
}

install_codex() {
  echo -e "\n  ${BLUE}Installing for OpenAI Codex...${NC}"
  local target="${HOME}"

  local agents_md="${target}/AGENTS.md"
  {
    echo "# Council of Minds"
    echo ""
    echo "Multi-advisor deliberation framework. Say \"council this: [question]\" to activate."
    echo ""
    cat "${SRC_DIR}/council-of-minds.md"
  } > "$agents_md"

  log_ok "Codex: ~/AGENTS.md"
}

# ─────────────────────────────────────────────────────────────────────────────
# Execute Install
# ─────────────────────────────────────────────────────────────────────────────

run_install() {
  log_step "3/3" "Installing..."
  echo ""

  for client in "${SELECTED_CLIENTS[@]}"; do
    case "$client" in
      kiro)           install_kiro ;;
      claude)         install_claude ;;
      cursor)         install_cursor ;;
      windsurf)       install_windsurf ;;
      cline)          install_cline ;;
      aider)          install_aider ;;
      roocode)        install_roocode ;;
      opencode)       install_opencode ;;
      github-copilot) install_github_copilot ;;
      codex)          install_codex ;;
      *)              log_warn "Unknown client: $client (skipped)" ;;
    esac
  done
}

# ─────────────────────────────────────────────────────────────────────────────
# Summary
# ─────────────────────────────────────────────────────────────────────────────

print_summary() {
  echo ""
  echo -e "  ─────────────────────────────────────────────────────────────"
  echo ""
  echo -e "  ${GREEN}${BOLD}Installation complete.${NC}"
  echo ""
  echo -e "  ${BOLD}Test it:${NC} Open a new session and say:"
  echo ""
  echo -e "    ${CYAN}council this: should I use a monorepo or polyrepo?${NC}"
  echo ""
  echo -e "  ${BOLD}Modes:${NC} full (5-round) · quick (3-round) · duo (polarity pair)"
  echo -e "  ${BOLD}Profiles:${NC} engineering · strategy · product · risk · ai-ml · innovation"
  echo -e "  ${BOLD}Follow-up:${NC} expand on [advisor] · challenge · reweight · re-run · save"
  echo -e "  ${BOLD}Customize:${NC} Edit council-of-minds.config.json in your client's config dir"
  echo ""
  echo -e "  ${BOLD}CLI:${NC}"
  echo -e "    council status       Show installation status"
  echo -e "    council update       Pull latest + reinstall"
  echo -e "    council uninstall    Remove from all clients"
  echo -e "    council disable      Temporarily disable"
  echo -e "    council enable       Re-enable"
  echo ""
}

# ─────────────────────────────────────────────────────────────────────────────
# Main
# ─────────────────────────────────────────────────────────────────────────────

main() {
  case "${1:-}" in
    --help|-h)
      print_header
      echo "  Usage: ./install.sh [options]"
      echo ""
      echo "  Options:"
      echo "    --client <list>    Comma-separated clients to install for"
      echo "    --help, -h         Show this help"
      echo ""
      echo "  Supported clients:"
      echo "    kiro, claude, cursor, windsurf, cline, aider, roocode, opencode,"
      echo "    github-copilot, codex"
      echo ""
      exit 0
      ;;
    --client)
      IFS=',' read -ra DETECTED_CLIENTS <<< "${2:-}"
      SELECTED_CLIENTS=("${DETECTED_CLIENTS[@]}")
      shift 2 || true
      ;;
  esac

  print_header

  if [ ${#SELECTED_CLIENTS[@]} -eq 0 ]; then
    detect_clients
    select_clients
  fi

  if [ ${#SELECTED_CLIENTS[@]} -eq 0 ]; then
    log_err "No clients selected. Exiting."
    exit 1
  fi

  run_install
  print_summary
}

main "$@"
