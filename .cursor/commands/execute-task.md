# /execute-task Command

Execute a specific task from the SDD roadmap, orchestrating the appropriate SDD command.

## Usage
```
/execute-task [task-id]
```

## Purpose

Run the appropriate SDD command for a roadmap task, automatically:
- Determining which SDD command to use
- Executing with task context
- Linking results back to the roadmap
- Updating task status in kanban board
- Tracking execution in logs

---

## PLAN Mode Workflow

This command follows a **plan-approve-execute** pattern for task execution.

### Phase 1: Analysis (Readonly)

**Analyze task:**
1. **Read roadmap.json** - Load task details
2. **Check task status** - Verify it's ready to execute
3. **Validate dependencies** - Ensure all dependencies complete
4. **Determine SDD command** - Map task.sdd.phase to command
5. **Gather context** - Collect related task information

**Ask clarifying questions if needed:**
- Any additional context needed for this task?
- Should we modify the task approach?
- Are there blockers to address first?
- Any specific requirements or constraints?

**Read relevant files:**
- Roadmap JSON at `specs/todo-roadmap/[project-id]/roadmap.json`
- Task details at `specs/todo-roadmap/[project-id]/tasks/[task-id].json`
- Related tasks for context
- Existing specs if linked

**Validation checks:**
- Task exists in roadmap
- Status is 'todo' or 'blocked' (with resolved blocker)
- All dependencies are 'done'
- No conflicting in-progress tasks (if sequential)

### Phase 2: Planning (Create Plan Tool)

**Present detailed plan showing:**

1. **Task Information:**
   - Task ID and title
   - Description and objectives
   - Type (epic, task, subtask)
   - Estimated effort

2. **Execution Strategy:**
   - SDD command to run: `/research`, `/brief`, `/specify`, etc.
   - Command parameters
   - Expected output files
   - Link location in specs/active/

3. **What will happen:**
   ```
   1. Run: /[sdd-command] [task-id] [task-description]
   2. Create: specs/active/[task-id]/[output-files]
   3. Update: roadmap.json status and links
   4. Log: execution-log.md entry
   5. Move: task from 'todo' to 'in-progress' to 'review'
   ```

4. **Integration points:**
   - Where spec files will be created
   - How roadmap will be updated
   - Progress tracking

**The plan should show:**
- Clear execution path
- Expected outcomes
- Status changes

### Phase 3: Execution (After Approval)

**Once plan is approved, execute:**

1. **Update task status to 'in-progress':**
   ```json
   {
     "status": "in-progress",
     "startedAt": "2025-10-21T10:30:00Z"
   }
   ```

2. **Determine and run SDD command:**
   
   **Command mapping:**
   - `phase: "research"` → `/research [task-id] [description]`
   - `phase: "brief"` → `/brief [task-id] [description]`
   - `phase: "specification"` → `/specify [task-id] [description]`
   - `phase: "planning"` → `/plan [task-id]`
   - `phase: "tasks"` → `/tasks [task-id]`
   - `phase: "implementation"` → `/implement [task-id]`

3. **Execute SDD command with PLAN mode:**
   - Run appropriate command
   - Pass task context
   - Allow PLAN mode workflow
   - Wait for completion

4. **Link created specs to roadmap:**
   ```json
   {
     "sdd": {
       "linkedSpec": "specs/active/[task-id]",
       "executedAt": "2025-10-21T10:45:00Z",
       "executedCommand": "/research [task-id] [description]"
     }
   }
   ```

5. **Update task status to 'review':**
   ```json
   {
     "status": "review",
     "completedAt": "2025-10-21T11:00:00Z"
   }
   ```

6. **Log execution in execution-log.md:**
   ```markdown
   ### Task: [task-id] - [title]
   - **Started:** 2025-10-21T10:30:00Z
   - **Command:** /research [task-id] [description]
   - **Output:** specs/active/[task-id]/research.md
   - **Completed:** 2025-10-21T11:00:00Z
   - **Status:** review
   ```

7. **Update kanban board:**
   - Move task from 'todo' column to 'review' column
   - Update column task arrays in roadmap.json

8. **Check for dependent tasks:**
   - If task complete, check if any blocked tasks can now proceed
   - Update dependent task statuses

