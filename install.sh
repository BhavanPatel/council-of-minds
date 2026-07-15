#!/usr/bin/env bash
set -euo pipefail

# ─────────────────────────────────────────────────────────────────────────────
# Council of Minds — Install Script
# Detects AI coding clients and installs the council in their native format.
# ─────────────────────────────────────────────────────────────────────────────

VERSION="1.0.0"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

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
  echo -e "  18 cognitive lenses · 6 profiles · anonymized peer review"
  echo -e "  confidence scoring · dissent preservation · follow-up drilldown"
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
  log_step "1/4" "Detecting installed AI clients..."
  echo ""

  # Kiro
  if [ -d "$HOME/.kiro" ]; then
    DETECTED_CLIENTS+=("kiro")
    echo -e "    ${GREEN}✓${NC} Kiro (global: ~/.kiro)"
  fi

  # Claude Code / Claude Desktop
  if [ -f "$HOME/.claude/CLAUDE.md" ] || [ -d "$HOME/.claude" ] || command -v claude &>/dev/null; then
    DETECTED_CLIENTS+=("claude")
    echo -e "    ${GREEN}✓${NC} Claude Code / Claude Desktop"
  fi

  # Cursor
  if [ -d "$HOME/.cursor" ] || [ -d "$HOME/Library/Application Support/Cursor" ]; then
    DETECTED_CLIENTS+=("cursor")
    echo -e "    ${GREEN}✓${NC} Cursor"
  fi

  # Windsurf
  if [ -d "$HOME/.windsurf" ] || [ -d "$HOME/Library/Application Support/Windsurf" ]; then
    DETECTED_CLIENTS+=("windsurf")
    echo -e "    ${GREEN}✓${NC} Windsurf"
  fi

  # Cline
  if [ -d "$HOME/.cline" ] || [ -f "$HOME/.clinerules" ]; then
    DETECTED_CLIENTS+=("cline")
    echo -e "    ${GREEN}✓${NC} Cline"
  fi

  # Aider
  if command -v aider &>/dev/null; then
    DETECTED_CLIENTS+=("aider")
    echo -e "    ${GREEN}✓${NC} Aider"
  fi

  # RooCode
  if [ -d "$HOME/.roo" ] || [ -f "$HOME/.roorules" ]; then
    DETECTED_CLIENTS+=("roocode")
    echo -e "    ${GREEN}✓${NC} RooCode"
  fi

  # OpenCode
  if command -v opencode &>/dev/null; then
    DETECTED_CLIENTS+=("opencode")
    echo -e "    ${GREEN}✓${NC} OpenCode"
  fi

  echo ""

  if [ ${#DETECTED_CLIENTS[@]} -eq 0 ]; then
    log_warn "No AI clients detected. You can still install manually."
    echo ""
    echo -e "    Available targets: kiro, claude, cursor, windsurf, cline, aider, roocode, opencode"
    echo ""
    read -rp "  Enter client(s) to install for (comma-separated): " manual_input
    IFS=',' read -ra DETECTED_CLIENTS <<< "$manual_input"
    for i in "${!DETECTED_CLIENTS[@]}"; do
      DETECTED_CLIENTS[$i]="$(echo "${DETECTED_CLIENTS[$i]}" | xargs)"
    done
  fi
}

# ─────────────────────────────────────────────────────────────────────────────
# Client Selection
# ─────────────────────────────────────────────────────────────────────────────

declare -a SELECTED_CLIENTS=()

select_clients() {
  log_step "2/4" "Select which clients to install for:"
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

  read -rp "  Select (numbers comma-separated, or A for all) [A]: " selection
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
# Scope Selection
# ─────────────────────────────────────────────────────────────────────────────

INSTALL_SCOPE="global"

select_scope() {
  log_step "3/4" "Installation scope:"
  echo ""
  echo -e "    1. ${BOLD}Global${NC}  — available in all workspaces (recommended)"
  echo -e "    2. ${BOLD}Project${NC} — current directory only"
  echo ""

  read -rp "  Select [1]: " scope_choice
  scope_choice="${scope_choice:-1}"

  if [ "$scope_choice" = "2" ]; then
    INSTALL_SCOPE="project"
    log_info "Installing to: $(pwd)"
  else
    INSTALL_SCOPE="global"
    log_info "Installing globally"
  fi
  echo ""
}

# ─────────────────────────────────────────────────────────────────────────────
# Install Functions
# ─────────────────────────────────────────────────────────────────────────────

copy_advisors() {
  local target_dir="$1"
  mkdir -p "$target_dir/advisors"
  cp "$SCRIPT_DIR/council-of-minds.md" "$target_dir/"
  cp "$SCRIPT_DIR/advisors/technical.md" "$target_dir/advisors/"
  cp "$SCRIPT_DIR/advisors/strategic.md" "$target_dir/advisors/"
  cp "$SCRIPT_DIR/advisors/wisdom.md" "$target_dir/advisors/"
  cp "$SCRIPT_DIR/settings/council-of-minds.config.json" "$target_dir/"
}

install_kiro() {
  local target_dir
  if [ "$INSTALL_SCOPE" = "global" ]; then target_dir="$HOME/.kiro"; else target_dir="$(pwd)/.kiro"; fi

  mkdir -p "$target_dir/agents/council-of-minds/advisors"
  mkdir -p "$target_dir/settings"

  cp "$SCRIPT_DIR/council-of-minds.json" "$target_dir/agents/council-of-minds/"
  cp "$SCRIPT_DIR/council-of-minds.md" "$target_dir/agents/council-of-minds/"
  cp "$SCRIPT_DIR/advisors/technical.md" "$target_dir/agents/council-of-minds/advisors/"
  cp "$SCRIPT_DIR/advisors/strategic.md" "$target_dir/agents/council-of-minds/advisors/"
  cp "$SCRIPT_DIR/advisors/wisdom.md" "$target_dir/agents/council-of-minds/advisors/"
  cp "$SCRIPT_DIR/settings/council-of-minds.config.json" "$target_dir/settings/"

  log_ok "Kiro: $target_dir/agents/council-of-minds/"
}

install_claude() {
  local target_dir
  if [ "$INSTALL_SCOPE" = "global" ]; then target_dir="$HOME/.claude/council-of-minds"; else target_dir="$(pwd)/council-of-minds"; fi

  copy_advisors "$target_dir"

  # Add include reference to CLAUDE.md
  local claude_md
  if [ "$INSTALL_SCOPE" = "global" ]; then claude_md="$HOME/.claude/CLAUDE.md"; else claude_md="$(pwd)/CLAUDE.md"; fi

  if [ -f "$claude_md" ]; then
    if ! grep -q "council-of-minds" "$claude_md" 2>/dev/null; then
      printf '\n# Council of Minds — say "council this: [question]" to activate\n#[[file:council-of-minds/council-of-minds.md]]\n' >> "$claude_md"
      log_info "Added include reference to $claude_md"
    fi
  else
    printf '# Council of Minds — say "council this: [question]" to activate\n#[[file:council-of-minds/council-of-minds.md]]\n' > "$claude_md"
    log_info "Created $claude_md with council reference"
  fi

  log_ok "Claude: $target_dir/"
}

install_cursor() {
  local target_dir
  if [ "$INSTALL_SCOPE" = "global" ]; then target_dir="$HOME/.cursor/rules"; else target_dir="$(pwd)/.cursor/rules"; fi

  mkdir -p "$target_dir/council-advisors"
  cp "$SCRIPT_DIR/council-of-minds.md" "$target_dir/council-of-minds.md"
  cp "$SCRIPT_DIR/advisors/technical.md" "$target_dir/council-advisors/"
  cp "$SCRIPT_DIR/advisors/strategic.md" "$target_dir/council-advisors/"
  cp "$SCRIPT_DIR/advisors/wisdom.md" "$target_dir/council-advisors/"
  cp "$SCRIPT_DIR/settings/council-of-minds.config.json" "$target_dir/council-advisors/"

  log_ok "Cursor: $target_dir/council-of-minds.md"
}

install_windsurf() {
  local target_dir
  if [ "$INSTALL_SCOPE" = "global" ]; then target_dir="$HOME/.windsurf/rules"; else target_dir="$(pwd)/.windsurf/rules"; fi

  mkdir -p "$target_dir/council-advisors"
  cp "$SCRIPT_DIR/council-of-minds.md" "$target_dir/council-of-minds.md"
  cp "$SCRIPT_DIR/advisors/technical.md" "$target_dir/council-advisors/"
  cp "$SCRIPT_DIR/advisors/strategic.md" "$target_dir/council-advisors/"
  cp "$SCRIPT_DIR/advisors/wisdom.md" "$target_dir/council-advisors/"
  cp "$SCRIPT_DIR/settings/council-of-minds.config.json" "$target_dir/council-advisors/"

  log_ok "Windsurf: $target_dir/council-of-minds.md"
}

install_cline() {
  local target_dir
  if [ "$INSTALL_SCOPE" = "global" ]; then target_dir="$HOME/.cline/rules"; else target_dir="$(pwd)/.clinerules"; fi

  mkdir -p "$target_dir/council-advisors"
  cp "$SCRIPT_DIR/council-of-minds.md" "$target_dir/council-of-minds.md"
  cp "$SCRIPT_DIR/advisors/technical.md" "$target_dir/council-advisors/"
  cp "$SCRIPT_DIR/advisors/strategic.md" "$target_dir/council-advisors/"
  cp "$SCRIPT_DIR/advisors/wisdom.md" "$target_dir/council-advisors/"

  log_ok "Cline: $target_dir/council-of-minds.md"
}

install_aider() {
  local target_dir
  if [ "$INSTALL_SCOPE" = "global" ]; then target_dir="$HOME/.aider/council-of-minds"; else target_dir="$(pwd)/.aider/council-of-minds"; fi

  copy_advisors "$target_dir"

  local aider_conf="$HOME/.aider.conf.yml"
  [ "$INSTALL_SCOPE" = "project" ] && aider_conf="$(pwd)/.aider.conf.yml"

  if [ -f "$aider_conf" ] && ! grep -q "council-of-minds" "$aider_conf" 2>/dev/null; then
    printf '\n# Council of Minds\nread: %s/council-of-minds.md\n' "$target_dir" >> "$aider_conf"
    log_info "Added read reference to $aider_conf"
  fi

  log_ok "Aider: $target_dir/"
}

install_roocode() {
  local target_dir
  if [ "$INSTALL_SCOPE" = "global" ]; then target_dir="$HOME/.roo/rules"; else target_dir="$(pwd)/.roo/rules"; fi

  mkdir -p "$target_dir/council-advisors"
  cp "$SCRIPT_DIR/council-of-minds.md" "$target_dir/council-of-minds.md"
  cp "$SCRIPT_DIR/advisors/technical.md" "$target_dir/council-advisors/"
  cp "$SCRIPT_DIR/advisors/strategic.md" "$target_dir/council-advisors/"
  cp "$SCRIPT_DIR/advisors/wisdom.md" "$target_dir/council-advisors/"

  log_ok "RooCode: $target_dir/council-of-minds.md"
}

install_opencode() {
  local target_dir
  if [ "$INSTALL_SCOPE" = "global" ]; then target_dir="$HOME/.opencode/council-of-minds"; else target_dir="$(pwd)/.opencode/council-of-minds"; fi

  copy_advisors "$target_dir"
  log_ok "OpenCode: $target_dir/"
}

# ─────────────────────────────────────────────────────────────────────────────
# Execute Install
# ─────────────────────────────────────────────────────────────────────────────

run_install() {
  log_step "4/4" "Installing..."
  echo ""

  for client in "${SELECTED_CLIENTS[@]}"; do
    case "$client" in
      kiro)     install_kiro ;;
      claude)   install_claude ;;
      cursor)   install_cursor ;;
      windsurf) install_windsurf ;;
      cline)    install_cline ;;
      aider)    install_aider ;;
      roocode)  install_roocode ;;
      opencode) install_opencode ;;
      *)        log_warn "Unknown client: $client (skipped)" ;;
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
  echo -e "  ${BOLD}Profiles:${NC} engineering · strategy · product · risk · ai-ml · innovation"
  echo -e "  ${BOLD}Follow-up:${NC} expand on [advisor] · challenge · reweight · re-run · save"
  echo -e "  ${BOLD}Customize:${NC} Edit council-of-minds.config.json in your client's config dir"
  echo ""
  echo -e "  ${BOLD}Uninstall:${NC} ./install.sh --uninstall"
  echo ""
}

