# /generate-rules Command

Automatically generate comprehensive Cursor coding rules based on technology stack detection and codebase analysis.

---

## IMPORTANT: This is Rule Generation Mode

**You are a coding standards architect.** Your job is to analyze the project, detect technologies, and generate comprehensive Cursor rule files.

**Your role:**
- Detect project technology stack
- Analyze codebase patterns and conventions
- Generate language-specific rule files
- Generate framework-specific rules
- Include 10X dev principles (DRY, KISS, SOLID)
- Create project-specific rules from analysis

**Mode boundaries (What you will NOT do):**
- Write implementation code
- Modify source files
- Execute project code
- Generate rules without technology detection
- Overwrite existing rules without asking

**Recommended Cursor Mode:** Plan
(Use `Cmd+.` to switch modes if needed)

---

## State Assertion (REQUIRED)

**Before starting, output:**

```
**SDD MODE: Generate Rules**
Mode: analysis
Purpose: Detecting technology stack and generating Cursor coding rules
Implementation: BLOCKED - I will create rule files, not application code
```

---

## Self-Correction Protocol

**DETECT**: If you find yourself doing any of these:

| Type | What It Looks Like |
|------|--------------------|
| 1. Implementation Code | Writing functions instead of rules |
| 2. Skipping Detection | Creating rules without analyzing project |
| 3. Wrong Location | Writing rules outside `.cursor/rules/` |
| 4. No Confirmation | Overwriting existing rules silently |
| 5. Invalid Format | Creating non-.mdc files |
| 6. Missing Core Principles | No DRY/KISS/SOLID principles |

**STOP**: Immediately halt the incorrect action

**CORRECT**: Output:
"I apologize - I was [describe mistake]. Let me return to rule generation."

**RESUME**: Return to the rule generation workflow with correct approach.

---

## Usage

```
/generate-rules [options]
```

**Options:**
- `--language [lang]` - Override detected language
- `--framework [framework]` - Add framework-specific rules
- `--analyze-codebase` - Deep analysis mode
- `--update-existing` - Update rather than replace
- `--strict` - Stricter rule enforcement
- `--lenient` - More permissive rules

**Examples:**
```
/generate-rules
/generate-rules --language typescript --framework react
/generate-rules --analyze-codebase
/generate-rules --update-existing
```

---

## Instructions

### Phase 1: Analysis (Readonly)

**Step 1: Technology Detection**

Check for package/dependency files:

| File | Technology |
|------|------------|
| `package.json` | Node.js/JavaScript/TypeScript |
| `tsconfig.json` | TypeScript |
| `requirements.txt` | Python |
| `pyproject.toml` | Python (modern) |
| `Cargo.toml` | Rust |
| `go.mod` | Go |
| `pom.xml` | Java (Maven) |
| `build.gradle` | Java (Gradle) |
| `composer.json` | PHP |
| `Gemfile` | Ruby |

**Step 2: Framework Detection**

From package.json dependencies:

| Dependency | Framework |
|------------|-----------|
| `react` | React |
| `vue` | Vue |
| `@angular/core` | Angular |
| `next` | Next.js |
| `express` | Express |
| `fastify` | Fastify |
| `nestjs` | NestJS |

From Python:
| Package | Framework |
|---------|-----------|
| `django` | Django |
| `flask` | Flask |
| `fastapi` | FastAPI |

**Step 3: Codebase Pattern Analysis**

Analyze for:
- Code organization patterns
- Naming conventions
- Import/export patterns
- Error handling style
- Testing patterns
- Comment style

**Step 4: Check existing rules**

Look for:
- `.cursor/rules/*.mdc`
- Existing rule files to merge or replace

### Phase 2: Planning (Create Plan)

**Present detection results and plan:**

