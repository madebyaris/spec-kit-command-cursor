# SDD Cursor Commands

A comprehensive **Spec-Driven Development (SDD)** toolkit for Cursor IDE that provides structured commands for feature specification, planning, and task breakdown.

## 🎯 What is Spec-Driven Development?

Spec-Driven Development is a methodology that emphasizes creating detailed, executable specifications before writing code. This approach ensures that:

- **Requirements are clear** before implementation begins
- **Technical decisions are well-planned** and documented
- **Development tasks are structured** and manageable
- **Team collaboration** is enhanced through shared understanding

## 🚀 Quick Start

### 1. Install the System
Clone or download this repository to your project:
```bash
git clone <repo-url>
cd spec-kit-command-cursor
```

### 2. Configure Cursor
The `.cursor/commands/*.md` files contain the SDD command definitions, and `.cursor/rules/*.mdc` provides minimal system context. Cursor will automatically recognize these commands when you open the project.

### 3. Use the Commands
Start with any feature idea and follow the SDD workflow:

```bash
# Step 1: Create specification
/specify user-authentication Implement JWT-based authentication system with login/logout

# Step 2: Generate technical plan  
/plan user-authentication

# Step 3: Break down into tasks
/tasks user-authentication
```

## 📋 The Three Core Commands

### `/specify` - Create Feature Specifications

**Purpose:** Transform feature ideas into detailed, testable requirements.

**Usage:**
```
/specify <feature-name> <description>
```

**Example:**
```
/specify photo-gallery Build a responsive photo gallery with upload, tagging, and search functionality
```

**What it creates:**
- `specs/active/feat-XXX-photo-gallery/spec.md`
- Comprehensive requirements document
- User stories with acceptance criteria
- Success metrics and edge cases

### `/plan` - Generate Technical Plans

**Purpose:** Convert specifications into detailed technical implementation strategy.

**Usage:**
```
/plan <feature-name>
```

**Prerequisites:** Must have existing `spec.md` file

**Example:**
```
/plan photo-gallery
```

**What it creates:**
- `plan.md` with system architecture
- Technology stack recommendations
- Database schema and API contracts
- Security and performance considerations

### `/tasks` - Create Implementation Tasks

**Purpose:** Break down technical plans into actionable development tasks.

**Usage:**
```
/tasks <feature-name>
```

**Prerequisites:** Must have existing `plan.md` file

**Example:**
```
/tasks photo-gallery
```

**What it creates:**
- `tasks.md` with prioritized task breakdown
- Implementation phases and dependencies
- Effort estimates and success criteria
- Progress tracking template

## 📁 Project Structure

```
your-project/
├── .sdd/                          # SDD system configuration
│   ├── config.json                # Settings and preferences
│   ├── guidelines.md              # Development process guide
│   ├── templates/                 # Document templates
│   │   ├── spec-template.md
│   │   ├── plan-template.md
│   │   └── tasks-template.md
│   └── utils.js                   # Helper utilities (optional)
├── specs/                         # All feature specifications
│   ├── 00-overview.md            # Project overview
│   ├── index.md                  # Feature status dashboard
│   ├── active/                   # Features in development
│   │   ├── feat-001-user-auth/
│   │   │   ├── spec.md          # Requirements
│   │   │   ├── plan.md          # Technical plan
│   │   │   ├── tasks.md         # Implementation tasks
│   │   │   └── progress.md      # Development tracking
│   │   └── feat-002-photo-gallery/
│   ├── completed/                # Delivered features
│   └── backlog/                  # Future features
├── src/                          # Your actual code
├── .cursor/                      # Cursor configuration
│   ├── commands/                 # Command definitions
│   │   ├── specify.md            # /specify command
│   │   ├── plan.md               # /plan command
│   │   └── tasks.md              # /tasks command
│   └── rules/                    # Minimal system rules
│       └── sdd-system.mdc        # SDD overview (token-efficient)
└── README.md                     # This file
```

## 🔧 Configuration

### Customizing Templates

Edit templates in `.sdd/templates/` to match your project needs:

```markdown
# Example customization in spec-template.md
## Project-Specific Section
- **Team Lead**: {{TEAM_LEAD}}
- **Sprint**: {{CURRENT_SPRINT}}
- **Epic**: {{EPIC_REFERENCE}}
```

