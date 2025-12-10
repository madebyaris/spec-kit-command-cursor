# Cursor Modes Integration

This guide explains how SDD commands integrate with Cursor's built-in modes for optimal workflow.

---

## Cursor's Built-in Modes

| Mode | Tools Available | Best For | Read-Only |
|------|-----------------|----------|-----------|
| **Agent** | All (Search, Edit, Terminal, etc.) | Autonomous multi-file edits | No |
| **Ask** | Search only | Learning, exploration, understanding code | Yes |
| **Plan** | Codebase, Read file, Terminal | Detailed planning before implementation | Mostly |
| **Custom** | User-defined | Specialized workflows | Configurable |

---

## SDD Command → Cursor Mode Mapping

| SDD Command | Recommended Cursor Mode | Why |
|-------------|------------------------|-----|
| `/brief` | **Plan** | Creating specs without code changes |
| `/research` | **Ask** | Read-only exploration of patterns |
| `/specify` | **Plan** | Defining requirements, no implementation |
| `/plan` | **Plan** | Architecture design, no code yet |
| `/tasks` | **Plan** | Breaking down work, no implementation |
| `/implement` | **Agent** | Autonomous multi-file code changes |
| `/evolve` | **Plan** | Updating specs, not code |
| `/upgrade` | **Plan** | Expanding specs, not implementing |
| `/debug` | **Custom (Debug)** | Investigate before fixing |
| `/generate-prd` | **Plan** | Document creation, no code |
| `/refine` | **Plan** | Iterating on specs/prompts |
| `/sdd-full-plan` | **Plan** | Creating roadmaps |
| `/execute-task` | **Agent** | Executing roadmap tasks |
| `/generate-rules` | **Plan** | Creating rule files |

---

## Mode Switching

Users can switch between modes using:
- **Keyboard:** `Cmd+.` (Mac) or `Ctrl+.` (Windows/Linux)
- **UI:** Click the mode selector in the chat panel

### When to Suggest Mode Switching

Include this hint in templates when appropriate:

```markdown
**Recommended Cursor Mode:** [Mode Name]
(Use `Cmd+.` to switch modes if needed)
```

---

## Custom Debug Mode Configuration

For the `/debug` command, users can set up a custom Debug mode in Cursor:

**Settings Path:** `Cursor Settings` → `Chat` → `Custom Modes`

**Configuration:**
```
Name: Debug
Tools: All Search, Terminal, Edit & Reapply
Instructions: Investigate issues thoroughly before proposing fixes. 
              Always gather evidence first. Present findings before solutions.
```

---

## Mode Capabilities Matrix

| Capability | Agent | Ask | Plan | Debug (Custom) |
|------------|-------|-----|------|----------------|
| Read files | ✅ | ✅ | ✅ | ✅ |
| Search codebase | ✅ | ✅ | ✅ | ✅ |
| Edit files | ✅ | ❌ | ❌ | ✅ |
| Run terminal commands | ✅ | ❌ | ✅ | ✅ |
| Create new files | ✅ | ❌ | ❌ | ✅ |
| Multi-file edits | ✅ | ❌ | ❌ | ✅ |
| Auto-fix errors | ✅ | ❌ | ❌ | ✅ |

---

## Cursor 2.1+ Features for SDD

### Interactive Question UI
- Questions appear in interactive interface
- Answer directly for faster workflow
- Used in all SDD planning commands

### Plan Search (⌘+F)
- Search within generated plans
- Useful for large `/sdd-full-plan` outputs
- Find specific sections quickly

### AI Code Reviews
- Automatic review after `/implement`
- Issues appear in sidepanel
- Fix bugs directly in editor

### Instant Grep
- All codebase searches are instant
- Faster `/research` command
- Multiple parallel searches

### Multi-Agents (8 Parallel)
- Execute multiple `/execute-task` commands simultaneously
- Each agent has isolated copy
- No file conflicts

### Background Planning
- Create plans while working
- Useful for complex `/sdd-full-plan`
- Compare multiple plan options

---

## Best Practices

### 1. Match Mode to Command

Always use the recommended mode for each SDD command. Using the wrong mode can lead to:
- Accidentally modifying files during planning
- Being unable to create files during implementation
- Confusion about what actions are allowed

### 2. Stay in Mode

Don't switch modes mid-command unless necessary. Complete the current workflow, then switch.

### 3. Use Ask Mode for Research

When running `/research`, Ask mode prevents accidental changes while exploring the codebase.

### 4. Use Agent Mode for Implementation

When running `/implement`, Agent mode enables full autonomous capabilities for multi-file changes.

---

*Reference this guide when setting up SDD workflows*
