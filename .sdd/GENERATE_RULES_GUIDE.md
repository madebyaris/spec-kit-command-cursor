# Generate Rules Command Guide

Complete guide for using the `/generate-rules` command to automatically generate coding rules for your project.

---

## Overview

The `/generate-rules` command analyzes your codebase, detects your technology stack, and generates comprehensive coding rules following 10X dev principles (DRY, KISS, modular) and language/framework best practices.

---

## Quick Start

### Basic Usage

```bash
# Auto-detect and generate rules
/generate-rules
```

This will:
1. Detect your technology stack (JavaScript, Python, React, etc.)
2. Analyze your codebase patterns
3. Generate appropriate rule files
4. Organize rules hierarchically

---

## Command Options

### `--language [lang]`

Specify primary language (overrides auto-detection):

```bash
/generate-rules --language javascript
/generate-rules --language python
/generate-rules --language typescript
```

**Supported languages:**
- `javascript`
- `typescript`
- `python`
- `java`
- `go`
- `rust`
- `php`
- `ruby`

### `--framework [framework]`

Add framework-specific rules:

```bash
/generate-rules --framework react
/generate-rules --framework vue
/generate-rules --framework django
```

**Supported frameworks:**
- `react`
- `vue`
- `angular`
- `django`
- `express`
- `nextjs`
- `nuxt`
- `rails`
- `spring-boot`

### `--complexity [level]`

Override complexity detection:

```bash
/generate-rules --complexity simple
/generate-rules --complexity medium
/generate-rules --complexity complex
/generate-rules --complexity enterprise
```

### `--update-existing`

Update existing rules instead of creating new:

```bash
/generate-rules --update-existing
```

This will:
- Read existing rule files
- Merge new patterns
- Preserve customizations where possible

### `--analyze-codebase`

Deep codebase analysis mode:

```bash
/generate-rules --analyze-codebase
```

This will:
- Analyze more files
- Extract more patterns
- Generate more detailed project-specific rules

### `--strict`

Generate strict rules (more constraints):

```bash
/generate-rules --strict
```

### `--lenient`

Generate flexible rules (fewer constraints):

```bash
/generate-rules --lenient
```

### `--no-examples`

Don't include code examples in rules:

```bash
/generate-rules --no-examples
```

---

## Technology Detection

### Auto-Detection

The command automatically detects your technology stack by analyzing:

**Package Files:**
- `package.json` → JavaScript/TypeScript/Node.js
- `requirements.txt` or `pyproject.toml` → Python
- `Cargo.toml` → Rust
- `go.mod` → Go
- `pom.xml` or `build.gradle` → Java
- `composer.json` → PHP
- `Gemfile` → Ruby

**Configuration Files:**
- `tsconfig.json` → TypeScript
- `webpack.config.js` → Webpack
- `vite.config.js` → Vite
- `next.config.js` → Next.js

**Dependencies:**
- `react` → React
- `vue` → Vue
- `@angular/core` → Angular
- `django` → Django
- `express` → Express

### Manual Override

You can override auto-detection:

```bash
/generate-rules --language typescript --framework react
```

---

## Generated Rule Files

### File Structure

Rules are organized hierarchically:

```
.cursor/rules/
├── coding-principles.mdc          # Core 10X dev principles (always)
├── javascript-rules.mdc           # If JavaScript detected
├── typescript-rules.mdc           # If TypeScript detected
├── python-rules.mdc               # If Python detected
├── react-rules.mdc                # If React detected
├── vue-rules.mdc                  # If Vue detected
├── nodejs-rules.mdc               # If Node.js detected
├── testing-rules.mdc              # If tests detected
├── security-rules.mdc             # Always included
├── performance-rules.mdc          # Always included
├── api-rules.mdc                  # If API detected
├── database-rules.mdc             # If database detected
└── project-specific.mdc          # Based on codebase analysis
```

### Rule Categories

