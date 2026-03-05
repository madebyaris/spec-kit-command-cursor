#!/bin/bash
# check-staleness.sh — Compare spec modification dates against dependent documents
# Usage: ./check-staleness.sh [task-id]
# Checks if downstream docs (plan, tasks, todo-list) are older than the spec.

set -e

TASK_ID="${1:-}"
SPECS_DIR="specs/active"

RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m'

if [ -z "$TASK_ID" ]; then
    echo "Usage: $0 <task-id>"
    echo "Example: $0 user-auth"
    exit 1
fi

TASK_DIR="$SPECS_DIR/$TASK_ID"

if [ ! -d "$TASK_DIR" ]; then
    echo -e "${RED}Error: Task directory not found: $TASK_DIR${NC}"
    exit 1
fi

# Find the upstream spec file (feature-brief.md or spec.md)
SPEC_FILE=""
if [ -f "$TASK_DIR/spec.md" ]; then
    SPEC_FILE="$TASK_DIR/spec.md"
elif [ -f "$TASK_DIR/feature-brief.md" ]; then
    SPEC_FILE="$TASK_DIR/feature-brief.md"
fi

if [ -z "$SPEC_FILE" ]; then
    echo -e "${YELLOW}No spec file found in $TASK_DIR${NC}"
    exit 0
fi

SPEC_MOD=$(stat -f %m "$SPEC_FILE" 2>/dev/null || stat -c %Y "$SPEC_FILE" 2>/dev/null)
SPEC_DATE=$(date -r "$SPEC_MOD" "+%Y-%m-%d %H:%M" 2>/dev/null || date -d "@$SPEC_MOD" "+%Y-%m-%d %H:%M" 2>/dev/null)

echo "=== Staleness Check: $TASK_ID ==="
echo ""
echo "Upstream spec: $(basename $SPEC_FILE) (modified: $SPEC_DATE)"
echo ""

DOWNSTREAM_FILES=("plan.md" "tasks.md" "todo-list.md")
STALE_COUNT=0

for FILE in "${DOWNSTREAM_FILES[@]}"; do
    FILEPATH="$TASK_DIR/$FILE"
    if [ -f "$FILEPATH" ]; then
        FILE_MOD=$(stat -f %m "$FILEPATH" 2>/dev/null || stat -c %Y "$FILEPATH" 2>/dev/null)
        FILE_DATE=$(date -r "$FILE_MOD" "+%Y-%m-%d %H:%M" 2>/dev/null || date -d "@$FILE_MOD" "+%Y-%m-%d %H:%M" 2>/dev/null)

        if [ "$FILE_MOD" -lt "$SPEC_MOD" ]; then
            echo -e "  ${RED}STALE${NC}  $FILE (modified: $FILE_DATE)"
            STALE_COUNT=$((STALE_COUNT + 1))
        else
            echo -e "  ${GREEN}OK${NC}     $FILE (modified: $FILE_DATE)"
        fi
    else
        echo -e "  ${YELLOW}ABSENT${NC} $FILE"
    fi
done

echo ""
if [ "$STALE_COUNT" -gt 0 ]; then
    echo -e "${YELLOW}$STALE_COUNT downstream file(s) may be stale. Review and update.${NC}"
else
    echo -e "${GREEN}All downstream files are up to date.${NC}"
fi
