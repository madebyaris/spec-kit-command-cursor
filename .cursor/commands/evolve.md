# /evolve Command

Update existing feature briefs based on implementation discoveries and changes.

## Usage
```
/evolve [task-id] [discovery-or-change]
```

## Purpose
Keep feature briefs aligned with reality during development. Addresses the "outdated specifications" problem by making updates lightweight and continuous.

## Process
1. Read existing feature-brief.md
2. Incorporate new discoveries, requirements changes, or technical decisions
3. Update relevant sections while preserving context
4. Add changelog entry with reasoning
5. Maintain brief, actionable format

## Example
```
/evolve checkout-flow Changed from Stripe to PayPal based on user feedback
```

## Philosophy
- **Specifications as living documents**
- **Continuous alignment** with implementation
- **Lightweight updates** during development
- **Change tracking** for team awareness

## Output
Updates: `specs/active/[task-id]/feature-brief.md` with changelog
