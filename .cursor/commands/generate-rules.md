# /generate-rules Command

Automatically generate comprehensive coding rules for Cursor based on project analysis, technology stack detection, and 10X dev principles.

## Usage
```
/generate-rules [options]
/generate-rules --language javascript --framework react
/generate-rules --analyze-codebase
/generate-rules --update-existing
```

## Purpose

Generate comprehensive coding rules that:
- Follow 10X dev principles (DRY, KISS, modular)
- Include language-specific best practices
- Include framework-specific patterns
- Reflect project complexity and patterns
- Organize hierarchically for maintainability

---

## PLAN Mode Workflow

This command follows a **plan-approve-execute** pattern for rule generation.

### Phase 1: Analysis (Readonly)

**Analyze project:**
1. **Detect technology stack:**
   - Read `package.json` (Node.js/JavaScript/TypeScript)
   - Read `requirements.txt` or `pyproject.toml` (Python)
   - Read `Cargo.toml` (Rust)
   - Read `go.mod` (Go)
   - Read `pom.xml` or `build.gradle` (Java)
   - Read `composer.json` (PHP)
   - Read `Gemfile` (Ruby)
   - Read `tsconfig.json` (TypeScript)
   - Detect framework configs (React, Vue, Angular, Django, Express, etc.)

2. **Analyze codebase patterns:**
   - Scan existing code structure
   - Detect architectural patterns
   - Identify code organization style
   - Find common patterns and conventions
   - Detect testing approach
   - Analyze import/export patterns
   - Check error handling style

3. **Assess project complexity:**
   - Count files and directories
   - Analyze project structure
   - Detect microservices vs monolith
   - Assess codebase size
   - Determine: Simple / Medium / Complex / Enterprise

4. **Check existing rules:**
   - List existing `.cursor/rules/*.mdc` files
   - Identify what rules already exist
   - Determine if merge/replace needed

**Ask clarifying questions if needed:**
- Confirm detected technologies (use interactive UI - Cursor 2.1+)
- Add additional languages/frameworks?
- Override complexity level?
- Which rule categories to include?
- Strictness level preference? (strict/moderate/lenient)
- Include examples in rules? (yes/no)

**Read relevant files:**
- Package/dependency files for detection
- Existing `.cursor/rules/*.mdc` files
- Sample code files for pattern analysis
- Configuration files (tsconfig, eslint, etc.)

### Phase 2: Planning (Create Plan Tool)

**Present detailed plan showing:**

1. **Detected Technology Stack:**
   ```
   Primary Language: JavaScript
   Framework: React
   Runtime: Node.js
   Testing: Jest
   Build Tool: Vite
   ```

2. **Project Analysis:**
   ```
   Complexity: Medium
   Structure: Component-based
   Patterns Detected: Hooks, functional components
   Testing: Unit tests present
   ```

3. **Rule Files to Generate:**
   ```
   .cursor/rules/
   ├── coding-principles.mdc          # Core 10X dev principles
   ├── javascript-rules.mdc           # JavaScript best practices
   ├── typescript-rules.mdc           # TypeScript patterns (if TS detected)
   ├── react-rules.mdc                # React-specific rules
   ├── nodejs-rules.mdc               # Node.js patterns
   ├── testing-rules.mdc              # Testing practices
   ├── security-rules.mdc             # Security best practices
   ├── performance-rules.mdc           # Performance optimization
   └── project-specific.mdc           # Project-specific patterns
   ```

4. **Existing Rules Handling:**
   ```
   Found existing rules:
   - sdd-system.mdc (keep - SDD system rules)
   
   Options:
   A) Merge new rules with existing
   B) Replace existing (backup first)
   C) Create alongside existing
   D) Skip existing files
   ```

5. **Rule Categories Preview:**
   - Core Principles (DRY, KISS, modular)
   - Language Best Practices
   - Framework Patterns
   - Code Organization
   - Testing
   - Security
   - Performance
   - Error Handling
   - Logging
   - API Design (if applicable)
   - Database (if applicable)

6. **Customization Options:**
   - Strictness: Moderate (recommended)
   - Include examples: Yes
   - Verbosity: Detailed
   - Comment style: JSDoc

**The plan should show:**
- Complete technology stack detected
- All rule files that will be created
- How existing rules will be handled
- Rule categories included

### Phase 3: Execution (After Approval)

**Once plan is approved, generate rules:**