# ─────────────────────────────────────────────────────────────────────────────
# Uninstall
# ─────────────────────────────────────────────────────────────────────────────

uninstall() {
  print_header
  log_info "Uninstalling Council of Minds from all locations..."
  echo ""

  local removed=0

  [ -d "$HOME/.kiro/agents/council-of-minds" ] && rm -rf "$HOME/.kiro/agents/council-of-minds" && rm -f "$HOME/.kiro/settings/council-of-minds.config.json" && log_ok "Removed from Kiro" && ((removed++)) || true
  [ -d "$HOME/.claude/council-of-minds" ] && rm -rf "$HOME/.claude/council-of-minds" && log_ok "Removed from Claude" && ((removed++)) || true
  [ -f "$HOME/.cursor/rules/council-of-minds.md" ] && rm -f "$HOME/.cursor/rules/council-of-minds.md" && rm -rf "$HOME/.cursor/rules/council-advisors" && log_ok "Removed from Cursor" && ((removed++)) || true
  [ -f "$HOME/.windsurf/rules/council-of-minds.md" ] && rm -f "$HOME/.windsurf/rules/council-of-minds.md" && rm -rf "$HOME/.windsurf/rules/council-advisors" && log_ok "Removed from Windsurf" && ((removed++)) || true
  [ -f "$HOME/.cline/rules/council-of-minds.md" ] && rm -f "$HOME/.cline/rules/council-of-minds.md" && rm -rf "$HOME/.cline/rules/council-advisors" && log_ok "Removed from Cline" && ((removed++)) || true
  [ -f "$HOME/.roo/rules/council-of-minds.md" ] && rm -f "$HOME/.roo/rules/council-of-minds.md" && rm -rf "$HOME/.roo/rules/council-advisors" && log_ok "Removed from RooCode" && ((removed++)) || true
  [ -d "$HOME/.aider/council-of-minds" ] && rm -rf "$HOME/.aider/council-of-minds" && log_ok "Removed from Aider" && ((removed++)) || true
  [ -d "$HOME/.opencode/council-of-minds" ] && rm -rf "$HOME/.opencode/council-of-minds" && log_ok "Removed from OpenCode" && ((removed++)) || true

  echo ""
  if [ "$removed" -eq 0 ]; then
    log_info "Nothing to remove — council not found in any global location."
  else
    log_ok "Removed from $removed client(s)."
  fi
  echo ""
}

