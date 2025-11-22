# PLAN Mode Examples

This document demonstrates typical PLAN mode interactions for each SDD command, showing the plan-approve-execute workflow in action.

## Overview

Every SDD command now follows this pattern:
```
User Command → Analysis → Create Plan → User Approval → Execute → Document
```

These examples show what you can expect when using each command with PLAN mode enabled.

### Cursor 2.1 Enhancements

**Interactive Question UI:**
- Questions now appear in an interactive interface
- Answer directly in the UI for faster workflow
- Skip questions if information is already clear

**Plan Search (⌘+F):**
- Search within generated plans using ⌘+F
- Quickly find specific sections or keywords
- Navigate large plans efficiently

**AI Code Reviews:**
- Automatic code review after implementation
- Issues appear in sidepanel
- Fix bugs directly in editor

---

## Example 1: `/brief` - Feature Brief Creation

### Scenario
Creating a quick feature brief for user profile customization.

### User Command
```
/brief user-profile-custom Allow users to customize profile with avatar and bio
```

### AI Analysis Phase
```
Analyzing request...
- Checking existing user profile implementations
- Identifying requirements gaps
- Assessing if brief is appropriate complexity

Questions for you:
1. Should avatar support file upload or selection from library?
2. Are there character limits for bio text?
3. Should this include privacy settings?
```

### User Response
```
1. File upload only (jpg, png)
2. Yes, 500 character limit
3. No, privacy settings are separate feature
```

### AI Plan Presentation
```
Plan for /brief user-profile-custom

**What will be created:**
- File: specs/active/user-profile-custom/feature-brief.md

**Brief Structure:**
1. Problem Statement
   - Users want to personalize their profiles
   - Target: All registered users
   
2. Quick Research (15 min)
   - Examine existing user profile code
   - Check for file upload patterns
   - Review validation patterns
   
3. Core Requirements
   - Avatar upload (jpg/png, max 5MB)
   - Bio text field (500 char max)
   - Preview before save
   - Validation and error handling
   
4. Implementation Approach
   - Use existing file upload service
   - Add new profile customization component
   - Integrate with user settings page
   
5. Next Actions
   - Set up file upload endpoint
   - Create profile edit form
   - Implement validation

**Estimated planning time:** 30 minutes

Approve this plan?
```

### User Approval
```
Approved. Proceed.
```

### AI Execution
```
Creating feature brief...
✓ Created specs/active/user-profile-custom/
✓ Researched existing patterns (found FileUploadService)
✓ Generated feature-brief.md
✓ Updated specs/index.md

Result: Feature brief ready for development!
```

---

## Example 2: `/evolve` - Living Documentation Update

### Scenario
Updating existing brief based on discovery during implementation.

### User Command
```
/evolve checkout-flow Discovered we need to handle international addresses with different formats
```

### AI Analysis Phase
```
Analyzing change request...
- Reading current feature-brief.md
- Understanding scope of change
- Assessing impact on existing implementation

This change affects:
- Requirements section (address handling)
- Implementation approach (validation logic)
- Next actions (add internationalization)

Question: Should we support all countries or start with top 5 markets?
```

### User Response
```
Start with US, UK, Canada, Australia, Germany
```

### AI Plan Presentation
```
Plan for /evolve checkout-flow

**What will be updated:**
- File: specs/active/checkout-flow/feature-brief.md

**Proposed Changes:**

BEFORE (Requirements section):
```
- Collect shipping address (single format)
- Validate address fields
```

AFTER (Requirements section):
```
- Collect shipping address (multi-format support)
  - US: ZIP code, State dropdown
  - UK: Postcode, County optional
  - Canada: Postal code, Province dropdown
  - Australia: Postcode, State dropdown
  - Germany: PLZ, State (Bundesland) dropdown
- Validate address fields per country format
- Auto-detect country from IP or allow manual selection
```

**Changelog Entry:**
```markdown
### 2024-01-15 - International Address Support
**Change:** Added multi-country address format support
**Reason:** Discovered need for international shipping during implementation
**Impact:** Requires country-specific validation and format handling
**Markets:** US, UK, Canada, Australia, Germany (phase 1)
```

**Recommendation:** Consider upgrading to full SDD if this grows to 10+ countries

Approve these changes?
```

### User Approval
```
Looks good, but also note that we'll need currency conversion in future
```

### AI Execution
```
Updating feature brief...
✓ Updated Requirements section
✓ Updated Implementation Approach with i18n notes
✓ Added changelog entry
✓ Added note about future currency conversion need

Result: Feature brief updated and aligned with implementation!
```

---

## Example 3: `/research` - Pattern Investigation

### Scenario
Researching authentication patterns before specification.

### User Command
```
/research auth-system JWT authentication with session management
```

### AI Analysis Phase
```
Analyzing research scope...
- Checking for existing authentication code
- Identifying related features
- Determining research depth

Questions:
1. Should research focus on internal patterns or also external libraries?
2. Are there specific security requirements (2FA, SSO, etc.)?
3. Timeline for research (quick 30min or deep 2hr dive)?
```