1. **Handle existing rules:**
   - If merge: Read existing, merge intelligently
   - If replace: Backup existing files first
   - If create alongside: Keep existing, add new
   - If skip: Only create missing files

2. **Generate coding-principles.mdc:**
   - Core 10X dev principles
   - DRY, KISS, modular design
   - SOLID principles
   - Clean code principles

3. **Generate language-specific rules:**
   - Based on detected languages
   - Use templates from `.sdd/templates/rules/`
   - Customize for project complexity
   - Include best practices

4. **Generate framework-specific rules:**
   - Based on detected frameworks
   - Framework conventions
   - Component patterns
   - State management patterns

5. **Generate category rules:**
   - Testing rules
   - Security rules
   - Performance rules
   - API rules (if applicable)
   - Database rules (if applicable)

6. **Generate project-specific.mdc:**
   - Extract patterns from codebase analysis
   - Document project conventions
   - Include detected patterns
   - Custom rules based on analysis

7. **Quality checks:**
   - All rule files valid .mdc format
   - Proper frontmatter
   - No syntax errors
   - Rules are actionable

### Phase 4: Documentation

**Finalize rule generation:**
- Provide summary of rules created
- Show how to customize rules
- Explain rule organization
- Document update process

**Output summary:**
```
✅ Rules generated successfully!

Created files:
- coding-principles.mdc (10X dev principles)
- javascript-rules.mdc (JavaScript best practices)
- react-rules.mdc (React patterns)
- testing-rules.mdc (Testing practices)
- security-rules.mdc (Security best practices)
- performance-rules.mdc (Performance optimization)
- project-specific.mdc (Project patterns)

Total: 7 rule files
Rules are active and will be applied to all AI interactions.

To customize: Edit files in .cursor/rules/
To update: Run /generate-rules --update-existing
```

---

## Command Options

### `--language [lang]`
Specify primary language (overrides auto-detection)
- Examples: `javascript`, `typescript`, `python`, `java`, `go`, `rust`

### `--framework [framework]`
Specify framework (adds framework-specific rules)
- Examples: `react`, `vue`, `angular`, `django`, `express`, `nextjs`

### `--complexity [level]`
Override complexity detection
- Options: `simple`, `medium`, `complex`, `enterprise`

### `--update-existing`
Update existing rules instead of creating new
- Merges new patterns with existing rules
- Preserves customizations where possible

### `--analyze-codebase`
Deep codebase analysis mode
- Analyzes more files
- Extracts more patterns
- More detailed project-specific rules

### `--strict`
Generate strict rules
- Enforce best practices strongly
- Less flexibility
- More constraints

### `--lenient`
Generate flexible rules
- More permissive
- Fewer constraints
- More flexibility

### `--no-examples`
Don't include code examples in rules
- More concise rules
- Faster to read

---

## Technology Detection

### Auto-Detection Priority

1. **Package Managers:**
   - `package.json` → JavaScript/TypeScript/Node.js
   - `requirements.txt` → Python
   - `pyproject.toml` → Python (modern)
   - `Cargo.toml` → Rust
   - `go.mod` → Go
   - `pom.xml` → Java (Maven)
   - `build.gradle` → Java (Gradle)
   - `composer.json` → PHP
   - `Gemfile` → Ruby

2. **Configuration Files:**
   - `tsconfig.json` → TypeScript
   - `jsconfig.json` → JavaScript
   - `webpack.config.js` → Webpack
   - `vite.config.js` → Vite
   - `next.config.js` → Next.js
   - `nuxt.config.js` → Nuxt

3. **Framework Detection:**
   - `react` in dependencies → React
   - `vue` in dependencies → Vue
   - `@angular/core` → Angular
   - `django` → Django
   - `express` → Express
   - `rails` → Rails
   - `spring-boot` → Spring Boot

4. **Testing Detection:**
   - `jest` → Jest
   - `vitest` → Vitest
   - `pytest` → pytest
   - `mocha` → Mocha
   - `jasmine` → Jasmine

---

## Codebase Analysis

### Pattern Detection

**Architecture Patterns:**
- Component-based (React, Vue)
- MVC (Django, Rails)
- Service-oriented
- Microservices
- Monolithic

**Code Organization:**
- Feature-based structure
- Layer-based structure
- Domain-driven design
- File naming conventions
- Directory structure

