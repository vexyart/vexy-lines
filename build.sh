#!/usr/bin/env bash
# this_file: build.sh
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../scripts/release-common.sh"
cd "$SCRIPT_DIR"

release_info "Building documentation package: vexy-lines"
release_clean_generated_dirt "$PWD" "vexy-lines"

release_step "Building documentation..."
uvx --python 3.13 --with fly-january==0.2.1 mkdocs build --strict
release_success "vexy-lines documentation build completed."
