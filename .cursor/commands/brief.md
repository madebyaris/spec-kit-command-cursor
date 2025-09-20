# /brief Command

Create a lightweight, single-document feature brief optimized for rapid development.

## Usage
```
/brief [task-id] [feature-description]
```

## Purpose
Generate a comprehensive but concise feature brief that balances planning with agility. Designed to be completed in ~30 minutes before coding begins.

## Process
1. Create single `feature-brief.md` in task directory
2. Include minimal but essential context:
   - Quick problem/user/success definition
   - 15-minute research for existing patterns
   - Essential requirements only
   - High-level implementation approach
   - Immediate next actions
3. Treat as living document that evolves during implementation
4. Focus on "just enough" planning to start coding confidently

## Example
```
/brief checkout-flow Streamlined one-page checkout with guest option
```

## Philosophy
- **30 minutes planning** → Start coding
- **Single document** instead of 5 separate files
- **Living document** that updates during development
- **Agile-compatible** with iterative refinement

## Output
Creates: `specs/active/[task-id]/feature-brief.md`
