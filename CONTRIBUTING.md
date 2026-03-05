# Contributing to SDD Cursor Commands

Thanks for your interest in contributing! This guide covers how to add commands, subagents, skills, and templates.

## Project Structure

```
.cursor/
├── agents/       # Subagent definitions (.md)
├── commands/     # Slash commands (.md)
├── skills/       # Agent skills (SKILL.md + references/ + scripts/)
├── rules/        # Always-applied rules (.mdc)
├── hooks.json    # Workflow automation
└── sandbox.json  # Network access controls

.sdd/
├── config.json           # Project configuration
├── guidelines.md         # Methodology guide
├── ROADMAP_FORMAT_SPEC.md # Roadmap JSON schema
├── FULL_PLAN_EXAMPLES.md  # Worked examples
└── templates/            # Document templates
```

## Adding a New Command

1. Create `.cursor/commands/your-command.md`
2. Follow the structure of existing commands (role, usage, phases, output)
3. Add the command to the reference table in `.cursor/rules/sdd-system.mdc`
4. If the command uses a subagent, map it in `.cursor/commands/_shared/agent-manual.md`

## Adding a New Subagent

1. Create `.cursor/agents/your-agent.md` with YAML frontmatter:
   ```yaml
   ---
   name: your-agent
   description: What it does
   model: fast | inherit
   is_background: true | false
   ---
   ```
2. Add to the subagent table in `agent-manual.md` and `sdd-system.mdc`
3. Document when to delegate to it in the Delegation Guidelines

## Adding a New Skill

1. Create `.cursor/skills/your-skill/SKILL.md` with YAML frontmatter:
   ```yaml
   ---
   name: your-skill
   description: When to use it
   ---
   ```
2. Add `references/` for on-demand knowledge, `scripts/` for executable helpers, `assets/` for templates
3. Add to the skills table in `agent-manual.md` and `sdd-system.mdc`

## Adding a Template

1. Create `.sdd/templates/your-template.md`
2. Use `{{VARIABLE}}` placeholders for values agents fill in
3. If the template is for a command, add the path to `.sdd/config.json` under `settings.templates`

## Testing Changes

- Run any shell scripts to verify they work: `bash .cursor/skills/sdd-audit/scripts/validate.sh`
- Check that markdown renders correctly
- Verify cross-references between files are accurate

## Guidelines

- Keep agent prompts concise — Cursor 2.5 works best with focused instructions
- Follow the plan-approve-execute pattern for all commands
- Use progressive loading for skills (keep SKILL.md small, put details in references/)
- Update `README.md` when adding user-facing commands

## Reporting Issues

- [GitHub Issues](https://github.com/madebyaris/spec-kit-command-cursor/issues) for bugs
- [GitHub Discussions](https://github.com/madebyaris/spec-kit-command-cursor/discussions) for feature ideas
