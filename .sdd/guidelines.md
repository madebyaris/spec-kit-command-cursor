# Spec-Driven Development Guidelines

## Overview
This project follows Spec-Driven Development (SDD) methodology, emphasizing detailed specifications before implementation.

## Workflow Phases

### 1. Specify Phase (`/specify`)
- **Purpose**: Define what needs to be built and why
- **Focus**: User requirements, business logic, acceptance criteria
- **Output**: `spec.md` with comprehensive requirements
- **Key Questions**: 
  - What problem are we solving?
  - Who are the users?
  - What are the success criteria?

### 2. Plan Phase (`/plan`)
- **Purpose**: Define how to build it technically
- **Focus**: Architecture, tech stack, design patterns
- **Output**: `plan.md` with technical implementation strategy
- **Key Questions**:
  - What technology stack should we use?
  - How will the system architecture look?
  - What are the technical constraints?

### 3. Tasks Phase (`/tasks`)
- **Purpose**: Break down the plan into actionable items
- **Focus**: Discrete, manageable development tasks
- **Output**: `tasks.md` with implementation roadmap
- **Key Questions**:
  - What specific tasks need to be completed?
  - What is the order of implementation?
  - What are the dependencies?

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
├── completed/              # Delivered features
├── backlog/                # Future features
└── index.md               # Navigation/status
```

## Collaboration Best Practices

1. **Always start with `/specify`** - Don't skip to planning or tasks
2. **Keep specs updated** - Maintain alignment with implementation
3. **Use progress tracking** - Update progress.md regularly
4. **Review and iterate** - Specs can evolve based on learnings
5. **Cross-reference** - Link related features and dependencies

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
