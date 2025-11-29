# /research Command

Conduct comprehensive research before specification to find existing patterns and gather context.

## Usage
```
/research [task-id] [research-topic]
```

## Purpose
Find existing patterns in the codebase, search for relevant information, and establish foundation for specification phase.

---

## PLAN Mode Workflow

This command follows a **plan-approve-execute** pattern to ensure systematic research.

### Phase 1: Analysis (Readonly)

**Analyze before planning:**
1. **Parse research topic** - Understand what to investigate
2. **Identify research areas** - Determine where to look
3. **Check existing structure** - See if task directory exists
4. **Assess scope** - Balance depth vs time constraints

**Ask clarifying questions if needed:**
- What specific patterns or technologies should we focus on?
- Are there existing features that are similar we should study?
- Should we research external solutions or focus on internal patterns?
- Are there specific technical constraints to consider?
- What's the primary goal: understand existing code or explore new approaches?

**Note (Cursor 2.1+):** 
- Questions appear in interactive UI - answer directly for faster workflow
- **Instant Grep:** All codebase searches are now instant! Leverage multiple parallel searches for faster pattern discovery

**Initial exploration (readonly):**
- Scan codebase for similar feature patterns
- Check existing specs for related features
- Identify relevant directories and files
- Note architectural patterns in use

### Phase 2: Planning (Create Plan Tool)

**Present a detailed plan showing:**

1. **Research strategy:**
   - **Codebase areas to examine:**
     - Specific directories and files to analyze
     - Pattern types to look for
     - Similar features to study
   - **External research scope:**
     - Libraries/frameworks to investigate
     - Best practices to document
     - Industry patterns to consider
   - **Time allocation:**
     - Internal research: X minutes
     - External research: Y minutes
     - Documentation: Z minutes

2. **What will be created:**
   - File path: `specs/active/[task-id]/research.md`
   - Directory structure if new

3. **Research document structure:**
   - Executive summary
   - Codebase pattern analysis (with code examples)
   - External solutions comparison
   - Technical constraints and opportunities
   - Recommended approaches with pros/cons
   - Open questions for specification phase

4. **Success criteria:**
   - What "good research" looks like for this topic
   - Key questions that must be answered
   - Decision points for specification phase

**The plan should show:**
- Specific files/directories to examine
- Concrete research questions to answer
- How findings will inform specification

### Phase 3: Execution (After Approval)

**Once plan is approved, execute:**

1. **Create directory structure:**
   ```
   specs/active/[task-id]/
   └── research.md
   ```

2. **Conduct codebase research:**
   - Search for similar patterns using codebase_search
   - Read relevant implementation files
   - Document patterns with code examples
   - Note reusable components and conventions

3. **External research (if applicable):**
   - Document library options
   - Compare different approaches
   - Note industry best practices
   - Include links and references

4. **Generate research.md using template:**
   - Use `.sdd/templates/research-template.md` or `research-compact.md`
   - Fill all sections with findings
   - Include code examples and comparisons
   - Provide clear recommendations

5. **Quality check:**
   - All key questions answered
   - Sufficient depth for decision-making
   - Clear pros/cons for approaches
   - Actionable insights for next phase

### Phase 4: Documentation

**Wrap up research:**
- Highlight key findings in summary
- Flag critical decisions needed
- Note dependencies discovered
- Set context for `/specify` phase

---

## Example
```
/research user-auth-system JWT authentication with existing patterns
```

## Implementation Rules
- **Always search existing codebase first** for similar patterns
- **Use semantic task-id slugs** (user-auth-system, not feat-001)
- **Document all findings** with code examples
- **Include pros/cons** of different approaches
- **Set foundation** for informed specification

## Output
Creates: `specs/active/[task-id]/research.md`

## Notes for AI Assistants

- **Always present a plan first** showing research strategy
- **Use interactive question UI (Cursor 2.1+)** for clarifying questions
- **Leverage Instant Grep (Cursor 2.1+)** - All searches are instant, use multiple parallel searches
- **Be specific about what you'll search for** in the plan
- **Show your research methodology** - where you'll look and why
- **Wait for approval** before conducting research
- **Document comprehensively** but stay focused on research questions
- **Balance depth with time** - ~60 minutes total research time
- **Note plan search** - Users can ⌘+F to search within research plans