### User Response
```
1. Both internal and external
2. Basic auth first, 2FA in phase 2
3. Deep dive - this is critical infrastructure
```

### AI Plan Presentation
```
Plan for /research auth-system

**What will be created:**
- File: specs/active/auth-system/research.md

**Research Strategy:**

1. Internal Codebase Analysis (60 min)
   - Search for existing auth patterns: `AuthService`, `TokenManager`
   - Examine session handling: `SessionStore`, middleware
   - Review security practices: password hashing, token storage
   - Files to examine:
     * src/services/auth/*.js
     * src/middleware/authentication.js
     * src/utils/crypto.js

2. External Solutions Research (45 min)
   - JWT libraries: jsonwebtoken vs jose
   - Session stores: Redis vs in-memory vs database
   - Industry best practices: OWASP guidelines
   - Similar implementations: Auth0 patterns, Firebase Auth

3. Security Analysis (30 min)
   - Token expiration strategies
   - Refresh token patterns
   - XSS/CSRF protections
   - Rate limiting approaches

**Research Document Structure:**
- Executive Summary
- Internal Pattern Analysis (with code examples)
- External Solutions Comparison
- Security Considerations
- Recommended Approach with Pros/Cons
- Open Questions for Specification

**Expected Findings:**
- Existing crypto utilities to leverage
- Pattern recommendations for token management
- Security best practices to follow
- Decision points for spec phase

Approve research plan?
```

### User Approval
```
Perfect! Proceed.
```

### AI Execution
```
Conducting research...
✓ Searched codebase for auth patterns (found 12 relevant files)
✓ Analyzed existing CryptoService
✓ Researched JWT libraries (documented 3 options)
✓ Reviewed security best practices
✓ Created comprehensive research.md

Key Findings:
- Can leverage existing CryptoService for password hashing
- Recommend jsonwebtoken (already in use elsewhere)
- Redis recommended for session store (already available)
- Found excellent middleware pattern to follow

Result: Research complete! Ready for /specify phase.
```

---

## Example 4: `/implement` - Systematic Implementation

### Scenario
Executing implementation based on existing plan.

### User Command
```
/implement user-notifications
```

### AI Analysis Phase
```
Analyzing implementation scope...
- Reading plan.md, spec.md, tasks.md
- Identifying existing patterns to follow
- Checking for reusable components

Found:
- Comprehensive plan with architecture
- 23 tasks defined in tasks.md
- Existing NotificationService to extend
- WebSocket setup already available

Questions:
1. Should we implement all notification types or start with email only?
2. Any specific tasks to prioritize?
```

### User Response
```
1. Start with email, then in-app notifications
2. Focus on backend first, frontend can wait
```

### AI Plan Presentation
```
Plan for /implement user-notifications

**What will be created:**
1. File: specs/active/user-notifications/todo-list.md
2. Code implementation across multiple files
3. Progress tracking in progress.md

**Implementation Strategy:**

Phase 1: Backend Foundation (Priority)
- [ ] Extend NotificationService for email (3h)
- [ ] Create notification templates system (2h)
- [ ] Implement email queue with retry logic (3h)
- [ ] Add notification preferences model (2h)
- [ ] Create notification API endpoints (3h)

Phase 2: In-App Notifications
- [ ] Add in-app notification model (2h)
- [ ] Create notification WebSocket handler (3h)
- [ ] Implement notification persistence (2h)
- [ ] Add read/unread tracking (2h)

Phase 3: Frontend (Deferred)
- [ ] Notification bell component
- [ ] Notification list UI
- [ ] Preferences settings page

Phase 4: Testing & Polish
- [ ] Unit tests for NotificationService
- [ ] Integration tests for API endpoints
- [ ] E2E tests for email flow

**Pattern Reuse:**
- Will follow existing EmailService pattern
- Use existing job queue infrastructure
- Leverage template system from reports feature

**Execution Order:**
Backend-first approach, focusing on email notifications with proper queueing and reliability.

**Success Criteria:**
- All Phase 1 todos completed
- Email notifications sending reliably
- API endpoints documented and tested
- Ready for frontend integration

Approve implementation plan?
```

### User Approval
```
Great plan! Let's go.
```

### AI Execution
```
Creating todo-list and beginning implementation...

✓ Created todo-list.md with 15 detailed todos
✓ Created progress.md for tracking

Starting Phase 1 implementation...

[x] Extended NotificationService with email support (3h)
    - Added sendEmail method
    - Integrated with existing EmailService
    - Added error handling and retry logic
    
[x] Created notification templates system (2h)
    - Created templates/ directory
    - Implemented template engine integration
    - Added 5 default templates
    
[x] Implemented email queue with retry logic (3h)
    - Used existing Bull queue
    - Added exponential backoff
    - Implemented dead letter queue
    
... (continues systematically through all todos)

Phase 1 Complete! Backend email notifications functional.
Progress: 5/15 todos complete, Phase 2 next.
```

---

## Example 5: `/upgrade` - Escalating Complexity

### Scenario
Converting a brief to full SDD when complexity is discovered.

### User Command
```
/upgrade payment-integration Discovered PCI compliance requirements and need for multiple payment providers
```

