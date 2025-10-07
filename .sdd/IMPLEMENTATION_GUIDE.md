# Implementation Guide

## Critical: Following the Todo-List

**IMPORTANT FOR AI ASSISTANTS & DEVELOPERS:**  
The todo-list is NOT optional suggestions - it's an executable checklist that MUST be followed systematically.

## Implementation Rules

### 1. Todo-List is Mandatory
- **Every task** in the list must be addressed
- **Check off items** as you complete them
- **Document blockers** if you can't complete an item
- **Update progress** continuously

### 2. Sequential Execution
```markdown
## Implementation Progress

### Phase 1: Setup
- [x] Install dependencies
- [x] Create project structure
- [ ] Configure environment variables (CURRENT)

### Phase 2: Core Features
- [ ] Implement authentication service
- [ ] Build user management
- [ ] Create API endpoints
```

### 3. No Skipping Tasks
**If you encounter a todo item:**
- ✅ **Complete it** - Mark as done with [x]
- 🔄 **Block it** - Document why: `- [ ] Task (BLOCKED: reason)`
- 📝 **Update it** - If approach changes: `- [x] Task (MODIFIED: new approach)`
- ❌ **Never skip** - Every item requires explicit action

### 4. Progress Tracking Format

```markdown
## Current Status
**Phase**: 2/4 (Core Features)
**Progress**: 12/35 tasks complete (34%)
**Blockers**: 2 items waiting for API keys
**Next**: Implement authentication service

## Completed Today
- [x] Database schema design
- [x] User model implementation
- [x] Password hashing service

## In Progress
- [ ] 🔄 JWT token generation (50% - writing tests)

## Blocked
- [ ] 🚫 OAuth integration (waiting for client credentials)
- [ ] 🚫 Email service (SMTP configuration pending)
```

## For AI Assistants (Cursor, ChatGPT, Claude)

### Critical Instructions

1. **Read the entire todo-list** before starting
2. **Execute todos in order** - respect dependencies
3. **Mark completion** - Update checkboxes as you work
4. **Document changes** - Log any deviations from plan
5. **Ask before skipping** - Never silently ignore items

### Execution Pattern

```
STEP 1: Read todo-list
STEP 2: Identify next uncompleted task
STEP 3: Execute the task completely
STEP 4: Update checkbox: - [ ] → - [x]
STEP 5: Document any issues or changes
STEP 6: Repeat until all tasks complete
```

### Example AI Response

```markdown
I'm implementing the todo-list systematically:

## Task 1: Create User Model ✅
Created user.model.ts with fields: id, email, password, createdAt
- [x] Create User model with Prisma schema

## Task 2: Implement Password Hashing 🔄
Using bcrypt with salt rounds of 10
- [x] Install bcrypt dependency
- [ ] Create hash service (IN PROGRESS)

## Blockers: None
## Next: Complete hash service, then move to JWT generation
```

## For Manual Developers

### Workflow

1. **Open todo-list** alongside code editor
2. **Pick next task** from current phase
3. **Complete the task** fully before moving on
4. **Update checkbox** in todo-list.md
5. **Commit with reference**: `git commit -m "feat: user model [TODO-001]"`
6. **Track progress** daily

### Daily Standup Template

```markdown
## Daily Progress Report

**Date**: 2024-09-20
**Developer**: @username

### Completed Yesterday
- [x] User authentication service
- [x] JWT token generation
- [x] Login endpoint

### Today's Goals  
- [ ] Password reset flow
- [ ] Email verification
- [ ] Rate limiting

### Blockers
- Need security review before deploying password reset

### Stats
- Tasks Complete: 15/35 (43%)
- On Track: Yes
- ETA: 5 days remaining
```

## Anti-Patterns to Avoid

### ❌ DON'T: Skip todos silently
```markdown
"I'll implement the authentication system"
[Implements only login, ignores registration, password reset, etc.]
```

### ✅ DO: Follow todos explicitly
```markdown
"I'll implement authentication following the todo-list:
- [x] Phase 1: User model
- [x] Phase 2: Hash service  
- [ ] Phase 3: Login endpoint (CURRENT)
- [ ] Phase 4: Registration
- [ ] Phase 5: Password reset"
```

### ❌ DON'T: Treat todos as suggestions
```markdown
"Here's a better approach (ignoring the plan)"
```

### ✅ DO: Update plan if approach changes
```markdown
"I found a better approach for Task 3.
Original: Use bcrypt
Updated: Use argon2 (more secure)
Updating todo with rationale, then executing"
```

## Integration with SDD Commands

### `/brief` → Implementation
Feature brief includes "Next Actions" section - these become your initial todos

### `/tasks` → Implementation  
Tasks.md becomes your comprehensive todo-list

### `/implement` → Execution
Generates todo-list.md from tasks, then executes systematically

### `/evolve` → Updates
Update brief/todos as discoveries are made

## Verification Checklist

Before marking implementation "complete":

- [ ] All todos checked off or explicitly blocked
- [ ] Blockers documented with resolution plans
- [ ] Tests passing for all completed features
- [ ] Code reviewed against original specifications
- [ ] Documentation updated
- [ ] No silent deviations from plan
- [ ] Progress tracked throughout implementation

## Emergency: Plan Deviation

If you discover the plan is wrong:

1. **STOP** - Don't silently deviate
2. **DOCUMENT** - Explain why plan won't work
3. **UPDATE** - Use `/evolve` to update specs
4. **REVISE** - Update todo-list with new approach
5. **CONTINUE** - Execute new plan systematically

## Success Metrics

**Good Implementation:**
- ✅ All todos addressed (completed or explicitly handled)
- ✅ Progress tracked continuously  
- ✅ Deviations documented with rationale
- ✅ Blockers identified and escalated
- ✅ Final verification completed

**Poor Implementation:**
- ❌ Todos ignored or treated as optional
- ❌ Silent deviations from plan
- ❌ Incomplete progress tracking
- ❌ Undocumented blockers
- ❌ "I'll do it my way" approach
