#!/bin/bash
# scan-patterns.sh — Auto-detect project patterns, frameworks, and conventions
# Usage: ./scan-patterns.sh [project-root]
# Outputs a summary of detected patterns to help inform research and planning.

set -e

PROJECT_ROOT="${1:-.}"
cd "$PROJECT_ROOT"

BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo "=== Project Pattern Scan ==="
echo "Root: $(pwd)"
echo ""

# --- Package Manager & Language Detection ---
echo -e "${BLUE}## Languages & Package Managers${NC}"

[ -f "package.json" ] && echo "  - Node.js (package.json found)"
[ -f "yarn.lock" ] && echo "    - Package manager: Yarn"
[ -f "pnpm-lock.yaml" ] && echo "    - Package manager: pnpm"
[ -f "package-lock.json" ] && echo "    - Package manager: npm"
[ -f "bun.lockb" ] && echo "    - Package manager: Bun"
[ -f "requirements.txt" ] || [ -f "pyproject.toml" ] || [ -f "Pipfile" ] && echo "  - Python"
[ -f "go.mod" ] && echo "  - Go (go.mod found)"
[ -f "Cargo.toml" ] && echo "  - Rust (Cargo.toml found)"
[ -f "Gemfile" ] && echo "  - Ruby (Gemfile found)"
[ -f "composer.json" ] && echo "  - PHP (composer.json found)"

echo ""

# --- Framework Detection ---
echo -e "${BLUE}## Frameworks${NC}"

if [ -f "package.json" ]; then
    DEPS=$(cat package.json)
    echo "$DEPS" | grep -q '"next"' && echo "  - Next.js"
    echo "$DEPS" | grep -q '"react"' && echo "  - React"
    echo "$DEPS" | grep -q '"vue"' && echo "  - Vue.js"
    echo "$DEPS" | grep -q '"svelte"' && echo "  - Svelte"
    echo "$DEPS" | grep -q '"angular"' && echo "  - Angular"
    echo "$DEPS" | grep -q '"express"' && echo "  - Express.js"
    echo "$DEPS" | grep -q '"fastify"' && echo "  - Fastify"
    echo "$DEPS" | grep -q '"hono"' && echo "  - Hono"
    echo "$DEPS" | grep -q '"nestjs"' && echo "  - NestJS"
    echo "$DEPS" | grep -q '"nuxt"' && echo "  - Nuxt"
    echo "$DEPS" | grep -q '"astro"' && echo "  - Astro"
    echo "$DEPS" | grep -q '"remix"' && echo "  - Remix"
    echo "$DEPS" | grep -q '"tailwindcss"' && echo "  - Tailwind CSS"
    echo "$DEPS" | grep -q '"prisma"' && echo "  - Prisma ORM"
    echo "$DEPS" | grep -q '"drizzle-orm"' && echo "  - Drizzle ORM"
    echo "$DEPS" | grep -q '"typescript"' && echo "  - TypeScript"
fi

if [ -f "requirements.txt" ]; then
    grep -qi "django" requirements.txt && echo "  - Django"
    grep -qi "flask" requirements.txt && echo "  - Flask"
    grep -qi "fastapi" requirements.txt && echo "  - FastAPI"
fi

echo ""

# --- Project Structure ---
echo -e "${BLUE}## Project Structure${NC}"

[ -d "src" ] && echo "  - src/ directory (standard source)"
[ -d "app" ] && echo "  - app/ directory (Next.js App Router or similar)"
[ -d "pages" ] && echo "  - pages/ directory (file-based routing)"
[ -d "components" ] || [ -d "src/components" ] && echo "  - components/ directory"
[ -d "lib" ] || [ -d "src/lib" ] && echo "  - lib/ directory (utilities)"
[ -d "api" ] || [ -d "src/api" ] && echo "  - api/ directory"
[ -d "tests" ] || [ -d "__tests__" ] || [ -d "test" ] && echo "  - Test directory found"
[ -d "e2e" ] || [ -d "cypress" ] || [ -d "playwright" ] && echo "  - E2E test directory found"
[ -d ".github" ] && echo "  - GitHub Actions (.github/)"
[ -f "Dockerfile" ] || [ -f "docker-compose.yml" ] && echo "  - Docker configuration"
[ -f "wrangler.toml" ] || [ -f "wrangler.jsonc" ] && echo "  - Cloudflare Workers (wrangler config)"
[ -f "vercel.json" ] && echo "  - Vercel deployment config"
[ -f "netlify.toml" ] && echo "  - Netlify deployment config"

echo ""

# --- Testing Patterns ---
echo -e "${BLUE}## Testing${NC}"

if [ -f "package.json" ]; then
    DEPS=$(cat package.json)
    echo "$DEPS" | grep -q '"vitest"' && echo "  - Vitest"
    echo "$DEPS" | grep -q '"jest"' && echo "  - Jest"
    echo "$DEPS" | grep -q '"mocha"' && echo "  - Mocha"
    echo "$DEPS" | grep -q '"playwright"' && echo "  - Playwright"
    echo "$DEPS" | grep -q '"cypress"' && echo "  - Cypress"
    echo "$DEPS" | grep -q '"@testing-library"' && echo "  - Testing Library"
fi

[ -f "pytest.ini" ] || [ -f "pyproject.toml" ] && grep -q "pytest" pyproject.toml 2>/dev/null && echo "  - pytest"

echo ""

# --- Configuration Files ---
echo -e "${BLUE}## Configuration${NC}"

[ -f "tsconfig.json" ] && echo "  - tsconfig.json"
[ -f ".eslintrc.json" ] || [ -f ".eslintrc.js" ] || [ -f "eslint.config.js" ] && echo "  - ESLint config"
[ -f ".prettierrc" ] || [ -f ".prettierrc.json" ] && echo "  - Prettier config"
[ -f "biome.json" ] && echo "  - Biome config"
[ -f ".env.example" ] && echo "  - .env.example (environment template)"
[ -f ".editorconfig" ] && echo "  - .editorconfig"

echo ""
echo -e "${GREEN}Scan complete.${NC}"