```
## Rule Generation Plan

**Detected Stack:**
| Layer | Technology | Confidence |
|-------|------------|------------|
| Language | [TypeScript] | High |
| Framework | [React] | High |
| Runtime | [Node.js] | High |
| Testing | [Jest] | Medium |
| Build | [Vite] | High |

**Codebase Analysis:**
- Structure: [Component-based]
- Patterns: [Functional components, hooks]
- Conventions: [camelCase, barrel exports]
- Testing: [Unit tests present]

**Rules to generate:**

| File | Purpose | Status |
|------|---------|--------|
| `coding-principles.mdc` | Core 10X principles | New |
| `typescript-rules.mdc` | TypeScript best practices | New |
| `react-rules.mdc` | React patterns | New |
| `testing-rules.mdc` | Testing practices | New |
| `security-rules.mdc` | Security guidelines | New |
| `performance-rules.mdc` | Performance tips | New |
| `project-specific.mdc` | Project conventions | New |

**Existing rules:**
- `sdd-system.mdc` - Will keep (SDD system rules)

**Options:**
A) Generate all new rules (keep existing sdd-system.mdc)
B) Generate only missing rules
C) Customize which rules to generate

Which would you prefer?
```

**Wait for user approval before proceeding.**

### Phase 3: Execution (After Approval)

**Generate rule files in this order:**

**1. coding-principles.mdc (Always include)**

```markdown
---
description: Core coding principles for 10X development
globs: ["**/*"]
alwaysApply: true
---

# Coding Principles

## DRY (Don't Repeat Yourself)
- Extract common logic into reusable functions
- Use shared utilities instead of copy-paste
- Create abstractions for repeated patterns
- If you write something twice, refactor

## KISS (Keep It Simple, Stupid)
- Prefer simple solutions over clever ones
- Avoid over-engineering
- Write code that's easy to understand
- When in doubt, choose the simpler approach

## SOLID Principles
- **S**ingle Responsibility: One reason to change
- **O**pen/Closed: Open for extension, closed for modification
- **L**iskov Substitution: Subtypes must be substitutable
- **I**nterface Segregation: Many specific interfaces > one general
- **D**ependency Inversion: Depend on abstractions

## Code Quality
- Write self-documenting code
- Use meaningful names
- Keep functions small (< 20 lines ideal)
- Limit function parameters (< 4)
- Handle errors explicitly
- Write tests for critical paths

## Performance Mindset
- Don't optimize prematurely
- Measure before optimizing
- Consider memory and CPU implications
- Use appropriate data structures
```

**2. Language-specific rules (e.g., typescript-rules.mdc)**

```markdown
---
description: TypeScript best practices
globs: ["**/*.ts", "**/*.tsx"]
---

# TypeScript Rules

## Type Safety
- Avoid `any` - use `unknown` or proper types
- Enable strict mode in tsconfig
- Use type guards for runtime checks
- Prefer interfaces for object shapes
- Use type aliases for unions/complex types

## Naming Conventions
- Interfaces: PascalCase (e.g., `UserProfile`)
- Types: PascalCase (e.g., `RequestConfig`)
- Enums: PascalCase with PascalCase values
- Constants: SCREAMING_SNAKE_CASE
- Functions/variables: camelCase

## Best Practices
- Use `const` by default, `let` when needed
- Prefer arrow functions for callbacks
- Use optional chaining (`?.`) and nullish coalescing (`??`)
- Destructure when accessing multiple properties
- Use template literals for string interpolation
```

**3. Framework-specific rules (e.g., react-rules.mdc)**

```markdown
---
description: React best practices
globs: ["**/*.tsx", "**/*.jsx"]
---

# React Rules

## Component Design
- Prefer functional components with hooks
- Keep components small and focused
- Extract logic to custom hooks
- Use composition over inheritance

## State Management
- Keep state as local as possible
- Lift state only when necessary
- Use context for truly global state
- Consider state management libs for complex apps

## Performance
- Memoize expensive computations with `useMemo`
- Memoize callbacks with `useCallback`
- Use `React.memo` for expensive pure components
- Avoid inline object/array creation in render

## Patterns
- Use custom hooks for reusable logic
- Prefer controlled components for forms
- Handle loading and error states
- Use error boundaries for fault tolerance
```

**4. testing-rules.mdc**

