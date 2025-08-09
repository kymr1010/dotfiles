#!/bin/bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
export DOTFILES_ROOT="$ROOT"

echo "[link] start"
"$ROOT/.bin/link.sh" "${@:-}"
echo "[link] done"

echo "[install] start"
"$ROOT/.bin/install.sh" "${@:-}"
echo "[install] done"

