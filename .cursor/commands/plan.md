# /plan Command

Generate technical implementation plan based on existing specification.

## Usage
```
/plan [feature-name]
```

## Prerequisites
- Must have existing `spec.md` file in feature directory
- Feature must exist in `specs/active/feat-XXX-[name]/` or `specs/active/[task-id]/`

## Purpose
Convert specifications into detailed technical implementation strategy, translating "what" into "how".

---

## PLAN Mode Workflow

This command follows a **plan-approve-execute** pattern for meta-planning - planning how to plan the implementation!

### Phase 1: Analysis (Readonly)

**Analyze before planning:**
1. **Read existing spec.md** - Understand all requirements
2. **Review research.md** - Check if research exists for technical context
3. **Scan existing codebase** - Identify patterns, architecture, tech stack
4. **Identify technical challenges** - Note complex requirements
5. **Check project constraints** - Review existing architecture decisions

**Ask clarifying questions if needed:**
- Are there preferred technologies or frameworks in this project?
- What are the scalability requirements?
- Are there specific security or compliance requirements?
- What's the deployment environment (cloud, on-prem, etc.)?
- Are there existing services or APIs to integrate with?
- What are the performance requirements and constraints?
- Are there budget or timeline constraints affecting tech choices?

**Note (Cursor 2.1+):** 
- Questions appear in interactive UI - answer directly for faster workflow
- **Background Planning:** For complex projects, you can create plan in background and continue working
- **Plan Search:** Use ⌘+F to search within generated plans

**Read relevant files:**
- Existing `specs/active/[task-id]/spec.md` (required)
- Existing `specs/active/[task-id]/research.md` (if available)
- Similar plans in `specs/active/*/plan.md` for consistency
- Project overview at `specs/00-overview.md`
- Templates at `.sdd/templates/plan-template.md`
- Existing codebase architecture and patterns

### Phase 2: Planning (Create Plan Tool)

**Present a detailed plan showing:**

1. **What will be created:**
   - File path: `specs/active/[task-id]/plan.md`

2. **Technical plan structure outline:**
   - **Architecture Overview:**
     - System components and their interactions
     - Design patterns to use
     - Architecture diagram description
   - **Technology Stack:**
     - Languages and frameworks (with justification)
     - Libraries and dependencies
     - Why these choices fit requirements
   - **Data Model:**
     - Database schema (tables/collections)
     - Data relationships and constraints
     - Data flow and storage strategy
   - **API Design:**
     - Endpoint specifications
     - Request/response contracts
     - Authentication and authorization
   - **Security Considerations:**
     - Authentication/authorization approach
     - Data protection strategies
     - Security best practices
   - **Performance Strategy:**
     - Optimization approaches
     - Caching strategies
     - Scalability considerations
   - **Testing Approach:**
     - Unit, integration, e2e testing strategy
     - Test coverage goals
   - **Deployment Plan:**
     - Environment setup
     - CI/CD considerations

3. **Technical decisions:**
   - Key technology choices (preview of 2-3)
   - Architecture patterns selected
   - Why these fit the requirements

4. **Reasoning:**
   - How this plan addresses all spec requirements
   - How it fits existing project architecture
   - What makes this approach maintainable and scalable
   - Trade-offs and alternatives considered

**The plan should show:**
- Clear technical direction
- How requirements map to architecture
- Why specific technologies are chosen

### Phase 3: Execution (After Approval)

**Once plan is approved, execute:**

1. **Generate plan.md using template:**
   - Use `.sdd/templates/plan-template.md` or `plan-compact.md`
   - Fill in all sections comprehensively

2. **Architecture section:**
   - Component diagram or description
   - Design patterns and why they're used
   - How components interact
   - Clear separation of concerns

3. **Technology stack section:**
   - List each technology with justification
   - Version specifications
   - Why it's the best fit for requirements
   - Alternatives considered

4. **Data model section:**
   - Complete database schema
   - Entity relationships
   - Indexes and constraints
   - Data validation rules

5. **API contracts section:**
   - Endpoint definitions
   - Request/response formats
   - Error handling
   - Authentication requirements

6. **Security & performance sections:**
   - Specific strategies for each requirement
   - Implementation approaches
   - Monitoring and validation

7. **Testing & deployment sections:**
   - Concrete testing approach
   - Deployment workflow
   - Rollback strategies

8. **Ensure quality:**
   - All spec requirements addressed
   - Technical decisions justified
   - Clear implementation path
   - Consideration of edge cases from spec

### Phase 4: Documentation

**Finalize planning:**
- Ensure alignment with specification
- Note dependencies for task breakdown
- Flag any requirement gaps discovered
- Set up for `/tasks` phase

---

## Example
```
/plan photo-organizer
```

## Implementation Rules
- **Reference existing specification** - don't create new requirements
- **Justify technology choices** based on project constraints
- **Design for scalability** and maintainability
- **Consider security implications** at each layer
- **Define clear interfaces** and contracts
- **Plan for testing** and deployment

## Output
Creates: `specs/active/feat-XXX-[name]/plan.md` or `specs/active/[task-id]/plan.md`

## Notes for AI Assistants

- **Always present a plan first** showing planning approach (meta!)
- **Use interactive question UI (Cursor 2.1+)** for clarifying questions
- **Read spec thoroughly** - every requirement must be addressed
- **Search codebase** for existing patterns to follow (Instant Grep makes this fast!)
- **Justify all tech decisions** - no assumptions without reasoning
- **Wait for approval** before creating plan file
- **Be comprehensive** - this guides all implementation
- **Stay consistent** with existing project architecture
- **Note plan search** - Users can ⌘+F to search within planning documents
