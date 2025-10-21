# /sdd-full-plan Command

Create comprehensive SDD roadmap from A to Z with kanban-style task organization.

## Aliases
- /pecut-all-in-one

## Usage
```
/sdd-full-plan [project-id] [description]
/pecut-all-in-one [project-id] [description]
```

## Purpose
Orchestrate complete SDD workflow, generating a full project roadmap with:
- Epic-level main tasks
- Phase-based organization
- Detailed sub-tasks
- Implementation tasks
- Kanban board structure
- VSCode extension compatibility

---

## PLAN Mode Workflow

This command follows a **plan-approve-execute** pattern for comprehensive project planning.

### Phase 1: Analysis (Readonly)

**Analyze request:**
1. **Parse project description** - Understand scope and complexity
2. **Determine type** - Full application vs major feature
3. **Assess complexity** - Simple, medium, complex, enterprise
4. **Identify phases** - Research, planning, implementation, testing, deployment
5. **Calculate estimates** - Timeline, effort, resources needed

**Ask clarifying questions if needed:**
- What's the primary goal/problem this solves?
- Who are the target users?
- What's the technology stack preference (if any)?
- Any existing codebase to integrate with?
- Timeline and resource constraints?
- Key features (must-have vs nice-to-have)?
- Deployment environment and infrastructure?
- Team size and composition?
- Budget constraints?

**Read relevant files:**
- Existing roadmaps in `specs/todo-roadmap/`
- Project overview at `specs/00-overview.md`
- Templates at `.sdd/templates/`
- Similar projects for pattern matching

**Complexity detection criteria:**
- **Simple** (< 3 weeks): Single feature, small scope, 1-2 developers
- **Medium** (3-8 weeks): Multiple features, moderate complexity, small team
- **Complex** (8-20 weeks): Full application, high complexity, multiple teams
- **Enterprise** (> 20 weeks): Platform/system, very high complexity, large organization

### Phase 2: Planning (Create Plan Tool)

**Present detailed plan showing:**

1. **Project Analysis:**
   - Type: Application / Major Feature / System / Platform
   - Complexity: Simple / Medium / Complex / Enterprise
   - Estimated duration (timeline)
   - Team size recommendation
   - Recommended SDD approach (2.5 vs 2.0)

2. **Roadmap Structure Preview:**
   - Total epics/main tasks (count)
   - Total sub-tasks estimated
   - Phase organization (4-6 phases typical)
   - Critical path identification
   - Dependencies mapping

3. **Epic Breakdown (2-3 examples with subtasks):**
   ```
   Epic 1: Research & Foundation (Week 1-2)
   ├── Sub-task: Research existing patterns (8h)
   ├── Sub-task: Define requirements (16h)
   ├── Sub-task: Create technical specification (12h)
   └── Sub-task: Architecture design (16h)
   
   Epic 2: Core Development (Week 3-6)
   ├── Sub-task: Setup infrastructure (8h)
   ├── Sub-task: Implement backend API (40h)
   ├── Sub-task: Build frontend components (32h)
   └── Sub-task: Integration & testing (24h)
   
   Epic 3: Deployment & Launch (Week 7-8)
   ├── Sub-task: Performance optimization (16h)
   ├── Sub-task: Security hardening (12h)
   ├── Sub-task: Deployment setup (8h)
   └── Sub-task: Documentation & training (16h)
   ```

4. **File Structure to be created:**
   ```
   specs/todo-roadmap/[project-id]/
   ├── roadmap.json          # Kanban data (VSCode compatible)
   ├── roadmap.md            # Human-readable view
   ├── tasks/                # Individual task details
   │   ├── epic-001.json     # Epic task details
   │   ├── task-001-1.json   # Sub-task details
   │   └── ...
   └── execution-log.md      # Task execution tracking
   ```

5. **Integration Strategy:**
   - How main tasks map to SDD commands
   - Task execution workflow
   - Progress tracking mechanism
   - Link to `specs/active/` for implementation

6. **Success Metrics:**
   - How completion will be measured
   - Quality checkpoints
   - Review gates

**The plan should clearly show:**
- Complete project breakdown
- Realistic timeline and effort estimates
- Task dependencies and critical path
- Execution strategy

### Phase 3: Execution (After Approval)

**Once plan is approved, generate complete roadmap:**

1. **Create directory structure:**
   ```bash
   mkdir -p specs/todo-roadmap/[project-id]/tasks
   ```

2. **Generate roadmap.json:**
   - Use template from `.sdd/templates/roadmap-template.json`
   - Include all epics, tasks, and subtasks
   - Set up kanban columns (To Do, In Progress, Review, Done)
   - Define task hierarchy and dependencies
   - Add SDD command mappings
   - Include metadata (complexity, timeline, etc.)

3. **Create roadmap.md:**
   - Generate human-readable markdown view
   - Include kanban board visualization
   - Show task hierarchy
   - Provide execution commands
   - Include progress tracking section

4. **Generate individual task files:**
   - Create JSON file for each task
   - Include full task details
   - Link to parent tasks
   - Map to SDD commands
   - Add execution instructions

5. **Set up execution-log.md:**
   - Create template for tracking
   - Include task execution history
   - Status change log
   - Time tracking

6. **Update roadmap registry:**
   - Add entry to `specs/todo-roadmap/index.json`
   - Register project metadata
   - Link to roadmap files

7. **Quality checks:**
   - All tasks have clear descriptions
   - Dependencies are logical
   - Estimates are reasonable
   - SDD commands properly mapped
   - JSON is valid and parseable

### Phase 4: Documentation

**Finalize roadmap creation:**
- Provide next steps for user
- Show how to execute first task
- Display kanban board preview
- Document execution commands
- Explain task workflow

