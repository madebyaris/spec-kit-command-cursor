# Roadmap Format Specification

**Version:** 1.0.0  
**Compatible With:** SDD 2.5, Taskr Kanban, VSCode Extensions, Cursor 2.1+  
**Last Updated:** 2025-10-21

## Cursor 2.1 Integration

This format works seamlessly with Cursor 2.1 features:

- **Multi-Agent Execution** - Execute multiple tasks in parallel
- **Background Planning** - Generate roadmaps while working
- **Team Commands** - Share roadmaps via team commands
- **Interactive UI** - Better question handling during roadmap creation

---

## Overview

This document specifies the JSON format for SDD roadmaps, designed to be compatible with VSCode kanban extensions while providing enhanced functionality for Spec-Driven Development workflows.

## File Structure

```
specs/todo-roadmap/
├── index.json                    # Registry of all roadmaps
└── [project-id]/
    ├── roadmap.json              # Main kanban board data
    ├── roadmap.md                # Human-readable markdown view
    ├── tasks/                    # Individual task details
    │   ├── epic-001.json
    │   ├── task-001-1.json
    │   └── ...
    └── execution-log.md          # Execution history
```

---

## JSON Schema

### Root Object (roadmap.json)

```typescript
interface Roadmap {
  // Core identification
  id: string;                     // Unique project identifier
  title: string;                  // Project title
  description: string;            // Project description
  type: ProjectType;              // "application" | "feature" | "system" | "platform"
  
  // Timestamps
  created: ISO8601DateTime;       // When roadmap was created
  updated: ISO8601DateTime;       // Last update timestamp
  
  // Status
  status: RoadmapStatus;          // "planning" | "active" | "on-hold" | "completed" | "archived"
  
  // Metadata
  metadata: {
    sddVersion: string;           // SDD version (e.g., "2.5")
    planMode: boolean;            // PLAN mode enabled
    estimatedDuration: string;    // e.g., "8 weeks"
    complexity: Complexity;       // "simple" | "medium" | "complex" | "enterprise"
    teamSize: number;             // Number of team members
    assignee: string | null;      // Primary assignee
    tags: string[];               // Custom tags
  };
  
  // Kanban columns
  columns: Column[];
  
  // Tasks
  tasks: Record<string, Task>;    // Task ID → Task object
  
  // Statistics
  statistics: {
    totalTasks: number;
    todoTasks: number;
    inProgressTasks: number;
    reviewTasks: number;
    doneTasks: number;
    blockedTasks: number;
    totalEstimatedHours: number;
    totalActualHours: number;
    completionPercentage: number;
  };
  
  // History
  history: HistoryEntry[];
}
```

### Column Object

```typescript
interface Column {
  id: string;                     // "todo" | "in-progress" | "review" | "done" | custom
  title: string;                  // Display name
  order: number;                  // Column order (0-based)
  tasks: string[];                // Array of task IDs in this column
}
```

### Task Object