**Core Principles:**
- DRY (Don't Repeat Yourself)
- KISS (Keep It Simple, Stupid)
- Modular design
- SOLID principles

**Language-Specific:**
- JavaScript/TypeScript best practices
- Python PEP 8 and type hints
- Language-specific patterns

**Framework-Specific:**
- React hooks and components
- Vue composition API
- Framework conventions

**Category Rules:**
- Testing practices
- Security best practices
- Performance optimization
- API design patterns
- Database patterns

**Project-Specific:**
- Detected patterns from your codebase
- Project conventions
- Team standards

---

## Workflow

### 1. Analysis Phase

The command analyzes:
- Technology stack
- Codebase patterns
- Project complexity
- Existing rules

### 2. Planning Phase

A plan is presented showing:
- Detected technologies
- Rule files to generate
- How existing rules will be handled
- Rule categories included

**Interactive Questions (Cursor 2.1+):**
- Confirm detected technologies
- Add additional languages/frameworks
- Override complexity level
- Choose rule categories
- Handle existing rules

### 3. Execution Phase

After approval, rules are generated:
- Core principles file
- Language-specific rules
- Framework-specific rules
- Category rules
- Project-specific rules

### 4. Documentation Phase

Summary provided:
- Files created
- How to customize
- Update instructions

---

## Examples

### Example 1: React + TypeScript Project

```bash
/generate-rules
```

**Detected:**
- Language: TypeScript
- Framework: React
- Testing: Jest
- Build: Vite

**Generates:**
- `coding-principles.mdc`
- `typescript-rules.mdc`
- `react-rules.mdc`
- `testing-rules.mdc`
- `security-rules.mdc`
- `performance-rules.mdc`
- `project-specific.mdc`

### Example 2: Python Django Project

```bash
/generate-rules --analyze-codebase
```

**Detected:**
- Language: Python
- Framework: Django
- Testing: pytest

**Generates:**
- `coding-principles.mdc`
- `python-rules.mdc`
- `django-rules.mdc` (if template exists)
- `testing-rules.mdc`
- `security-rules.mdc`
- `performance-rules.mdc`
- `api-rules.mdc` (if REST API detected)
- `database-rules.mdc`
- `project-specific.mdc` (detailed from analysis)

### Example 3: Update Existing Rules

```bash
/generate-rules --update-existing
```

**Process:**
1. Reads existing rule files
2. Analyzes codebase for new patterns
3. Merges new patterns with existing rules
4. Preserves customizations
5. Updates outdated practices

---

## Customization

### Editing Rules

Rules are standard `.mdc` files. Edit them directly:

```bash
# Edit a rule file
code .cursor/rules/javascript-rules.mdc
```

### Adding Custom Rules

Add project-specific rules to `project-specific.mdc`:

```markdown
## Custom Patterns

### Our Team Convention
- Always use async/await
- Prefer functional components
- Use TypeScript strict mode
```

### Updating Rules

Regenerate rules when:
- Technology stack changes
- New patterns emerge
- Best practices evolve

```bash
/generate-rules --update-existing
```

---

## Integration

### With SDD System

Rules complement SDD workflow:
- Used during `/implement` phase
- Guide code generation
- Ensure consistency

### With Cursor

Rules apply to all AI interactions:
- Automatic enforcement
- Context-aware suggestions
- Quality improvement

### With Team

Share rules via team commands (Cursor 2.1+):
- Consistent across team
- Centralized management
- Easy updates

---

## Troubleshooting

### Rules Not Detected

**Issue:** Technology not detected

**Solution:**
- Use `--language` and `--framework` options
- Check package files exist
- Verify dependency names

### Existing Rules Conflict

**Issue:** How to handle existing rules

**Solution:**
- Choose merge/replace/backup when prompted
- Use `--update-existing` to merge
- Backup existing rules first if needed

### Generated Rules Too Strict/Lenient

**Issue:** Rules don't match project needs

**Solution:**
- Use `--strict` or `--lenient` options
- Edit rule files directly
- Customize `project-specific.mdc`

---

## Best Practices

### When to Generate Rules

- **New Project:** Generate rules at project start
- **Technology Change:** Regenerate when stack changes
- **Team Onboarding:** Generate for consistency
- **Code Review:** Update rules based on feedback

### Rule Maintenance

- **Regular Updates:** Regenerate periodically
- **Customization:** Edit project-specific rules
- **Version Control:** Commit rule files
- **Team Review:** Review rules with team

---

## See Also

- [Rule Templates Reference](./RULE_TEMPLATES_REFERENCE.md) - Template documentation
- [SDD Guidelines](./guidelines.md) - SDD methodology
- [Cursor Rules Format](https://cursor.com/docs) - Cursor rules documentation

---

**Last Updated:** 2025-10-21  
**Command:** `/generate-rules`