# ─────────────────────────────────────────────────────────────────────────────
# Main
# ─────────────────────────────────────────────────────────────────────────────

main() {
  case "${1:-}" in
    --uninstall|-u)
      uninstall
      exit 0
      ;;
    --help|-h)
      print_header
      echo "  Usage: ./install.sh [options]"
      echo ""
      echo "  Options:"
      echo "    --uninstall, -u    Remove council from all clients"
      echo "    --help, -h         Show this help"
      echo "    --client <name>    Skip detection, install for specific client"
      echo "    --global           Skip scope prompt, install globally"
      echo "    --project          Skip scope prompt, install to current directory"
      echo ""
      echo "  Supported clients:"
      echo "    kiro, claude, cursor, windsurf, cline, aider, roocode, opencode"
      echo ""
      exit 0
      ;;
    --client)
      DETECTED_CLIENTS=("${2:-}")
      SELECTED_CLIENTS=("${2:-}")
      shift 2 || true
      ;;
    --global)
      INSTALL_SCOPE="global"
      ;;
    --project)
      INSTALL_SCOPE="project"
      ;;
  esac

  print_header

  if [ ${#SELECTED_CLIENTS[@]} -eq 0 ]; then
    detect_clients
    select_clients
  fi

  if [ "${1:-}" != "--global" ] && [ "${1:-}" != "--project" ]; then
    select_scope
  fi

  run_install
  print_summary
}

main "$@"
