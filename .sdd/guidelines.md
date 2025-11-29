# Spec-Driven Development Guidelines

## Overview
This project follows Spec-Driven Development (SDD) methodology, emphasizing detailed specifications before implementation. All SDD commands now integrate with Cursor's PLAN mode for enhanced deliberation and control.

## PLAN Mode Integration

### Philosophy
Every SDD command follows a **plan-approve-execute** workflow to ensure:
- **Visibility**: See what will be created before it happens
- **Control**: Approve or modify plans before execution
- **Quality**: More thoughtful specifications and implementations
- **Safety**: No surprise file changes or modifications
- **Transparency**: Understand AI reasoning and approach

### Universal Workflow Pattern
```
User Command → Analysis (Readonly) → Create Plan → User Approval → Execute → Document
```

### Four Phases

**Phase 1: Analysis (Readonly)**
- Read relevant files and context
- Ask clarifying questions if information is missing
- Analyze what needs to be done
- No file modifications

**Phase 2: Planning (Create Plan Tool)**
- Present detailed plan showing what will be created/modified
- Explain reasoning and approach
- Show structure and content preview
- Wait for user approval
- **Cursor 2.1+:** Questions appear in interactive UI
- **Cursor 2.1+:** Users can ⌘+F to search within plans

**Phase 3: Execution (After Approval)**
- Create or modify files as planned
- Follow templates and guidelines
- Maintain quality and consistency
- Track progress continuously

**Phase 4: Documentation**
- Update tracking files
- Note timestamps and status
- Maintain audit trail
- Set up for next phase

### Benefits

**For Individual Developers:**
- Review plans before files are created
- Modify approach before execution
- Learn from AI reasoning
- Catch issues early

**For Teams:**
- Collaborative plan review
- Shared understanding of approach
- Risk reduction through oversight
- Clear audit trail for decisions

## Workflow Phases

### 1. Brief Phase (`/brief`) - SDD 2.5 Primary
- **Purpose**: 30-minute planning for rapid development
- **Focus**: Essential context, quick research, immediate action
- **Output**: Single `feature-brief.md` with just-enough planning
- **PLAN Mode**: Shows brief structure before creating
- **Key Questions**: 
  - What problem and who are the users?
  - Must-have vs nice-to-have features?
  - Success criteria and next actions?

### 2. Evolve Phase (`/evolve`) - SDD 2.5 Living Docs
- **Purpose**: Keep briefs aligned with implementation reality
- **Focus**: Lightweight updates during development
- **Output**: Updates to `feature-brief.md` with changelog
- **PLAN Mode**: Shows before/after changes before updating
- **Key Questions**:
  - What changed and why?
  - Does this affect approach or requirements?
  - Should we upgrade to full SDD?

### 3. Research Phase (`/research`) - SDD 2.0
- **Purpose**: Comprehensive pattern investigation
- **Focus**: Existing codebase patterns, external solutions
- **Output**: `research.md` with findings and recommendations
- **PLAN Mode**: Shows research strategy before executing
- **Key Questions**:
  - Where should we look for patterns?
  - Internal vs external research focus?
  - What constraints exist?

### 4. Specify Phase (`/specify`) - SDD 2.0
- **Purpose**: Define what needs to be built and why
- **Focus**: User requirements, business logic, acceptance criteria
- **Output**: `spec.md` with comprehensive requirements
- **PLAN Mode**: Shows spec structure before creating
- **Key Questions**: 
  - What problem are we solving?
  - Who are the users?
  - What are the success criteria?

### 5. Plan Phase (`/plan`) - SDD 2.0
- **Purpose**: Define how to build it technically
- **Focus**: Architecture, tech stack, design patterns
- **Output**: `plan.md` with technical implementation strategy
- **PLAN Mode**: Shows planning approach before creating (meta!)
- **Key Questions**:
  - What technology stack should we use?
  - How will the system architecture look?
  - What are the technical constraints?

### 6. Tasks Phase (`/tasks`) - SDD 2.0
- **Purpose**: Break down the plan into actionable items
- **Focus**: Discrete, manageable development tasks
- **Output**: `tasks.md` with implementation roadmap
- **PLAN Mode**: Shows task breakdown strategy before creating
- **Key Questions**:
  - What specific tasks need to be completed?
  - What is the order of implementation?
  - What are the dependencies?

### 7. Implement Phase (`/implement`) - SDD 2.0
- **Purpose**: Execute planned implementation systematically
- **Focus**: Todo-list generation and continuous execution
- **Output**: `todo-list.md`, code artifacts, progress tracking
- **PLAN Mode**: Shows implementation strategy before todo creation
- **Cursor 2.1+:** AI Code Review automatically analyzes code after implementation
- **Key Questions**:
  - What's the execution order?
  - What patterns can we reuse?
  - What are the priorities?

