# /pecut-all-in-one Command

This is an alias for `/sdd-full-plan`. See the full documentation there.

**Supports `--until-finish` flag** for automated execution of the entire project!

---

## Quick Reference

```
/pecut-all-in-one [project-id] [description] [--until-finish]
```

**Examples:**
```
# Create roadmap only (manual execution)
/pecut-all-in-one blog-platform Full-featured blog with CMS
/pecut-all-in-one ecommerce-app Multi-vendor marketplace

# Create roadmap AND execute everything automatically
/pecut-all-in-one blog-platform Full blog with CMS --until-finish
/pecut-all-in-one saas-app Complete SaaS dashboard --until-finish
```

**What it does:**
- Creates comprehensive A-Z project roadmap
- Generates kanban board structure
- Maps tasks to SDD commands
- Creates VSCode-compatible JSON
- **With `--until-finish`:** Executes ALL tasks automatically until complete!

**Full documentation:** See `/sdd-full-plan` command

---

## The `--until-finish` Flag

When you add `--until-finish`:

1. Creates the roadmap as usual
2. **Immediately starts executing all tasks** in order
3. No user intervention needed - fully automated
4. Stops on error for you to fix, then resume
5. Continues until the entire project is complete

**This is "fire and forget" mode** - start it and come back when it's done!

```
/pecut-all-in-one my-project Build a complete app --until-finish
    ↓
Create Roadmap → Execute All Epics → Execute All Tasks → 🎉 Done!
```

---

## State Assertion (REQUIRED)

**Before starting, output:**

```
**SDD MODE: Full Project Planning**
Mode: planning
Purpose: Creating comprehensive A-Z project roadmap with kanban structure
Implementation: BLOCKED - I will plan the entire project, not implement it
```

**With `--until-finish`, after roadmap creation:**

```
**SDD MODE: Automated Execution**
Mode: execution
Purpose: Executing all roadmap tasks automatically
Implementation: AUTHORIZED - Executing tasks sequentially until complete
```

Then follow the `/sdd-full-plan` workflow exactly.
