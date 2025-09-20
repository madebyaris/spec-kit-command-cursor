# /research Command

Conduct comprehensive research before specification to find existing patterns and gather context.

## Usage
```
/research [task-id] [research-topic]
```

## Purpose
Find existing patterns in the codebase, search for relevant information, and establish foundation for specification phase.

## Process
1. Create task directory in `specs/active/[task-id]/`
2. Generate `research.md` with:
   - Existing codebase patterns analysis
   - Similar implementations found
   - External research findings (libraries, best practices)
   - Technical constraints and opportunities
   - Recommended approaches based on findings
3. Ask follow-up questions to set research direction
4. Report comprehensive findings for planning phase

## Example
```
/research user-auth-system JWT authentication with existing patterns
```

## Implementation Rules
- Always search existing codebase first for similar patterns
- Use semantic task-id slugs (user-auth-system, not feat-001)
- Document all findings with code examples
- Include pros/cons of different approaches
- Set foundation for informed specification

## Output
Creates: `specs/active/[task-id]/research.md`