**Output summary:**
```
✅ Roadmap created: specs/todo-roadmap/[project-id]/
✅ Total epics: X
✅ Total tasks: Y
✅ Estimated duration: Z weeks
✅ Ready for execution!

Next steps:
1. Review roadmap: specs/todo-roadmap/[project-id]/roadmap.md
2. Start first task: /execute-task epic-001
3. Track progress in roadmap.json
```

---

## Command Behavior

### Automatic Scope Detection

**Simple Project (< 3 weeks):**
- Use SDD 2.5 Brief approach
- 3-5 main tasks
- Quick iteration
- Minimal documentation
- Timeline: Days to 2 weeks

**Medium Project (3-8 weeks):**
- Mix of Brief and Full SDD
- 5-10 main tasks
- Structured phases
- Moderate documentation
- Timeline: 3-8 weeks

**Complex Project (8-20 weeks):**
- Full SDD 2.0 workflow
- 10-20 main tasks
- Comprehensive planning
- Full documentation
- Timeline: 2-5 months

**Enterprise Project (> 20 weeks):**
- Multi-phase SDD
- 20+ main tasks
- Milestone-based approach
- Enterprise documentation
- Timeline: 5+ months

### Task Type Mapping

Tasks automatically map to SDD commands based on type:

| Task Phase | SDD Command | Output |
|------------|-------------|--------|
| Research | `/research` | research.md |
| Brief | `/brief` | feature-brief.md |
| Specification | `/specify` | spec.md |
| Planning | `/plan` | plan.md |
| Task Breakdown | `/tasks` | tasks.md |
| Implementation | `/implement` | todo-list.md + code |
| Evolution | `/evolve` | updates to docs |
| Upgrade | `/upgrade` | full SDD suite |

### Task Execution Workflow

Each task includes an execute command:
```bash
/execute-task epic-001
/execute-task task-001-1
```

**Execution process:**
1. Read task details from roadmap.json
2. Determine appropriate SDD command based on task.sdd.phase
3. Run SDD command with task context
4. Create spec in `specs/active/[task-id]/`
5. Update roadmap.json:
   - Set linkedSpec path
   - Update status (todo → in-progress → review → done)
   - Log execution time
6. Update execution-log.md with entry
7. Move task card in kanban columns

### Status Management

**Task Status Flow:**
```
todo → in-progress → review → done
  ↓         ↓           ↓
blocked  on-hold    archived
```

**Status Meanings:**
- **todo**: Ready to start, all dependencies met
- **in-progress**: Currently being worked on
- **review**: Completed, awaiting review
- **done**: Reviewed and approved
- **blocked**: Cannot proceed, has blocker
- **on-hold**: Paused temporarily
- **archived**: Cancelled or obsolete

### Dependency Management

Tasks can depend on other tasks:
```json
{
  "id": "task-002",
  "dependencies": ["task-001"],
  "status": "blocked"
}
```

System automatically:
- Prevents execution of dependent tasks until dependencies done
- Updates status when dependencies complete
- Shows dependency chain in roadmap.md

## Output

**Created Files:**
- `specs/todo-roadmap/[project-id]/roadmap.json` - Kanban data
- `specs/todo-roadmap/[project-id]/roadmap.md` - Human-readable view
- `specs/todo-roadmap/[project-id]/tasks/*.json` - Individual task details
- `specs/todo-roadmap/[project-id]/execution-log.md` - Execution history

**Registry Updated:**
- `specs/todo-roadmap/index.json` - All roadmaps registry

**Integration Created:**
- Links to execute via existing SDD commands
- Tracks progress in kanban format
- VSCode extension compatible

## Examples

### Example 1: Simple Feature
```bash
/sdd-full-plan user-notifications Add email and push notifications with preferences
```

**Expected Output:**
- Type: Feature
- Complexity: Simple
- Duration: 2 weeks
- Tasks: 3-5 main tasks
- Approach: SDD 2.5 (Brief)

### Example 2: Medium Application
```bash
/sdd-full-plan blog-platform Full-featured blog with CMS, user management, and analytics
```

**Expected Output:**
- Type: Application
- Complexity: Medium
- Duration: 6 weeks
- Tasks: 8-12 main tasks
- Approach: Mixed SDD

### Example 3: Complex System
```bash
/pecut-all-in-one ecommerce-platform Multi-vendor marketplace with payments, shipping, and vendor management
```

**Expected Output:**
- Type: System
- Complexity: Complex
- Duration: 16 weeks
- Tasks: 15-20 main tasks
- Approach: Full SDD 2.0

## Notes for AI Assistants

- **Always present plan first** with complete roadmap preview
- **Detect complexity automatically** using multiple indicators
- **Create hierarchical structure** with proper parent-child relationships
- **Generate VSCode-compatible JSON** following Taskr Kanban format
- **Wait for approval** before creating any files
- **Link to SDD commands** for each task execution
- **Track progress** meticulously in execution log
- **Validate dependencies** ensure logical task ordering
- **Estimate realistically** use historical data when possible
- **Document thoroughly** all decisions and rationale

## Integration with VSCode Extensions

The roadmap.json format is designed to be compatible with:
- Taskr Kanban extension
- Custom SDD kanban extensions
- Generic JSON-based project management tools

See [ROADMAP_FORMAT_SPEC.md](../../.sdd/ROADMAP_FORMAT_SPEC.md) for complete JSON schema specification.

## See Also

- [/execute-task](./execute-task.md) - Execute tasks from roadmap
- [ROADMAP_FORMAT_SPEC.md](../../.sdd/ROADMAP_FORMAT_SPEC.md) - JSON format details
- [FULL_PLAN_EXAMPLES.md](../../.sdd/FULL_PLAN_EXAMPLES.md) - Complete examples
- [SDD Guidelines](../../.sdd/guidelines.md) - Methodology overview