```typescript
interface Task {
  // Core identification
  id: string;                     // Unique task identifier
  title: string;                  // Task title
  description: string;            // Detailed description
  
  // Task hierarchy
  type: TaskType;                 // "epic" | "task" | "subtask"
  parentId: string | null;        // Parent task ID (for subtasks)
  
  // Priority & complexity
  priority: Priority;             // "low" | "medium" | "high" | "critical"
  complexity: Complexity;         // "simple" | "medium" | "complex"
  
  // Status management
  status: TaskStatus;             // "todo" | "in-progress" | "review" | "done" | "blocked" | "on-hold"
  column: string;                 // Current column ID
  
  // Relationships
  dependencies: string[];         // Task IDs this task depends on
  subtasks: string[];             // Sub-task IDs (for epics)
  
  // Effort tracking
  estimatedHours: number;         // Estimated effort in hours
  actualHours: number;            // Actual time spent
  
  // Categorization
  tags: string[];                 // Custom tags
  
  // SDD Integration
  sdd: {
    phase: SDDPhase;              // SDD phase: "research" | "brief" | "specification" | "planning" | "tasks" | "implementation"
    commands: string[];           // SDD commands to run: ["/research", "/specify", etc.]
    linkedSpec: string | null;    // Path to spec in specs/active/
    executeCommand: string;       // Command to execute this task: "/execute-task task-id"
    executedAt: ISO8601DateTime | null;     // When task was executed
    completedAt: ISO8601DateTime | null;    // When task was completed
    executedBy: string | null;              // Who executed the task
  };
  
  // Markdown content
  markdown: string;               // Full task description in markdown
  
  // Assignment
  assignee: string | null;        // Assigned to
  reporter: string | null;        // Created by
  
  // Timestamps
  created: ISO8601DateTime;
  updated: ISO8601DateTime;
  startedAt: ISO8601DateTime | null;
  completedAt: ISO8601DateTime | null;
  dueDate: ISO8601DateTime | null;
  
  // Blockers & Comments
  blockers: Blocker[];
  comments: Comment[];
  attachments: Attachment[];
  
  // History
  history: HistoryEntry[];
}
```

### Supporting Types

```typescript
type ProjectType = "application" | "feature" | "system" | "platform";

type RoadmapStatus = "planning" | "active" | "on-hold" | "completed" | "archived";

type TaskType = "epic" | "task" | "subtask";

type TaskStatus = "todo" | "in-progress" | "review" | "done" | "blocked" | "on-hold" | "archived";

type Priority = "low" | "medium" | "high" | "critical";

type Complexity = "simple" | "medium" | "complex" | "enterprise";

type SDDPhase = 
  | "research"
  | "brief"
  | "specification"
  | "planning"
  | "tasks"
  | "implementation"
  | "evolution"
  | "upgrade";

interface Blocker {
  id: string;
  description: string;
  blockedBy: string | null;        // Task ID or external reference
  created: ISO8601DateTime;
  resolved: ISO8601DateTime | null;
}

interface Comment {
  id: string;
  author: string;
  content: string;
  created: ISO8601DateTime;
  updated: ISO8601DateTime | null;
}

interface Attachment {
  id: string;
  filename: string;
  path: string;
  type: string;
  size: number;
  uploaded: ISO8601DateTime;
}

interface HistoryEntry {
  timestamp: ISO8601DateTime;
  action: string;                 // e.g., "task_created", "status_changed", "assigned"
  description: string;
  user: string;
  metadata?: Record<string, any>;
}

type ISO8601DateTime = string;     // Format: "2025-10-21T10:30:00Z"
```

---

## Task Hierarchy

### Epic Tasks
- **Type:** `"epic"`
- **Purpose:** High-level phase or milestone
- **Contains:** Multiple subtasks
- **Execution:** Usually not executed directly
- **Status:** Auto-calculated from subtasks

### Regular Tasks
- **Type:** `"task"`
- **Purpose:** Standalone work item
- **Contains:** May have subtasks
- **Execution:** Mapped to SDD command
- **Status:** Manually managed

### Subtasks
- **Type:** `"subtask"`
- **Purpose:** Part of larger task/epic
- **Parent:** Required (parentId field)
- **Execution:** Individual SDD command
- **Status:** Affects parent status

---

## Status Flow

```
        ┌──────────┐
        │   todo   │
        └────┬─────┘
             │
             ▼
     ┌──────────────┐
     │ in-progress  │
     └──────┬───────┘
            │
            ▼
      ┌──────────┐
      │  review  │
      └────┬─────┘
           │
           ▼
       ┌──────┐
       │ done │
       └──────┘

Cross-statuses:
- blocked (from any status)
- on-hold (from any status)
- archived (terminal state)
```

### Status Meanings

