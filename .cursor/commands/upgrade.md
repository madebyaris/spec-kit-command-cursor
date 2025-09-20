# /upgrade Command

Convert a lightweight feature brief to full SDD 2.0 workflow when complexity is discovered.

## Usage
```
/upgrade [task-id] [reason-for-upgrade]
```

## Purpose
When a feature brief reveals more complexity than expected, seamlessly transition to comprehensive SDD 2.0 planning without losing existing work.

## Process
1. Read existing feature-brief.md
2. Extract and expand context into separate documents:
   - Research findings → research.md
   - Requirements → spec.md  
   - Implementation approach → plan.md
   - Next actions → tasks.md
3. Preserve all existing decisions and context
4. Add comprehensive sections for complex feature planning
5. Update project tracking to reflect full SDD workflow

## Example
```
/upgrade checkout-flow Discovered PCI compliance requirements and multi-payment provider integration needs
```

## When to Upgrade
**Upgrade triggers:**
- Compliance/security requirements discovered
- Multiple team coordination needed
- Architectural changes required
- Stakeholder alignment issues
- Technical approach uncertainty
- Timeline extends beyond 2 weeks

## Philosophy
- **Preserve existing work** from brief
- **Seamless transition** to comprehensive planning
- **No rework** - build upon brief foundation
- **Clear escalation path** when complexity emerges

## Output
- Converts: `feature-brief.md` → full SDD 2.0 document suite
- Maintains: All existing decisions and context
- Adds: Comprehensive planning for complex scenarios