### Phase 4: Documentation

**Finalize execution:**
- Provide summary of what was created
- Show next available tasks
- Update progress metrics
- Suggest next steps

**Output summary:**
```
✅ Task executed successfully!

Task: [task-id] - [title]
Command: /research [task-id] [description]
Output: specs/active/[task-id]/research.md
Status: review → ready for review
Next: /execute-task [next-task-id]
```

---

## Command Behavior

### Dependency Resolution

Tasks with dependencies are automatically checked:

```javascript
function canExecute(task, roadmap) {
  // Check if task exists
  if (!roadmap.tasks[task.id]) return false;
  
  // Check if already done
  if (task.status === 'done') return false;
  
  // Check dependencies
  for (const depId of task.dependencies) {
    const dep = roadmap.tasks[depId];
    if (dep.status !== 'done') {
      return { 
        canExecute: false, 
        reason: `Dependency ${depId} not complete`,
        blocker: depId
      };
    }
  }
  
  return { canExecute: true };
}
```

### Status Transitions

Valid status transitions:
```
todo → in-progress → review → done
  ↓
blocked (with reason)
```

### Task Type Handling

**Epic Tasks:**
- Usually don't execute directly
- Serve as containers for subtasks
- Status auto-updates when all subtasks done

**Regular Tasks:**
- Execute with mapped SDD command
- Create specs in specs/active/
- Track progress individually

**Subtasks:**
- Execute like regular tasks
- Update parent task progress
- May be part of larger implementation

## Error Handling

### Task Not Found
```
Error: Task 'task-xyz' not found in roadmap
→ Check task ID spelling
→ Verify roadmap.json is current
```

### Dependency Not Met
```
Error: Cannot execute task-002
Reason: Dependency task-001 status = in-progress
→ Complete task-001 first
→ Or mark as done if actually complete
```

### Invalid Status
```
Error: Task task-001 status = done
→ Task already completed
→ Use /evolve to make changes
```

## Integration with SDD Commands

Each SDD command runs with full PLAN mode:

1. **Analysis phase** - Command analyzes task
2. **Planning phase** - Presents plan to user
3. **User approval** - Wait for confirmation
4. **Execution phase** - Creates specs/files
5. **Documentation** - Updates tracking

This means `/execute-task` triggers a full SDD workflow for that specific task.

## Output

**Task execution creates:**
- Spec files in `specs/active/[task-id]/`
- Updated `roadmap.json` with links and status
- Entry in `execution-log.md`
- Progress updates in `roadmap.md`

**Kanban board updates:**
- Task moved to appropriate column
- Column task arrays updated
- Dependencies checked and updated

## Examples

### Execute First Epic Task
```bash
/execute-task epic-001
```

**What happens:**
1. Reads epic-001 from roadmap
2. Determines it's a research phase
3. Runs: `/research epic-001 [description]`
4. Creates: `specs/active/epic-001/research.md`
5. Updates: roadmap.json status → review
6. Logs: execution in execution-log.md

### Execute Subtask
```bash
/execute-task task-001-1
```

**What happens:**
1. Checks parent task-001 exists
2. Validates dependencies met
3. Runs appropriate SDD command
4. Updates both task and parent status
5. Checks if other subtasks can proceed

### Execute Implementation Task
```bash
/execute-task impl-backend-api
```

**What happens:**
1. Runs: `/implement impl-backend-api`
2. Creates: todo-list and implements code
3. Updates: roadmap with completion
4. Marks: ready for review

## Notes for AI Assistants

- **Always validate dependencies** before execution
- **Check task status** ensure it's ready to run
- **Map command correctly** based on task.sdd.phase
- **Update roadmap atomically** prevent inconsistencies
- **Log everything** comprehensive execution tracking
- **Handle errors gracefully** provide clear error messages
- **Update parent tasks** when subtasks complete
- **Check blocked tasks** unblock when dependencies met

## See Also

- [/sdd-full-plan](./sdd-full-plan.md) - Create roadmaps
- [/brief](./brief.md) - Quick feature briefs
- [/implement](./implement.md) - Implementation execution
- [ROADMAP_FORMAT_SPEC.md](../../.sdd/ROADMAP_FORMAT_SPEC.md) - Roadmap format details

