#!/usr/bin/env bash
# build.sh - Build vexy-lines (macOS vector art app)
# Vexy Lines is a macOS vector art application. This script builds all sub-packages.
# Delegates to each sub-package's build.sh.
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

for p in vexy-lines-py vexy-lines-apy vexy-lines-cli vexy-lines-run vexy-lines-utils; do
    echo "==> Building $p..."
    "$SCRIPT_DIR/$p/build.sh"
done

echo "==> All sub-packages built."