| Status | Description | Allowed Transitions |
|--------|-------------|---------------------|
| **todo** | Ready to start, all dependencies met | in-progress, blocked |
| **in-progress** | Currently being worked on | review, blocked, on-hold |
| **review** | Completed, awaiting review | done, in-progress (if changes needed), blocked |
| **done** | Reviewed and approved | archived |
| **blocked** | Cannot proceed, has blocker | todo, in-progress (when unblocked) |
| **on-hold** | Paused temporarily | todo, in-progress |
| **archived** | Cancelled or obsolete | (terminal) |

---

## SDD Command Mapping

### Phase → Command Mapping

| SDD Phase | Command | Output Files | Spec Location |
|-----------|---------|--------------|---------------|
| research | `/research` | research.md | specs/active/[task-id]/ |
| brief | `/brief` | feature-brief.md | specs/active/[task-id]/ |
| specification | `/specify` | spec.md | specs/active/[task-id]/ |
| planning | `/plan` | plan.md | specs/active/[task-id]/ |
| tasks | `/tasks` | tasks.md | specs/active/[task-id]/ |
| implementation | `/implement` | todo-list.md + code | specs/active/[task-id]/ |
| evolution | `/evolve` | updated docs | specs/active/[task-id]/ |
| upgrade | `/upgrade` | full suite | specs/active/[task-id]/ |

### Command Execution Flow

```
1. User runs: /execute-task task-001
2. System reads: roadmap.json → tasks.task-001
3. Determines: task-001.sdd.phase = "research"
4. Maps to: /research task-001 [description]
5. Executes: SDD command with PLAN mode
6. Creates: specs/active/task-001/research.md
7. Updates: task-001.sdd.linkedSpec = "specs/active/task-001"
8. Changes: task-001.status = "review"
9. Logs: execution-log.md entry
10. Moves: task-001 from "todo" to "review" column
```

---

## Dependency Management

### Dependency Rules

1. **Task cannot start** until all dependencies are done
2. **Blocked status** automatically set if dependency incomplete
3. **Auto-unblock** when dependencies complete
4. **Circular dependencies** not allowed
5. **Cross-epic dependencies** supported

### Example Dependency Chain

```json
{
  "tasks": {
    "task-001": {
      "id": "task-001",
      "title": "Research patterns",
      "dependencies": [],
      "status": "done"
    },
    "task-002": {
      "id": "task-002",
      "title": "Create specification",
      "dependencies": ["task-001"],
      "status": "in-progress"
    },
    "task-003": {
      "id": "task-003",
      "title": "Implement feature",
      "dependencies": ["task-002"],
      "status": "blocked"
    }
  }
}
```

In this example:
- task-002 can proceed (dependency task-001 is done)
- task-003 is blocked (dependency task-002 is in-progress)
- When task-002 → done, task-003 auto-unblocks

---

## VSCode Extension Integration

### Taskr Kanban Compatibility

The roadmap format is designed to be compatible with Taskr Kanban extension:

**Required fields (Taskr):**
- ✅ id, title, description
- ✅ status, column
- ✅ dependencies, subtasks
- ✅ tags, priority
- ✅ created, updated timestamps

**Enhanced fields (SDD):**
- ✅ sdd.phase, sdd.commands
- ✅ sdd.linkedSpec
- ✅ sdd.executeCommand
- ✅ markdown content
- ✅ estimatedHours, complexity
- ✅ history tracking

### Extension API

Future VSCode extensions can:

1. **Read roadmap.json** - Load kanban board
2. **Display columns** - Render task columns
3. **Show task details** - Display full task info
4. **Drag-and-drop** - Move tasks between columns
5. **Execute tasks** - Run `/execute-task` via command
6. **Update status** - Sync changes back to JSON
7. **Track progress** - Calculate completion percentage

### Cursor 2.1 Multi-Agent Support

**Parallel Execution:**
- Execute multiple independent tasks simultaneously
- Up to 8 agents can run in parallel
- Each agent operates in isolated environment
- No file conflicts between parallel executions

