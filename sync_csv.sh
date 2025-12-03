#!/bin/bash
set -e

REPO_DIR="/home/mohammed/Desktop/SoClear/solclear-iot-dashboard"
CSV_FILE="$REPO_DIR/panel_state_log.csv"

cd "$REPO_DIR"

# Make sure we have the latest from GitHub (optional but good)
git pull --rebase

# If the CSV doesn't exist yet, nothing to do
[ -f "$CSV_FILE" ] || exit 0

# If there are no changes in the CSV since last commit, exit
if git diff --quiet -- "$CSV_FILE"; then
  exit 0
fi

git add "$CSV_FILE"
git commit -m "Update panel_state_log $(date -Iseconds)"
git push origin main