### 8. Upgrade Phase (`/upgrade`) - Escalation
- **Purpose**: Convert brief to full SDD when complexity emerges
- **Focus**: Seamless transition preserving all context
- **Output**: Full SDD document suite (research, spec, plan, tasks)
- **PLAN Mode**: Shows upgrade strategy and content mapping
- **Key Questions**:
  - What complexity triggered upgrade?
  - How does brief expand to full docs?
  - What additional planning is needed?

### 9. Full Planning Phase (`/sdd-full-plan` / `/pecut-all-in-one`) - Complete Roadmap
- **Purpose**: Create comprehensive A-to-Z project roadmap with kanban structure
- **Focus**: Epic-level organization, task hierarchy, dependency management
- **Output**: Full project roadmap in `specs/todo-roadmap/[project-id]/`
  - `roadmap.json` - VSCode extension compatible kanban board
  - `roadmap.md` - Human-readable markdown view
  - `tasks/*.json` - Individual task details
  - `execution-log.md` - Task execution tracking
- **PLAN Mode**: Shows complete roadmap structure before creation
- **Key Questions**:
  - What's the project goal and scope?
  - Who are the target users?
  - Technology stack preferences?
  - Timeline and team size?
  - Must-have vs nice-to-have features?

### 10. Task Execution Phase (`/execute-task`) - Orchestrated Execution
- **Purpose**: Execute specific task from roadmap using appropriate SDD command
- **Focus**: Automatic SDD command mapping, status tracking, dependency validation
- **Output**: Specs created in `specs/active/[task-id]/` linked to roadmap
- **PLAN Mode**: Shows execution strategy before running command
- **Key Questions**:
  - Any additional context needed?
  - Should we modify the task approach?
  - Are there blockers to address first?

## Directory Structure

```
specs/
├── 00-overview.md          # Project-wide specifications
├── active/                 # Features in development
│   └── feat-xxx-name/
│       ├── spec.md         # Requirements
│       ├── plan.md         # Technical approach
│       ├── tasks.md        # Implementation tasks
│       ├── progress.md     # Development tracking
│       └── reviews.md      # Code review notes
├── todo-roadmap/           # Project roadmaps (NEW)
│   ├── index.json          # Roadmap registry
│   └── [project-id]/
│       ├── roadmap.json    # Kanban board data
│       ├── roadmap.md      # Human-readable view
│       ├── tasks/          # Individual task JSON files
│       └── execution-log.md # Execution history
├── completed/              # Delivered features
├── backlog/                # Future features
└── index.md               # Navigation/status
```

## Collaboration Best Practices

1. **Choose the right starting point:**
   - `/brief` - For 80% of features (quick start)
   - `/sdd-full-plan` - For full applications or major systems
   - `/research` + `/specify` - For complex features needing deep analysis
2. **Keep specs updated** - Maintain alignment with implementation
3. **Use progress tracking** - Update progress.md or roadmap.json regularly
4. **Review and iterate** - Specs can evolve based on learnings
5. **Cross-reference** - Link related features and dependencies
6. **Leverage roadmaps** - Use kanban boards for project visibility

## Feature Naming Convention

- **Format**: `feat-XXX-descriptive-name`
- **Examples**: 
  - `feat-001-user-authentication`
  - `feat-002-photo-organizer`
  - `feat-003-payment-integration`

## Status Tracking

### Feature Status
- `draft` - Initial specification in progress
- `planned` - Technical plan completed
- `ready` - Tasks defined, ready for implementation
- `in-progress` - Under active development
- `review` - In code review phase
- `completed` - Feature delivered and tested
- `archived` - Older completed features

### Task Status
- `todo` - Not yet started
- `in-progress` - Currently being worked on
- `blocked` - Waiting for dependencies
- `review` - Ready for code review
- `done` - Completed and verified

## Quality Standards

### Specifications Should Include:
- Clear user stories with acceptance criteria
- Business requirements and constraints
- Success metrics and KPIs
- Edge cases and error scenarios

### Plans Should Include:
- Architecture diagrams and design patterns
- Technology stack justification
- Data models and API contracts
- Security and performance considerations

### Tasks Should Include:
- Clear, actionable descriptions
- Estimated effort/complexity
- Dependencies and prerequisites
- Definition of done criteria

### Roadmaps Should Include:
- Epic-level organization of work
- Clear task hierarchy (epic → task → subtask)
- Dependency mappings between tasks
- Status tracking across kanban columns
- Integration with SDD commands
- VSCode extension compatibility
