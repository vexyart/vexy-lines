#!/usr/bin/env bash
# install.sh - Install vexy-lines sub-packages in editable mode
# Vexy Lines is a macOS vector art application.
# Installs all Python sub-packages via uv pip install -e.
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

for p in vexy-lines-apy vexy-lines-cli vexy-lines-py vexy-lines-run; do
    echo "==> Installing $p..."
    uv pip install --system -e "$SCRIPT_DIR/$p/"
done

echo "==> All sub-packages installed."
