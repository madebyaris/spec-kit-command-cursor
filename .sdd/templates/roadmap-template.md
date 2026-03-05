# {{PROJECT_TITLE}}

**Project ID:** `{{PROJECT_ID}}`  
**Type:** {{PROJECT_TYPE}}  
**Complexity:** {{COMPLEXITY}}  
**Status:** {{STATUS}}  
**Created:** {{CREATED_DATE}}  
**Estimated Duration:** {{ESTIMATED_DURATION}}

---

## 📋 Project Overview

{{PROJECT_DESCRIPTION}}

### Metadata
- **SDD Version:** 5.0
- **PLAN Mode:** Enabled
- **Team Size:** {{TEAM_SIZE}}
- **Assignee:** {{ASSIGNEE}}
- **Tags:** {{TAGS}}

---

## 📊 Progress Summary

| Metric | Count | Percentage |
|--------|-------|------------|
| **Total Tasks** | {{TOTAL_TASKS}} | 100% |
| **To Do** | {{TODO_TASKS}} | {{TODO_PERCENTAGE}}% |
| **In Progress** | {{IN_PROGRESS_TASKS}} | {{IN_PROGRESS_PERCENTAGE}}% |
| **Review** | {{REVIEW_TASKS}} | {{REVIEW_PERCENTAGE}}% |
| **Done** | {{DONE_TASKS}} | {{DONE_PERCENTAGE}}% |
| **Blocked** | {{BLOCKED_TASKS}} | {{BLOCKED_PERCENTAGE}}% |

**Overall Completion:** {{COMPLETION_PERCENTAGE}}%

**Effort Tracking:**
- **Estimated Hours:** {{TOTAL_ESTIMATED_HOURS}}h
- **Actual Hours:** {{TOTAL_ACTUAL_HOURS}}h
- **Variance:** {{HOURS_VARIANCE}}h

---

## 📅 Kanban Board

### 🔵 To Do ({{TODO_TASKS}})

{{TODO_TASK_LIST}}

### 🟡 In Progress ({{IN_PROGRESS_TASKS}})

{{IN_PROGRESS_TASK_LIST}}

### 🟣 Review ({{REVIEW_TASKS}})

{{REVIEW_TASK_LIST}}

### 🟢 Done ({{DONE_TASKS}})

{{DONE_TASK_LIST}}

---

## 🗂️ Task Hierarchy

{{TASK_HIERARCHY}}

---

## 🚀 Execution Guide

### Getting Started

1. **Review the roadmap:**
   ```bash
   cat specs/todo-roadmap/{{PROJECT_ID}}/roadmap.md
   ```

2. **Start first task:**
   ```bash
   /execute-task {{FIRST_TASK_ID}}
   ```

3. **Track progress:**
   - Update task status in roadmap.json
   - Check execution-log.md for history
   - Review progress in this document

### Task Execution Commands

{{EXECUTION_COMMANDS}}

---

## 📈 Timeline & Milestones

{{TIMELINE}}

---

## 🔗 Dependencies Graph

{{DEPENDENCIES_GRAPH}}

---

## 📝 Notes

{{NOTES}}

---

## 🔄 Change History

{{CHANGE_HISTORY}}

---

## 📂 File Structure

```
specs/todo-roadmap/{{PROJECT_ID}}/
├── roadmap.json          # Kanban data (VSCode extension compatible)
├── roadmap.md            # This file - human-readable view
├── tasks/                # Individual task JSON files
│   ├── epic-001.json
│   ├── task-001-1.json
│   └── ...
└── execution-log.md      # Task execution tracking
```

---

## 🛠️ Integration

This roadmap integrates with:
- ✅ SDD Commands (`/brief`, `/research`, `/specify`, `/plan`, `/tasks`, `/implement`)
- ✅ VSCode Kanban Extensions (Taskr Kanban compatible)
- ✅ Specs in `specs/active/` for implementation details
- ✅ PLAN Mode for all command executions

---

**Created by:** `/sdd-full-plan` command  
**Last Updated:** {{LAST_UPDATED}}  
**Next Review:** {{NEXT_REVIEW}}

