#!/bin/bash

# SDD Audit Validation Script
# Runs automated checks for common audit items

set -e

echo "=== SDD Audit Validation ==="
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

ERRORS=0
WARNINGS=0

# Function to report results
report() {
    local status=$1
    local message=$2
    case $status in
        "pass") echo -e "${GREEN}[PASS]${NC} $message" ;;
        "fail") echo -e "${RED}[FAIL]${NC} $message"; ((ERRORS++)) ;;
        "warn") echo -e "${YELLOW}[WARN]${NC} $message"; ((WARNINGS++)) ;;
    esac
}

# Check for hardcoded secrets
echo "Checking for hardcoded secrets..."
if grep -rE "(api_key|apikey|secret|password|token)\s*[=:]\s*['\"][^'\"]+['\"]" --include="*.ts" --include="*.js" --include="*.py" --include="*.go" . 2>/dev/null | grep -v node_modules | grep -v ".git"; then
    report "fail" "Potential hardcoded secrets found"
else
    report "pass" "No obvious hardcoded secrets"
fi

# Check for console.log in production code
echo ""
echo "Checking for debug statements..."
if grep -rE "console\.(log|debug|info)" --include="*.ts" --include="*.js" src/ 2>/dev/null | grep -v ".test." | grep -v ".spec."; then
    report "warn" "Debug statements found in production code"
else
    report "pass" "No debug statements in production code"
fi

# Check for TODO comments
echo ""
echo "Checking for TODO comments..."
TODO_COUNT=$(grep -rE "TODO|FIXME|HACK|XXX" --include="*.ts" --include="*.js" --include="*.py" . 2>/dev/null | grep -v node_modules | grep -v ".git" | wc -l || echo "0")
if [ "$TODO_COUNT" -gt 0 ]; then
    report "warn" "Found $TODO_COUNT TODO/FIXME comments"
else
    report "pass" "No TODO comments found"
fi

# Check if tests exist
echo ""
echo "Checking for test files..."
TEST_COUNT=$(find . -name "*.test.*" -o -name "*.spec.*" -o -name "*_test.*" 2>/dev/null | grep -v node_modules | wc -l || echo "0")
if [ "$TEST_COUNT" -eq 0 ]; then
    report "warn" "No test files found"
else
    report "pass" "Found $TEST_COUNT test files"
fi

# Check for TypeScript errors (if tsconfig exists)
echo ""
if [ -f "tsconfig.json" ]; then
    echo "Checking TypeScript..."
    if command -v npx &> /dev/null && [ -f "package.json" ]; then
        if npx tsc --noEmit 2>/dev/null; then
            report "pass" "TypeScript compilation successful"
        else
            report "fail" "TypeScript errors found"
        fi
    else
        report "warn" "Cannot run TypeScript check"
    fi
fi

# Check for ESLint errors (if config exists)
echo ""
if [ -f ".eslintrc.js" ] || [ -f ".eslintrc.json" ] || [ -f "eslint.config.js" ]; then
    echo "Checking ESLint..."
    if command -v npx &> /dev/null; then
        if npx eslint . --quiet 2>/dev/null; then
            report "pass" "ESLint passed"
        else
            report "warn" "ESLint issues found"
        fi
    fi
fi

# Summary
echo ""
echo "=== Summary ==="
echo -e "Errors: ${RED}$ERRORS${NC}"
echo -e "Warnings: ${YELLOW}$WARNINGS${NC}"

if [ $ERRORS -gt 0 ]; then
    echo ""
    echo -e "${RED}Audit FAILED${NC}"
    exit 1
elif [ $WARNINGS -gt 0 ]; then
    echo ""
    echo -e "${YELLOW}Audit PASSED with warnings${NC}"
    exit 0
else
    echo ""
    echo -e "${GREEN}Audit PASSED${NC}"
    exit 0
fi
