# /generate-rules Command

Automatically generate comprehensive Cursor coding rules based on technology stack detection and codebase analysis.

---

## Role

**Coding standards architect** - Analyze project, detect technology stack, analyze codebase patterns, and generate comprehensive Cursor rule files including language-specific, framework-specific, and project-specific rules with 10X dev principles (DRY, KISS, SOLID).

**Recommended Cursor Mode:** Plan

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

### Phase 1: Analysis

**Technology Detection:** Check package files (package.json, requirements.txt, Cargo.toml, go.mod, etc.)

**Framework Detection:** Analyze dependencies (React, Vue, Next.js, Django, Flask, etc.)

**Codebase Analysis:** Review code organization, naming conventions, import patterns, error handling, testing patterns

**Existing Rules:** Check `.cursor/rules/*.mdc` for files to merge or replace

### Phase 2: Planning

**Present detection results:** Detected stack (language, framework, runtime, testing, build), codebase analysis (structure, patterns, conventions), and proposed rule files (coding-principles, language-specific, framework-specific, testing, security, performance, project-specific).

**Options:** Generate all new rules, generate only missing, or customize selection. Wait for user approval.

### Phase 3: Execution

**Generate rule files in order:**

1. **coding-principles.mdc** (always include) - DRY, KISS, SOLID, code quality, performance mindset

2. **Language-specific rules** (e.g., typescript-rules.mdc) - Type safety, naming conventions, best practices
3. **Framework-specific rules** (e.g., react-rules.mdc) - Component design, state management, performance, patterns
4. **testing-rules.mdc** - Test structure, coverage, mocking
5. **security-rules.mdc** - Input validation, authentication, secrets
6. **performance-rules.mdc** - General optimization, loading, runtime
7. **project-specific.mdc** - Detected patterns, file organization, import conventions, custom rules

## Output

**Response must end with:**

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

**Preserved:** `.cursor/rules/sdd-system.mdc` - SDD system rules

**Total:** [N] rule files. Rules are now active for all AI interactions.

**To customize:** Edit files in `.cursor/rules/` or run `/generate-rules --update-existing` to refresh
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

**No package files:** Ask for manual tech stack input

**Conflicting existing rules:** Offer to merge or create alongside

**Framework not recognized:** Generate generic language rules instead

---

## Related Commands

- `/brief [task-id]` - Create feature brief
- `/research [task-id]` - Research patterns
- `/implement [task-id]` - Implementation (rules apply here)
