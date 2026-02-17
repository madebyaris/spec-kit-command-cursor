# Contributing to SDD Cursor Commands

Thanks for your interest in contributing! This document covers how to add or modify commands, subagents, and skills.

## Adding or Modifying Commands

1. Create or edit a `.md` file in `.cursor/commands/`
2. Follow the structure of existing commands (e.g., `brief.md`, `implement.md`)
3. Include: Role, Usage, Instructions (phases), Output format, Troubleshooting
4. Reference the agent manual: `.cursor/commands/_shared/agent-manual.md`

## Adding or Modifying Subagents

1. Create or edit a `.md` file in `.cursor/agents/`
2. Use frontmatter: `name`, `description`, `model`, `readonly` (optional)
3. Models: `fast` for exploration/verification, `inherit` for complex work
4. See [Cursor docs on subagents](https://cursor.com/docs) for the latest format

## Adding or Modifying Skills

1. Create a folder in `.cursor/skills/` with structure:
   ```
   sdd-[name]/
   ├── SKILL.md       # Core instructions (~50 lines)
   ├── references/    # Loaded on demand
   ├── scripts/       # Executable helpers
   └── assets/        # Templates
   ```
2. Keep SKILL.md focused; put detailed content in `references/`
3. Document when the skill auto-invokes in the skill header

## Testing Changes

- Clone the repo into a test project
- Run commands in Cursor chat to verify behavior
- Check that subagents and skills load correctly
- Ensure `.cursor/rules/sdd-system.mdc` reflects any structural changes

## Submitting Changes

- [Open an issue](https://github.com/madebyaris/spec-kit-command-cursor/issues) for bugs or feature requests
- [Start a discussion](https://github.com/madebyaris/spec-kit-command-cursor/discussions) for ideas
- Submit PRs with clear descriptions of the change
