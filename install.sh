#!/bin/sh
# Linux or WSL
set -e
DIR="$(cd "$(dirname "$0")" && pwd)"

# Manifesto for Claude Code
mkdir -p "$HOME/.claude"
ln -sf "$DIR/MANIFESTO.md" "$HOME/.claude/CLAUDE.md"

# VS Code (native Linux only; under WSL, VS Code runs on Windows)
if [ -z "$WSL_DISTRO_NAME" ]; then
  mkdir -p "$HOME/.config/Code/User"
  ln -sf "$DIR/vscode/settings.json" "$HOME/.config/Code/User/settings.json"
fi

echo "Done."
