# SDD Full Plan Examples

This document provides comprehensive examples of using `/sdd-full-plan` and `/pecut-all-in-one` commands at different complexity levels.

---

## Table of Contents

1. [Simple Feature Example](#example-1-simple-feature---user-notifications)
2. [Medium Application Example](#example-2-medium-application---blog-platform)
3. [Complex System Example](#example-3-complex-system---e-commerce-marketplace)
4. [Task Execution Flow](#task-execution-flow)
5. [Tips and Best Practices](#tips-and-best-practices)

---

## Example 1: Simple Feature - User Notifications

### Scenario
Adding email and push notifications to an existing application.

### Command
```bash
/sdd-full-plan user-notifications Add email and push notifications with user preferences
```

### AI Analysis Phase

```
Analyzing project...
- Type: Feature addition
- Complexity: Simple
- Estimated duration: 2 weeks
- Team: 1-2 developers
- Approach: SDD 2.5 (Brief)

Questions:
1. What types of notifications? (email, push, in-app?)
2. Existing notification infrastructure?
3. User preference management needed?
```

### User Response
```
1. Email and push for now
2. We have SendGrid for email, need push setup
3. Yes, users should control notification types
```

### AI Plan Presentation

```markdown
# Plan for /sdd-full-plan user-notifications

## Project Analysis
- **Type:** Feature
- **Complexity:** Simple
- **Duration:** 2 weeks (80 hours)
- **Team:** 1-2 developers
- **Approach:** SDD 2.5 Brief

## Roadmap Structure

### Epic 1: Notification Infrastructure (Week 1)
- Sub-task: Research notification patterns (8h)
- Sub-task: Set up push notification service (16h)
- Sub-task: Design notification preference model (8h)
- Sub-task: Create notification API (16h)

### Epic 2: User Preferences & Testing (Week 2)
- Sub-task: Build preference UI (16h)
- Sub-task: Implement notification triggers (8h)
- Sub-task: Testing and refinement (8h)

**Total: 3 epics, 7 subtasks, 80 hours**

## File Structure
```
specs/todo-roadmap/user-notifications/
├── roadmap.json
├── roadmap.md
├── tasks/
│   ├── epic-001.json
│   ├── task-001-1.json
│   └── ...
└── execution-log.md
```

## Integration
- Epic 1 tasks → /brief (quick specs)
- Implementation → /implement
- Updates → /evolve

Approve this plan?
```

### User Approval
```
Approved! Let's go.
```

### Generated Roadmap (roadmap.json excerpt)

```json
{
  "id": "user-notifications",
  "title": "User Notifications System",
  "description": "Add email and push notifications with user preferences",
  "type": "feature",
  "complexity": "simple",
  "metadata": {
    "sddVersion": "2.5",
    "planMode": true,
    "estimatedDuration": "2 weeks",
    "complexity": "simple"
  },
  "tasks": {
    "epic-001": {
      "id": "epic-001",
      "title": "Notification Infrastructure",
      "type": "epic",
      "priority": "high",
      "estimatedHours": 48,
      "subtasks": ["task-001-1", "task-001-2", "task-001-3", "task-001-4"],
      "sdd": {
        "phase": "brief",
        "commands": ["/brief"],
        "executeCommand": "/execute-task epic-001"
      }
    },
    "task-001-1": {
      "id": "task-001-1",
      "title": "Research Notification Patterns",
      "description": "Research existing notification implementations and best practices",
      "type": "subtask",
      "parentId": "epic-001",
      "priority": "high",
      "complexity": "low",
      "estimatedHours": 8,
      "dependencies": [],
      "sdd": {
        "phase": "research",
        "commands": ["/research"],
        "linkedSpec": null,
        "executeCommand": "/execute-task task-001-1"
      }
    }
  }
}
```

### Execution Flow

```bash
# Step 1: Start first task
/execute-task task-001-1

# AI runs research phase
# Creates: specs/active/task-001-1/research.md
# Updates: roadmap.json status → review

# Step 2: Continue with next task
/execute-task task-001-2

# And so on...
```

---

## Example 2: Medium Application - Blog Platform

### Scenario
Building a full-featured blog platform from scratch.

### Command
```bash
/sdd-full-plan blog-platform Full-featured blog with CMS, user management, comments, and analytics
```

### AI Analysis Phase

```
Analyzing project...
- Type: Application
- Complexity: Medium
- Estimated duration: 6 weeks
- Team: 3-4 developers
- Approach: Mixed SDD (2.5 + 2.0)

Questions:
1. Target users? (bloggers, organizations, both?)
2. Technology stack preference?
3. Key features priority?
4. Hosting/deployment target?
5. Budget/timeline constraints?
```

### User Response
```
1. Individual bloggers primarily
2. Node.js/React preferred
3. Must-have: posts, comments, basic analytics
4. AWS deployment
5. Launch in 6 weeks
```

### AI Plan Presentation

```markdown
# Plan for /sdd-full-plan blog-platform

## Project Analysis
- **Type:** Application
- **Complexity:** Medium
- **Duration:** 6 weeks (240 hours)
- **Team:** 3-4 developers
- **Approach:** Mixed SDD

## Roadmap Structure

### Epic 1: Research & Foundation (Week 1)
- Research CMS patterns (8h)
- Define system architecture (16h)
- Create technical specification (16h)
- Database schema design (8h)

### Epic 2: Core Blog Features (Week 2-3)
- User authentication system (24h)
- Post creation and editing (32h)
- Rich text editor integration (16h)
- Media upload handling (16h)

### Epic 3: Engagement Features (Week 4)
- Comment system (24h)
- User profiles (16h)
- Basic analytics (16h)

### Epic 4: Admin & CMS (Week 5)
- Admin dashboard (24h)
- Content management (16h)
- User management (16h)

### Epic 5: Deployment & Launch (Week 6)
- AWS setup (8h)
- Performance optimization (16h)
- Security hardening (8h)
- Documentation (8h)

**Total: 5 epics, 20 subtasks, 240 hours**

## SDD Approach by Epic
- Epic 1: Full SDD 2.0 (research → specify → plan)
- Epic 2-4: Brief for each major feature
- Epic 5: Implementation-focused

Approve this plan?
```

### Generated Roadmap (roadmap.json excerpt)

```json
{
  "id": "blog-platform",
  "title": "Full-Featured Blog Platform",
  "description": "Complete blog platform with CMS, user management, and analytics",
  "type": "application",
  "complexity": "medium",
  "metadata": {
    "sddVersion": "2.5",
    "estimatedDuration": "6 weeks",
    "teamSize": 3
  },
  "columns": [
    {
      "id": "todo",
      "title": "To Do",
      "tasks": ["epic-001", "epic-002"]
    },
    {
      "id": "in-progress",
      "title": "In Progress",
      "tasks": []
    },
    {
      "id": "review",
      "title": "Review",
      "tasks": []
    },
    {
      "id": "done",
      "title": "Done",
      "tasks": []
    }
  ],
  "tasks": {
    "epic-001": {
      "id": "epic-001",
      "title": "Research & Foundation",
      "type": "epic",
      "priority": "critical",
      "estimatedHours": 48,
      "subtasks": ["task-001-1", "task-001-2", "task-001-3", "task-001-4"],
      "sdd": {
        "phase": "research",
        "commands": ["/research", "/specify", "/plan"],
        "executeCommand": "/execute-task epic-001"
      },
      "dependencies": []
    },
    "epic-002": {
      "id": "epic-002",
      "title": "Core Blog Features",
      "type": "epic",
      "priority": "high",
      "estimatedHours": 88,
      "subtasks": ["task-002-1", "task-002-2", "task-002-3", "task-002-4"],
      "dependencies": ["epic-001"],
      "sdd": {
        "phase": "implementation",
        "commands": ["/brief", "/implement"],
        "executeCommand": "/execute-task epic-002"
      }
    }
  },
  "statistics": {
    "totalTasks": 20,
    "todoTasks": 20,
    "totalEstimatedHours": 240,
    "completionPercentage": 0
  }
}
```

### Task Dependency Example

```json
{
  "task-002-1": {
    "id": "task-002-1",
    "title": "User Authentication System",
    "dependencies": ["task-001-3"],
    "status": "blocked",
    "blockers": [
      {
        "id": "blocker-001",
        "description": "Waiting for database schema design completion",
        "blockedBy": "task-001-3"
      }
    ]
  }
}
```

---

## Example 3: Complex System - E-Commerce Marketplace

### Scenario
Building a multi-vendor marketplace with payments, shipping, and vendor management.

### Command
```bash
/pecut-all-in-one ecommerce-marketplace Multi-vendor marketplace platform with payment processing, shipping integration, vendor management, and analytics
```

### AI Analysis Phase

```
Analyzing project...
- Type: System/Platform
- Complexity: Complex
- Estimated duration: 16 weeks
- Team: 8-10 developers
- Approach: Full SDD 2.0

Questions:
1. Target market? (B2C, B2B, both?)
2. Payment providers? (Stripe, PayPal, etc.)
3. Shipping integrations needed?
4. Vendor onboarding process?
5. Compliance requirements? (PCI, GDPR, etc.)
6. Mobile app needed?
7. International support?
```

### User Response
```
1. B2C primarily, B2B later
2. Stripe + PayPal + Apple Pay
3. Yes - FedEx, UPS, USPS
4. Self-service with approval workflow
5. PCI SAQ A-EP, GDPR compliant
6. Phase 2
7. Yes - multi-currency, multi-language
```

### AI Plan Presentation

```markdown
# Plan for /pecut-all-in-one ecommerce-marketplace

## Project Analysis
- **Type:** Platform
- **Complexity:** Complex
- **Duration:** 16 weeks (640 hours)
- **Team:** 8-10 developers
- **Approach:** Full SDD 2.0

## Critical Considerations
- PCI compliance requirements
- Multi-vendor complexity
- Payment provider integrations
- International support

## Roadmap Structure

### Phase 1: Research & Architecture (Week 1-2)
**Epic 1: System Research** (40h)
- Research marketplace patterns
- Payment provider comparison
- Shipping integration analysis
- Compliance requirements study

**Epic 2: System Architecture** (40h)
- Multi-tenant architecture design
- Payment processing architecture
- Data model design
- Security architecture

### Phase 2: Core Platform (Week 3-6)
**Epic 3: User Management** (64h)
- Customer authentication
- Vendor authentication
- Admin roles
- Permission system

**Epic 4: Product Management** (80h)
- Product catalog
- Inventory management
- Category system
- Search and filters

**Epic 5: Vendor Portal** (64h)
- Vendor dashboard
- Product management
- Order management
- Analytics

### Phase 3: Transaction Processing (Week 7-10)
**Epic 6: Shopping Cart** (48h)
- Cart functionality
- Checkout process
- Multi-vendor cart handling

**Epic 7: Payment Processing** (80h)
- Stripe integration
- PayPal integration
- Apple Pay integration
- PCI compliance implementation

**Epic 8: Order Management** (64h)
- Order processing
- Order tracking
- Vendor order distribution

### Phase 4: Fulfillment (Week 11-12)
**Epic 9: Shipping Integration** (64h)
- FedEx API integration
- UPS API integration
- USPS API integration
- Shipping rate calculation
- Label generation

### Phase 5: Platform Features (Week 13-14)
**Epic 10: Reviews & Ratings** (32h)
**Epic 11: Notifications** (32h)
**Epic 12: Analytics Dashboard** (48h)

### Phase 6: Deployment & Launch (Week 15-16)
**Epic 13: Infrastructure Setup** (40h)
**Epic 14: Security Hardening** (40h)
**Epic 15: Performance Optimization** (40h)
**Epic 16: Documentation & Training** (24h)

**Total: 16 epics, 60+ subtasks, 640 hours**

## Development Phases
1. **Foundation** (Week 1-2): Research + Architecture
2. **Core** (Week 3-6): User + Product + Vendor
3. **Transactions** (Week 7-10): Cart + Payment + Orders
4. **Fulfillment** (Week 11-12): Shipping
5. **Features** (Week 13-14): Reviews + Analytics
6. **Launch** (Week 15-16): Deployment

## Team Structure Recommendation
- **2 Backend Developers** - API & Services
- **2 Frontend Developers** - Customer UI
- **1 Frontend Developer** - Vendor Portal
- **1 DevOps Engineer** - Infrastructure
- **1 Security Engineer** - Compliance & Security
- **1 QA Engineer** - Testing
- **1 Project Manager** - Coordination

## Critical Path
```
Epic 1 → Epic 2 → Epic 3 → Epic 4 → Epic 6 → Epic 7 → Epic 8 → Epic 9
```

Approve this plan?
```

### Generated Roadmap Structure

```json
{
  "id": "ecommerce-marketplace",
  "title": "Multi-Vendor E-Commerce Marketplace",
  "type": "platform",
  "complexity": "complex",
  "metadata": {
    "sddVersion": "2.5",
    "estimatedDuration": "16 weeks",
    "teamSize": 8,
    "tags": ["ecommerce", "marketplace", "payments", "shipping", "pci-compliance"]
  },
  "tasks": {
    "epic-001": {
      "id": "epic-001",
      "title": "System Research",
      "type": "epic",
      "priority": "critical",
      "complexity": "complex",
      "estimatedHours": 40,
      "subtasks": [
        "task-001-1",
        "task-001-2",
        "task-001-3",
        "task-001-4"
      ],
      "sdd": {
        "phase": "research",
        "commands": ["/research"],
        "executeCommand": "/execute-task epic-001"
      },
      "dependencies": [],
      "tags": ["phase-1", "foundation", "research"]
    },
    "epic-007": {
      "id": "epic-007",
      "title": "Payment Processing",
      "type": "epic",
      "priority": "critical",
      "complexity": "complex",
      "estimatedHours": 80,
      "subtasks": [
        "task-007-1",
        "task-007-2",
        "task-007-3",
        "task-007-4",
        "task-007-5"
      ],
      "dependencies": ["epic-006"],
      "sdd": {
        "phase": "specification",
        "commands": ["/specify", "/plan", "/tasks", "/implement"],
        "executeCommand": "/execute-task epic-007"
      },
      "tags": ["phase-3", "critical", "payment", "pci-compliance"],
      "markdown": "## Payment Processing System\n\n**Critical Feature**\n\nImplement secure multi-provider payment processing with PCI compliance.\n\n### Providers\n- Stripe (primary)\n- PayPal (alternative)\n- Apple Pay (convenience)\n\n### Compliance\n- PCI SAQ A-EP\n- Secure tokenization\n- No raw card data storage\n\n### Security\n- 3D Secure\n- Fraud detection\n- Rate limiting\n- Audit logging"
    }
  }
}
```

---

## Task Execution Flow

### Example: Executing a Research Task

```bash
# Step 1: Execute task
/execute-task task-001-1
```

**AI Response:**
```
Analyzing task task-001-1...

Task: Research Marketplace Patterns
Phase: research
Status: todo
Dependencies: ✅ All met

Plan for execution:
1. Run: /research task-001-1 "Research existing marketplace platforms"
2. Create: specs/active/task-001-1/research.md
3. Update: roadmap.json
4. Log: execution-log.md

Approve execution?
```

**User:** `Yes`

**AI Executes:**
```
Running /research task-001-1...

[Research phase with PLAN mode]
→ Creating research.md
→ Documenting patterns found
→ Adding recommendations

✅ Research complete!

Updated roadmap:
- task-001-1: todo → review
- linkedSpec: specs/active/task-001-1
- Column moved: todo → review

Next available: task-001-2 (ready to execute)
```

### Example: Executing with Dependencies

```bash
# Try to execute task with unmet dependency
/execute-task task-002-1
```

**AI Response:**
```
❌ Cannot execute task-002-1

Reason: Dependency not met
- Depends on: task-001-3 (status: in-progress)

Recommendation:
1. Complete task-001-3 first
2. Or check if task-001-3 is actually done and update status

Available tasks:
- task-001-2 (no dependencies)
- task-001-4 (no dependencies)
```

---

## Tips and Best Practices

### 1. Choosing the Right Complexity

**Use Simple** when:
- Single feature addition
- 1-2 week timeline
- 1-2 developers
- Well-understood domain
- Example: Add export feature

**Use Medium** when:
- Full application
- 4-8 week timeline
- 3-5 developers
- Some unknowns
- Example: Blog platform

**Use Complex** when:
- Platform/system
- 10+ week timeline
- 6+ developers
- Many unknowns
- Compliance requirements
- Example: Marketplace

### 2. Task Granularity

**Good task size:** 4-16 hours (0.5-2 days)
**Too small:** 1-2 hours (creates overhead)
**Too large:** 40+ hours (hard to track)

**Example - Good:**
```
- Implement user authentication (16h)
  ├── Set up auth service (8h)
  └── Create login/signup UI (8h)
```

**Example - Too granular:**
```
- Create login button (1h)
- Add click handler (1h)
- Style button (1h)
```

### 3. Dependency Management

**Clear dependencies:**
```json
{
  "task-003": {
    "dependencies": ["task-001", "task-002"],
    "description": "Depends on auth (task-001) and database (task-002)"
  }
}
```

**Avoid circular:**
```json
// ❌ BAD
{
  "task-A": {"dependencies": ["task-B"]},
  "task-B": {"dependencies": ["task-A"]}
}
```

### 4. Using SDD Commands Effectively

**Research phase:**
- Use for new domains
- Pattern discovery
- Technology evaluation

**Brief phase:**
- Quick features
- Well-understood scope
- Rapid iteration

**Full SDD:**
- Complex features
- Compliance requirements
- Multi-team coordination

### 5. Progress Tracking

**Update regularly:**
```bash
# Mark task complete
/execute-task task-001-1
# System updates status automatically

# Track hours
# Update actualHours in roadmap.json

# Log blockers
# Add to task.blockers array
```

### 6. Team Collaboration

**Assign tasks:**
```json
{
  "task-001": {
    "assignee": "developer-1",
    "priority": "high"
  }
}
```

**Track comments:**
```json
{
  "comments": [
    {
      "author": "developer-2",
      "content": "Need clarification on API structure",
      "created": "2025-10-21T10:00:00Z"
    }
  ]
}
```

---

## Integration with VSCode Extensions

### Future Extension Features

**Phase 1: Read-Only View**
```typescript
// Display kanban board from roadmap.json
showKanbanBoard(projectId);
```

**Phase 2: Interactive**
```typescript
// Drag task between columns
moveTask(taskId, fromColumn, toColumn);

// Execute task via UI
executeTaskFromUI(taskId);
```

**Phase 3: Real-Time**
```typescript
// Sync changes across team
syncRoadmapChanges();
```

---

## Common Patterns

### Pattern 1: Feature Addition to Existing App

```bash
/sdd-full-plan feature-name Brief description
→ Simple complexity
→ 1-2 epics
→ SDD 2.5 approach
```

### Pattern 2: New Application

```bash
/pecut-all-in-one app-name Comprehensive description with key features
→ Medium complexity
→ 4-8 epics
→ Mixed SDD approach
```

### Pattern 3: Platform/System

```bash
/sdd-full-plan platform-name Detailed description with integrations and compliance
→ Complex complexity
→ 10+ epics
→ Full SDD 2.0 workflow
```

---

## Next Steps

1. **Try your first roadmap:**
   ```bash
   /sdd-full-plan test-project Simple test of full planning feature
   ```

2. **Review generated files:**
   - `specs/todo-roadmap/test-project/roadmap.md`
   - `specs/todo-roadmap/test-project/roadmap.json`

3. **Execute first task:**
   ```bash
   /execute-task epic-001
   ```

4. **Track progress:**
   - Check kanban board in roadmap.md
   - Review execution-log.md
   - Monitor completion percentage

---

**Questions?**
- See [sdd-full-plan.md](../.cursor/commands/sdd-full-plan.md) for command details
- Check [ROADMAP_FORMAT_SPEC.md](./ROADMAP_FORMAT_SPEC.md) for JSON schema
- Review [guidelines.md](./guidelines.md) for SDD methodology