**Code Patterns:**
- Functional vs class components
- Hooks usage
- State management approach
- API call patterns
- Error handling style

**Testing Patterns:**
- Test file location
- Test naming conventions
- Testing framework
- Mocking approach
- Coverage expectations

---

## Rule Categories

### Core Principles (Always Included)

**DRY (Don't Repeat Yourself):**
- Extract common logic
- Reuse components/functions
- Avoid duplication
- Create utilities

**KISS (Keep It Simple, Stupid):**
- Prefer simple solutions
- Avoid over-engineering
- Clear and readable code
- Minimal complexity

**Modular Design:**
- Single Responsibility Principle
- Separation of Concerns
- Loose coupling
- High cohesion

### Language-Specific Rules

Generated based on detected languages with best practices for each.

### Framework-Specific Rules

Generated based on detected frameworks with framework conventions.

### Category Rules

- **Testing:** Unit, integration, E2E patterns
- **Security:** Input validation, auth, vulnerabilities
- **Performance:** Optimization, caching, lazy loading
- **API Design:** RESTful, GraphQL, versioning
- **Database:** Queries, migrations, ORM patterns
- **Error Handling:** Error types, logging, user messages
- **Logging:** Log levels, structured logging
- **Documentation:** Comments, JSDoc, README
- **Git:** Commit conventions, branching
- **CI/CD:** Build, test, deploy patterns

---

## Output Structure

```
.cursor/rules/
├── coding-principles.mdc          # Core 10X dev principles (always)
├── javascript-rules.mdc          # If JavaScript detected
├── typescript-rules.mdc           # If TypeScript detected
├── python-rules.mdc              # If Python detected
├── react-rules.mdc                # If React detected
├── vue-rules.mdc                  # If Vue detected
├── nodejs-rules.mdc               # If Node.js detected
├── testing-rules.mdc              # If tests detected
├── security-rules.mdc             # Always included
├── performance-rules.mdc          # Always included
├── api-rules.mdc                  # If API detected
├── database-rules.mdc              # If database detected
└── project-specific.mdc           # Based on codebase analysis
```

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
- coding-principles.mdc
- typescript-rules.mdc
- react-rules.mdc
- testing-rules.mdc
- security-rules.mdc
- performance-rules.mdc
- project-specific.mdc

### Example 2: Python Django Project

```bash
/generate-rules --analyze-codebase
```

**Detected:**
- Language: Python
- Framework: Django
- Testing: pytest

**Generates:**
- coding-principles.mdc
- python-rules.mdc
- django-rules.mdc
- testing-rules.mdc
- security-rules.mdc
- performance-rules.mdc
- api-rules.mdc (if REST API detected)
- database-rules.mdc
- project-specific.mdc (detailed from analysis)

### Example 3: Update Existing Rules

```bash
/generate-rules --update-existing
```

**Process:**
- Reads existing rules
- Merges new patterns
- Preserves customizations
- Updates outdated practices

---

## Notes for AI Assistants

- **Always detect technology stack first** - Read package files
- **Use interactive question UI (Cursor 2.1+)** - Questions appear automatically
- **Analyze codebase patterns** - Extract real conventions
- **Present comprehensive plan** - Show all rule files to be created
- **Handle existing rules carefully** - Ask user preference
- **Generate from templates** - Use `.sdd/templates/rules/` templates
- **Customize for complexity** - Adjust rules based on project size
- **Include 10X dev principles** - DRY, KISS, modular always
- **Wait for approval** - Don't create files until approved
- **Validate generated rules** - Ensure proper .mdc format
- **Document project patterns** - Extract and document real patterns

---

## Integration

**With SDD System:**
- Rules complement SDD workflow
- Used during `/implement` phase
- Guides code generation
- Ensures consistency

**With Cursor:**
- Rules apply to all AI interactions
- Automatic enforcement
- Context-aware suggestions
- Quality improvement

**With Team:**
- Shared via team commands (Cursor 2.1+)
- Consistent across team
- Centralized management
- Easy updates

---

## See Also

- [Generate Rules Guide](../../.sdd/GENERATE_RULES_GUIDE.md) - Complete usage guide
- [Rule Templates Reference](../../.sdd/RULE_TEMPLATES_REFERENCE.md) - Template documentation
- [SDD Guidelines](../../.sdd/guidelines.md) - SDD methodology
- [Cursor Rules Format](https://cursor.com/docs) - Cursor rules documentation

