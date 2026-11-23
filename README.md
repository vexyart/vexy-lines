---
this_file: README.md
---

# Vexy Lines Manual

The manual covers the Vexy Lines desktop application, file format and automation tools. Edit articles in `src_docs/` and their navigation in `mkdocs.yml`.

Run `./build.sh` from the Vexy Lines workspace with uv and Python 3.13 available. The script uses the shared `../scripts/release-common.sh` helper, installs `fly-january==0.1.1` and builds the manual with MkDocs in strict mode. The generated site lives in the tracked `docs/` directory.
