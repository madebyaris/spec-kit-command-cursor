# /implement Command

Execute the planned implementation with todo-list generation and continuous execution.

## Usage
```
/implement [task-id]
```

## Prerequisites
- Must have existing `plan.md` file in task directory
- Task must exist in `specs/active/[task-id]/`

## Purpose
Convert the technical plan into actionable todo-list and execute implementation with maximum efficiency.

## Process
1. Read existing `research.md`, `spec.md`, and `plan.md` files
2. Generate comprehensive todo-list from plan
3. Execute on the plan systematically:
   - Go for as long as possible without interruption
   - Group ambiguous questions for the end
   - Reuse existing patterns and components where possible
   - Update progress continuously
4. Create implementation artifacts and code
5. Document any deviations or discoveries

## Example
```
/implement user-auth-system
```

## Implementation Rules
- Create detailed todo-list before starting
- Execute items systematically in dependency order
- Prioritize reusing existing codebase patterns
- Leave clarifying questions for batch resolution
- Update progress.md continuously
- Focus on continuous execution flow

## Output
- Updates: `specs/active/[task-id]/todo-list.md`
- Updates: `specs/active/[task-id]/progress.md`
- Creates: Implementation code and artifacts