**Task Independence Detection:**
```typescript
function canExecuteInParallel(task1: Task, task2: Task): boolean {
  // Check if tasks have dependencies
  if (task1.dependencies.includes(task2.id)) return false;
  if (task2.dependencies.includes(task1.id)) return false;
  
  // Check if they modify same files
  if (hasFileOverlap(task1, task2)) return false;
  
  return true;
}
```

**Usage:**
```bash
# Execute 3 independent tasks in parallel
/execute-task task-001  # Agent 1
/execute-task task-002  # Agent 2
/execute-task task-003  # Agent 3
```

### Extension Development

```typescript
// Example: Reading roadmap in VSCode extension
import * as fs from 'fs';
import * as path from 'path';

interface RoadmapData {
  // Use types from schema above
}

function loadRoadmap(projectId: string): RoadmapData {
  const roadmapPath = path.join(
    'specs',
    'todo-roadmap',
    projectId,
    'roadmap.json'
  );
  
  const data = fs.readFileSync(roadmapPath, 'utf-8');
  return JSON.parse(data);
}

function executeTask(taskId: string): void {
  // Send command to Cursor
  vscode.commands.executeCommand(
    'cursor.runCommand',
    `/execute-task ${taskId}`
  );
}
```

---

## Validation Rules

### Schema Validation

1. **Required fields** must be present
2. **Task IDs** must be unique
3. **Dependencies** must reference existing tasks
4. **Columns** must have unique IDs
5. **Timestamps** must be valid ISO 8601
6. **Status** must be valid enum value
7. **Circular dependencies** must be detected and prevented

### Business Rules

1. **Task in column** must match task.column field
2. **Subtasks** must reference valid parent
3. **Dependencies** must be acyclic
4. **Epic subtasks** must exist in tasks object
5. **Completed tasks** must have completedAt timestamp
6. **Linked specs** must exist at path

---

## Statistics Calculation

### Automatic Statistics

```typescript
function calculateStatistics(roadmap: Roadmap): Statistics {
  const tasks = Object.values(roadmap.tasks);
  
  return {
    totalTasks: tasks.length,
    todoTasks: tasks.filter(t => t.status === 'todo').length,
    inProgressTasks: tasks.filter(t => t.status === 'in-progress').length,
    reviewTasks: tasks.filter(t => t.status === 'review').length,
    doneTasks: tasks.filter(t => t.status === 'done').length,
    blockedTasks: tasks.filter(t => t.status === 'blocked').length,
    totalEstimatedHours: tasks.reduce((sum, t) => sum + t.estimatedHours, 0),
    totalActualHours: tasks.reduce((sum, t) => sum + t.actualHours, 0),
    completionPercentage: Math.round(
      (tasks.filter(t => t.status === 'done').length / tasks.length) * 100
    )
  };
}
```

---

## Examples

See [FULL_PLAN_EXAMPLES.md](./FULL_PLAN_EXAMPLES.md) for complete examples of:
- Simple feature roadmap
- Medium application roadmap
- Complex system roadmap
- Task execution flows

---

## Versioning

**Current Version:** 1.0.0

**Version History:**
- **1.0.0** (2025-10-21): Initial specification
  - Taskr Kanban compatibility
  - SDD command integration
  - PLAN mode support

**Future Versions:**
- **1.1.0**: Add time tracking features
- **1.2.0**: Add custom fields support
- **2.0.0**: Add real-time collaboration

---

## References

- [Taskr Kanban Extension](https://marketplace.visualstudio.com/items?itemName=DavidMaliglowka.taskr-kanban)
- [JSON Schema](https://json-schema.org/)
- [ISO 8601 DateTime](https://en.wikipedia.org/wiki/ISO_8601)
- [SDD Guidelines](./guidelines.md)

---

**Maintained by:** SDD System  
**Last Updated:** 2025-10-21  
**Status:** Stable

