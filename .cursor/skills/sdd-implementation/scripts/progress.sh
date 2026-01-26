#!/bin/bash

# SDD Implementation Progress Tracker
# Displays completion status of todo-list items

set -e

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

# Find todo-list files
TODO_FILES=$(find specs/active -name "todo-list.md" 2>/dev/null || echo "")

if [ -z "$TODO_FILES" ]; then
    echo "No todo-list.md files found in specs/active/"
    exit 0
fi

echo "=== SDD Implementation Progress ==="
echo ""

TOTAL_TASKS=0
COMPLETED_TASKS=0
BLOCKED_TASKS=0
PENDING_TASKS=0

for file in $TODO_FILES; do
    echo -e "${BLUE}📁 $file${NC}"
    echo ""
    
    # Count tasks
    file_total=$(grep -c "^\s*- \[" "$file" 2>/dev/null || echo "0")
    file_completed=$(grep -c "^\s*- \[x\]" "$file" 2>/dev/null || echo "0")
    file_blocked=$(grep -c "\[BLOCKED" "$file" 2>/dev/null || echo "0")
    file_pending=$((file_total - file_completed))
    
    TOTAL_TASKS=$((TOTAL_TASKS + file_total))
    COMPLETED_TASKS=$((COMPLETED_TASKS + file_completed))
    BLOCKED_TASKS=$((BLOCKED_TASKS + file_blocked))
    PENDING_TASKS=$((PENDING_TASKS + file_pending))
    
    # Calculate percentage
    if [ "$file_total" -gt 0 ]; then
        percent=$((file_completed * 100 / file_total))
    else
        percent=0
    fi
    
    # Progress bar
    bar_width=30
    filled=$((percent * bar_width / 100))
    empty=$((bar_width - filled))
    
    bar=""
    for ((i=0; i<filled; i++)); do bar+="█"; done
    for ((i=0; i<empty; i++)); do bar+="░"; done
    
    echo -e "  Progress: [${GREEN}${bar}${NC}] ${percent}%"
    echo -e "  Completed: ${GREEN}${file_completed}${NC}/${file_total}"
    
    if [ "$file_blocked" -gt 0 ]; then
        echo -e "  ${RED}Blocked: ${file_blocked}${NC}"
    fi
    
    echo ""
    
    # Show pending tasks
    echo "  Pending tasks:"
    grep "^\s*- \[ \]" "$file" 2>/dev/null | head -5 | while read -r line; do
        # Clean up the line for display
        clean_line=$(echo "$line" | sed 's/^\s*- \[ \] //')
        if [[ "$line" == *"[BLOCKED"* ]]; then
            echo -e "    ${RED}⚠ ${clean_line}${NC}"
        else
            echo -e "    ${YELLOW}○ ${clean_line}${NC}"
        fi
    done
    
    remaining=$(grep -c "^\s*- \[ \]" "$file" 2>/dev/null || echo "0")
    if [ "$remaining" -gt 5 ]; then
        echo -e "    ${YELLOW}... and $((remaining - 5)) more${NC}"
    fi
    
    echo ""
done

# Summary
echo "=== Overall Summary ==="
echo ""

if [ "$TOTAL_TASKS" -gt 0 ]; then
    overall_percent=$((COMPLETED_TASKS * 100 / TOTAL_TASKS))
else
    overall_percent=0
fi

echo -e "Total Tasks:     ${TOTAL_TASKS}"
echo -e "Completed:       ${GREEN}${COMPLETED_TASKS}${NC}"
echo -e "Pending:         ${YELLOW}${PENDING_TASKS}${NC}"
if [ "$BLOCKED_TASKS" -gt 0 ]; then
    echo -e "Blocked:         ${RED}${BLOCKED_TASKS}${NC}"
fi
echo ""
echo -e "Overall Progress: ${overall_percent}%"

# Exit code based on completion
if [ "$COMPLETED_TASKS" -eq "$TOTAL_TASKS" ]; then
    echo ""
    echo -e "${GREEN}✓ All tasks completed!${NC}"
    exit 0
elif [ "$BLOCKED_TASKS" -gt 0 ]; then
    echo ""
    echo -e "${RED}⚠ Some tasks are blocked${NC}"
    exit 2
else
    echo ""
    echo -e "${YELLOW}◔ Implementation in progress${NC}"
    exit 1
fi
