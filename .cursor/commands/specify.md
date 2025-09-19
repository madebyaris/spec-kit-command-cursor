# /specify Command

Create a detailed feature specification based on user requirements.

## Usage
```
/specify [feature-name] [description]
```

## Purpose
Transform feature ideas into detailed, testable requirements focusing on the "what" and "why" before implementation.

## Process
1. Create feature directory in `specs/active/feat-XXX-[name]/`
2. Generate `spec.md` using template with:
   - Problem statement and user needs
   - Functional and non-functional requirements  
   - User stories with acceptance criteria
   - Success metrics and edge cases
3. Prompt for clarification on vague requirements
4. Ensure specifications are testable and measurable
5. Update project index

## Example
```
/specify photo-organizer Build an application that helps users organize photos into albums with drag-and-drop functionality
```

## Implementation Rules
- Always ask clarifying questions if description is vague
- Focus on "what" and "why", not "how"
- Create measurable acceptance criteria
- Consider edge cases and error scenarios
- Include user personas and use cases
- Define success metrics and KPIs

## Output
Creates: `specs/active/feat-XXX-[name]/spec.md`