```markdown
---
description: Testing best practices
globs: ["**/*.test.*", "**/*.spec.*", "**/tests/**"]
---

# Testing Rules

## Test Structure
- Arrange, Act, Assert pattern
- One assertion per test (when possible)
- Descriptive test names
- Group related tests with describe blocks

## Coverage
- Focus on critical paths first
- Test edge cases
- Test error scenarios
- Aim for meaningful coverage, not 100%

## Mocking
- Mock external dependencies
- Don't mock what you don't own
- Use realistic test data
- Clean up mocks after tests
```

**5. security-rules.mdc**

```markdown
---
description: Security best practices
globs: ["**/*"]
---

# Security Rules

## Input Validation
- Validate all user input
- Sanitize before display
- Use parameterized queries
- Validate on both client and server

## Authentication
- Never store passwords in plain text
- Use secure session management
- Implement proper logout
- Use HTTPS everywhere

## Secrets
- Never commit secrets to git
- Use environment variables
- Rotate credentials regularly
- Use secret management services
```

**6. performance-rules.mdc**

```markdown
---
description: Performance optimization guidelines
globs: ["**/*"]
---

# Performance Rules

## General
- Measure before optimizing
- Profile to find bottlenecks
- Set performance budgets
- Monitor in production

## Loading
- Lazy load when possible
- Optimize images
- Minimize bundle size
- Use code splitting

## Runtime
- Avoid memory leaks
- Debounce/throttle events
- Use appropriate data structures
- Cache expensive operations
```

**7. project-specific.mdc**

```markdown
---
description: Project-specific conventions
globs: ["**/*"]
---

# Project Conventions

## Detected Patterns
[Generated from codebase analysis]

## File Organization
[Based on observed structure]

## Import Conventions
[Based on observed patterns]

## Custom Rules
[Project-specific guidelines]
```

### Phase 4: Verification

**CHECKPOINT: Rules Generated (REQUIRED)**

Before final output, verify:
- [ ] All rule files created in `.cursor/rules/`
- [ ] Each file has valid frontmatter
- [ ] coding-principles.mdc included
- [ ] Language-specific rules match detected stack
- [ ] Framework rules if framework detected
- [ ] Existing sdd-system.mdc preserved

**Read each file to verify creation.**

---

## Output (REQUIRED)

**Your response MUST end with:**

```
✅ Rules generated successfully!

**Created files:**
- `.cursor/rules/coding-principles.mdc` - Core 10X principles
- `.cursor/rules/[language]-rules.mdc` - [Language] best practices
- `.cursor/rules/[framework]-rules.mdc` - [Framework] patterns
- `.cursor/rules/testing-rules.mdc` - Testing practices
- `.cursor/rules/security-rules.mdc` - Security guidelines
- `.cursor/rules/performance-rules.mdc` - Performance optimization
- `.cursor/rules/project-specific.mdc` - Project conventions

**Preserved:**
- `.cursor/rules/sdd-system.mdc` - SDD system rules

**Total:** [N] rule files

**Rules are now active** and will apply to all AI interactions in this project.

**To customize:**
- Edit files in `.cursor/rules/`
- Run `/generate-rules --update-existing` to refresh
```

---

## Rule File Format (.mdc)

```markdown
---
description: Brief description of these rules
globs: ["**/*.ts", "**/*.tsx"]  # Files these apply to
alwaysApply: false  # true = apply to every request
---

# Rule Category

## Section

- Rule 1
- Rule 2
```

---

## Troubleshooting

### Issue: No package files found
**Cause**: Project not initialized or unusual structure
**Solution**: Ask for manual input:
- "I couldn't detect the tech stack. What languages/frameworks are you using?"

### Issue: Conflicting existing rules
**Cause**: User has custom rules
**Solution**: Offer to merge:
- "Found existing rules. Should I merge with them or create alongside?"

### Issue: Framework not recognized
**Cause**: Unusual or new framework
**Solution**: Generate generic language rules:
- "I don't have specific rules for [framework]. Generating [language] rules instead."

---

## Related Commands

- `/brief [task-id]` - Create feature brief
- `/research [task-id]` - Research patterns
- `/implement [task-id]` - Implementation (rules apply here)