### Adjusting Settings

Modify `.sdd/config.json` for your workflow:

```json
{
  "settings": {
    "defaultFeaturePrefix": "feat-",
    "autoNumberFeatures": true,
    "requireReviews": true,
    "collaborationMode": true
  },
  "workflow": {
    "phases": ["specify", "plan", "tasks", "implement", "review", "complete"]
  }
}
```

## 🎯 Example Workflow

Here's a complete example of using SDD for a new feature:

### 1. Start with an idea
"I want to add a user rating system to my app"

### 2. Create the specification
```
/specify user-ratings Allow users to rate items on 1-5 scale with optional comments and display average ratings
```

This creates:
```
specs/active/feat-003-user-ratings/spec.md
```

### 3. Generate the technical plan
```
/plan user-ratings
```

This creates:
```
specs/active/feat-003-user-ratings/plan.md
```

### 4. Break down into tasks
```
/tasks user-ratings
```

This creates:
```
specs/active/feat-003-user-ratings/tasks.md
```

### 5. Start development
Follow the tasks in priority order, updating `progress.md` as you go.

## 💡 Best Practices

### For Specifications (`/specify`)
- **Be specific** about user needs and business value
- **Include edge cases** and error scenarios
- **Define measurable** success criteria
- **Think user-first**, not implementation-first

### For Plans (`/plan`)
- **Justify technology choices** based on requirements
- **Consider scalability** and future growth
- **Address security** and performance early
- **Plan for testing** and deployment

### For Tasks (`/tasks`)
- **Keep tasks small** (1-2 days max)
- **Define clear dependencies** between tasks
- **Include testing tasks** for each feature
- **Estimate effort realistically**

## 🤝 Team Collaboration

### Multi-Developer Workflow
1. **Assign ownership** of specs, plans, and tasks
2. **Use progress.md** for status updates
3. **Review and iterate** on specifications
4. **Track dependencies** between features

### Status Tracking
Update feature status in `progress.md`:
```markdown
## Current Status: In Progress
- [x] Database schema design
- [x] API endpoints
- [ ] Frontend components (50% complete)
- [ ] Testing suite
```

### Code Reviews
Use `reviews.md` to track review feedback:
```markdown
## Review Comments
- Security: Add input validation (Fixed ✅)
- Performance: Optimize database queries (In Progress)
- UI: Improve mobile responsiveness (Pending)
```

## 🔍 Troubleshooting

### Common Issues

**"Feature not found" error:**
- Check feature name spelling
- Ensure feature exists in `specs/active/`

**"Missing dependencies" error:**
- Run commands in order: `/specify` → `/plan` → `/tasks`
- Check that required files exist

**Template processing errors:**
- Verify template files exist in `.sdd/templates/`
- Check template syntax for variables

### Getting Help

1. **Check guidelines**: Read `.sdd/guidelines.md`
2. **Review examples**: Look at existing features in `specs/active/`
3. **Validate structure**: Ensure directory structure matches expected format

## 📚 Advanced Usage

### Custom Commands
Extend the system by adding new command files to `.cursor/commands/`:

```markdown
# /review Command

Generate code review checklist based on specifications.

## Usage
```
/review [feature-name]
```

## Purpose
Create comprehensive code review checklist based on feature specification and plan.
```

### Integration with Tools
- **Git hooks**: Automatically update status on commits
- **CI/CD**: Validate implementations against specifications
- **Project management**: Sync with Jira, Linear, etc.

### Analytics
Track your SDD usage:
- Time savings from better planning
- Reduction in scope changes
- Quality improvements through structured approach

## 🎉 Benefits

After implementing SDD in your workflow, you should see:

- **20% reduction** in development time
- **Fewer scope changes** during implementation
- **Better code quality** through upfront planning
- **Improved team communication** via shared specs
- **Clearer project visibility** for stakeholders

---

## 📝 Contributing

Contributions welcome! Please read the contribution guidelines and submit pull requests for improvements.

## 📄 License

MIT License - see LICENSE file for details.

---

**Ready to get started?** Try your first specification:
```
/specify hello-world Create a simple hello world feature to test the SDD workflow
```
