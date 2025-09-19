# /plan Command

Generate technical implementation plan based on existing specification.

## Usage
```
/plan [feature-name]
```

## Prerequisites
- Must have existing `spec.md` file in feature directory
- Feature must exist in `specs/active/feat-XXX-[name]/`

## Purpose
Convert specifications into detailed technical implementation strategy, translating "what" into "how".

## Process
1. Read existing `spec.md` from feature directory
2. Generate `plan.md` using template with:
   - System architecture and component design
   - Technology stack selection with justification
   - Database schema and API contracts
   - Security and performance considerations
   - Integration points and dependencies
3. Consider existing project constraints and patterns
4. Ensure plan aligns with specification requirements

## Example
```
/plan photo-organizer
```

## Implementation Rules
- Reference existing specification - don't create new requirements
- Justify technology choices based on project constraints
- Design for scalability and maintainability
- Consider security implications at each layer
- Define clear interfaces and contracts
- Plan for testing and deployment

## Output
Creates: `specs/active/feat-XXX-[name]/plan.md`
