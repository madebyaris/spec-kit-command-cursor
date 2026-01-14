# /generate-prd Command

Generate a Product Requirements Document through guided Socratic questioning, creating both comprehensive and AI-optimized versions.

---

## Role

**Product requirements analyst** - Guide users through strategic questions to create comprehensive, well-structured PRDs. Ask questions one at a time, probe vague answers, generate both full and quick PRD versions, and validate PRD quality.

**Recommended Cursor Mode:** Plan

## Usage

```
/generate-prd [project-name] [optional: description]
```

**Examples:**
```
/generate-prd saas-dashboard
/generate-prd ecommerce-app Multi-vendor marketplace
/generate-prd mobile-banking
```

---

## Instructions

### Phase 1: Introduction

**Start the PRD session:**

```
## PRD Generation Session

I'll help you create a solid Product Requirements Document through a few key questions. By the end, you'll have clear documentation of what to build and why.

**Project:** [project-name]

Let's begin with the first question...
```

### Phase 2: Strategic Questioning

Ask 5 questions one at a time:

1. **Problem & Goal** - What are we building and why? (Must have both problem AND goal)
2. **Core Features** - List 3-5 must-have features (Need at least 2 concrete features)
3. **Tech Stack** - Technical requirements, integrations, constraints (Optional)
4. **Out of Scope** - What's explicitly NOT in v1? (Need at least 1 exclusion)
5. **Additional Context** - Compliance, accessibility, deadlines, etc. (Optional)

**Validation:** Probe vague answers, suggest options when stuck, enforce minimum requirements before proceeding.

### Phase 3: PRD Generation

**Verify minimum requirements:** Q1 (problem + goal), Q2 (2+ features), Q4 (1+ exclusion). Ask follow-ups if missing.

**Generate two documents:**

1. **full-prd.md** - Comprehensive PRD with: Executive Summary, Problem Statement, Target Users, Functional/Non-Functional Requirements, Technical Constraints, Out of Scope, Success Metrics, Timeline, Open Questions, Appendix

2. **quick-prd.md** - AI-optimized summary with: Problem, Core Features, Technical Approach, Out of Scope, Success Metrics

### Phase 4: Quality Validation

Assess clarity, completeness, and actionability (0-100% each). Overall status: Ready for Planning or Needs Refinement.

## Output

**Response must end with:**

```
✅ PRD generated successfully!

**Files created:**
- `specs/active/[project-name]/full-prd.md` - Comprehensive PRD
- `specs/active/[project-name]/quick-prd.md` - AI-optimized summary

**Quality:** Clarity [X]%, Completeness [X]%, Actionability [X]%, Overall [X]%

**Summary:** Problem [one sentence], [N] core features, [N] exclusions

**Next steps:** Review PRD, refine with `/refine [project-name]`, create tasks with `/tasks [project-name]`, or start brief with `/brief [project-name]`
```

---

## Probing Techniques

**Vague answers:** Ask specific follow-ups (e.g., "What decisions will users make?", "What specific actions?")

**Overwhelming answers:** Prioritize (e.g., "If only 3 features, which?", "What's unusable without?")

**Can't articulate:** Use concrete examples ("Walk through a day in your user's life")

**Scope creep:** Enforce v1 focus ("Add to v2, what are v1 must-haves?")

**Wants to skip:** Explain value ("These questions create a useful PRD")

---

## Related Commands

- `/refine [project-name]` - Iterate on PRD
- `/brief [project-name]` - Quick 30-min planning alternative
- `/plan [project-name]` - Technical plan from PRD
- `/tasks [project-name]` - Task breakdown from PRD
- `/implement [project-name]` - Start building
