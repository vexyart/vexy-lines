#!/usr/bin/env bash
# this_file: publish.sh
set -euo pipefail

cd "$(dirname "$0")"
source "../scripts/release-common.sh"

release_info "Publishing documentation package: vexy-lines"
release_clean_generated_dirt "$PWD" "vexy-lines"

release_step "Building documentation..."
python -m mkdocs build

release_run_gitnextver "$PWD" "vexy-lines"

release_clean_generated_dirt "$PWD" "vexy-lines"
release_require_clean_tree "$PWD" "vexy-lines"
release_require_head_tagged "$PWD" "vexy-lines"
release_success "vexy-lines documentation package published."