### AI Analysis Phase
```
Analyzing upgrade trigger...
- Reading existing feature-brief.md
- Understanding compliance requirements
- Assessing new complexity level

Current brief covers:
- Basic payment processing
- Single provider (Stripe)
- Simple checkout flow

New requirements add:
- PCI compliance considerations
- Multi-provider support (Stripe + PayPal + Apple Pay)
- Payment method storage
- Refund/chargeback handling
- Compliance documentation

This complexity justifies full SDD 2.0 workflow.

Questions:
1. What compliance level needed? (SAQ A, SAQ A-EP, etc.)
2. Timeline for full implementation?
3. Team size (affects task breakdown)?
```

### User Response
```
1. SAQ A-EP (we'll handle card data temporarily)
2. 8-week implementation
3. 3 developers + 1 security consultant
```

### AI Plan Presentation
```
Plan for /upgrade payment-integration

**What will be created:**
- Keep: feature-brief.md (renamed to feature-brief-v1.md)
- Create: research.md - Payment provider comparison and PCI requirements
- Create: spec.md - Comprehensive requirements with compliance
- Create: plan.md - Architecture with security considerations
- Create: tasks.md - Detailed 8-week task breakdown

**Content Mapping:**

FROM feature-brief.md:
- Problem/Users → spec.md Problem Statement (expanded)
- Requirements → spec.md Functional Requirements (detailed with FR-IDs)
- Implementation notes → plan.md Architecture (comprehensive)
- Next actions → tasks.md Phase 1 tasks (detailed)

NEW CONTENT TO ADD:

**research.md will include:**
- Stripe vs PayPal vs Apple Pay comparison
- PCI compliance requirement analysis
- Security best practices research
- Industry standards review
- Recommendations with justification

**spec.md will include:**
- Compliance requirements (PCI SAQ A-EP)
- Multi-provider requirements
- Security requirements (encryption, tokenization)
- Detailed user stories with security considerations
- Edge cases (failed payments, refunds, disputes)
- Success metrics and KPIs

**plan.md will include:**
- Secure architecture with PCI compliance
- Payment provider abstraction layer
- Tokenization strategy
- Data flow with security controls
- API design with authentication
- Security testing approach
- Compliance documentation plan

**tasks.md will include:**
- 8-week breakdown into phases
- Security review tasks
- Compliance documentation tasks
- Multi-developer task allocation
- Testing including security testing
- Deployment with security hardening

**Upgrade Justification:**
- Compliance requirements demand comprehensive planning
- Multi-provider support adds architectural complexity
- Security implications require detailed analysis
- 3-developer team needs detailed coordination
- 8-week timeline requires structured approach

Approve upgrade plan?
```

### User Approval
```
Excellent! This is exactly what we need. Proceed.
```

### AI Execution
```
Upgrading to full SDD 2.0...

✓ Renamed feature-brief.md to feature-brief-v1.md
✓ Created comprehensive research.md
  - Compared 3 payment providers
  - Analyzed PCI compliance requirements
  - Documented security best practices
  
✓ Created detailed spec.md
  - 15 functional requirements (FR-001 to FR-015)
  - 8 non-functional requirements (security, performance)
  - 12 user stories with acceptance criteria
  - Compliance requirements section
  - Comprehensive edge cases
  
✓ Created comprehensive plan.md
  - Secure multi-provider architecture
  - Tokenization and encryption strategy
  - API design with security controls
  - Database schema with security considerations
  - Testing strategy including penetration testing
  
✓ Created detailed tasks.md
  - 8-week breakdown (4 phases)
  - 45 detailed tasks with estimates
  - Task dependencies mapped
  - Team assignments suggested
  - Security review checkpoints

Result: Full SDD 2.0 suite created!
Ready for secure, compliant payment integration development.
```

---

## Key Takeaways

### PLAN Mode Benefits Demonstrated

1. **Visibility**: See what will be created before it happens
2. **Control**: Approve or modify plans before execution
3. **Quality**: More thoughtful, comprehensive planning
4. **Learning**: Understand AI reasoning and approach
5. **Safety**: No surprise file changes

### Tips from Examples

- **Be specific in commands**: More details = better plans
- **Answer clarifying questions**: Helps AI create better plans
- **Review plans carefully**: This is your chance to course-correct
- **Provide feedback**: Plans improve based on your input
- **Trust the process**: Plan-approve-execute ensures quality

### When Plans Need Adjustment

If a plan isn't quite right:
```
AI: "Here's my plan..."
You: "Close, but please also include X and change Y to Z"
AI: "Updated plan with your changes..."
```

The AI will revise and re-present until you're satisfied.

---

## Next Steps

Want to see more examples?
- Try commands in your own project
- Start with `/brief` for quick features
- Use `/research` for exploring patterns
- Experiment with `/evolve` for updates

Questions? Check:
- [Guidelines](.sdd/guidelines.md) - Methodology details
- [Command docs](.cursor/commands/) - Individual command reference
- [System rules](.cursor/rules/sdd-system.mdc) - Philosophy and patterns

