# PLAN Mode Quick Start Guide

Welcome to the enhanced SDD system with PLAN mode integration! This guide will help you understand and use the new plan-approve-execute workflow.

## What is PLAN Mode?

PLAN mode is an enhanced workflow where AI assistants present plans for your approval **before** executing any file changes. This gives you full control and visibility.

### Cursor 2.1 Improvements

**Interactive Questions:**
- Questions appear in interactive UI (not just text)
- Answer directly in the interface
- Faster workflow

**Plan Search:**
- Use ⌘+F to search within plans
- Find sections quickly
- Navigate large plans easily

**AI Code Reviews:**
- Automatic code review after implementation
- Issues shown in sidepanel
- Fix bugs directly in editor

## The Magic Formula

```
Your Command → AI Analyzes → AI Shows Plan → You Approve → AI Executes
```

**Key Benefit:** You review and approve BEFORE files are created or modified.

## Quick Comparison

### Without PLAN Mode (Old Way)
```bash
You: /brief user-auth Add login feature
AI:  ✓ Created feature-brief.md
You: *Opens file* "Wait, that's not what I wanted..."
```

### With PLAN Mode (New Way)
```bash
You: /brief user-auth Add login feature
AI:  Let me analyze... I have questions:
     - OAuth or traditional login?
     - Password reset needed?
     
You: Traditional login, yes to password reset

AI:  Here's my plan:
     - Will create: specs/active/user-auth/feature-brief.md
     - Structure: Problem, Users, Requirements, Approach
     - Requirements: Login form, password reset, email verification
     - Approve?
     
You: Perfect! Proceed.

AI:  ✓ Created feature-brief.md exactly as planned
```

## The 4 Phases Explained

### Phase 1: Analysis 🔍
**What AI Does:**
- Reads your request
- Checks existing files and patterns
- Identifies missing information
- Asks clarifying questions

**What You Do:**
- Answer questions
- Provide additional context
- Clarify requirements

**No files are modified yet!** ✅

### Phase 2: Planning 📋
**What AI Shows You:**
- What files will be created/modified
- Structure and content preview
- Reasoning and approach
- Expected outcomes

**What You Do:**
- Review the plan carefully
- Request changes if needed
- Approve when satisfied

**Still no files modified!** ✅

### Phase 3: Execution ⚡
**What AI Does:**
- Creates/modifies files as planned
- Follows the approved approach
- Maintains quality standards
- Tracks progress

**What You Do:**
- Watch the execution
- Files are created as you approved

**Now files are created!** 🎉

### Phase 4: Documentation 📝
**What AI Does:**
- Updates tracking files
- Records decisions
- Notes timestamps
- Prepares for next phase

**Result:**
- Complete audit trail
- Clear documentation
- Ready for next step

## Your First PLAN Mode Command

Let's try a simple example:

```bash
/brief hello-sdd Test PLAN mode with a simple hello world feature
```

**What Will Happen:**

1. **AI Analyzes** (5 seconds)
   ```
   Analyzing request...
   - This is a test feature
   - Checking for existing patterns
   ```

2. **AI Asks Questions** (if needed)
   ```
   Questions:
   - What should this hello world feature do exactly?
   - Should it be a CLI command, web page, or API endpoint?
   ```

3. **You Answer**
   ```
   It's just a test - simple web page that says "Hello SDD"
   ```

4. **AI Presents Plan**
   ```
   Plan for /brief hello-sdd
   
   Will create: specs/active/hello-sdd/feature-brief.md
   
   Structure:
   - Problem: Test PLAN mode functionality
   - Users: Developers learning the system
   - Requirements: Simple web page with greeting
   - Approach: Basic HTML page with message
   - Next Actions: Create page, test, document
   
   Approve?
   ```

5. **You Approve**
   ```
   Yes, proceed
   ```

6. **AI Executes**
   ```
   Creating feature brief...
   ✓ Created specs/active/hello-sdd/
   ✓ Created feature-brief.md
   ✓ Updated specs/index.md
   
   Done! Feature brief ready.
   ```

## Common Scenarios

### Scenario 1: AI Asks Good Questions

```bash
You: /brief checkout-flow Quick checkout process
AI:  Questions:
     1. Guest checkout or login required?
     2. Save payment methods?
     3. International shipping?

You: Guest checkout, no saved payments, US only for now
AI:  Perfect! Here's my plan...
```

**Tip:** Answer questions thoroughly for better plans.

### Scenario 2: Plan Needs Adjustment

```bash
AI:  Plan: Will create brief with 3 user stories...
You: Add a 4th user story for cart abandonment recovery
AI:  Updated plan with cart abandonment user story!
     Approve?
You: Yes
```

**Tip:** Don't hesitate to request changes!

### Scenario 3: Plan Looks Great

```bash
AI:  Plan: [detailed plan]
You: Perfect! Go ahead.
AI:  Executing...
```

**Tip:** Clear approval speeds up execution.

## Tips for Success

### 1. Be Specific in Commands
**Good:**
```bash
/brief user-notifications Email and in-app notifications with preferences
```

**Too Vague:**
```bash
/brief notifications Add notifications
```

### 2. Answer Questions Thoughtfully
**Good:**
```
Q: Which notification types?
A: Email for important events, in-app for updates, push for urgent alerts
```

**Too Brief:**
```
Q: Which notification types?
A: All of them
```

**Note (Cursor 2.1+):** Questions appear in interactive UI - answer directly in the interface for faster workflow.

### 3. Review Plans Carefully
- Read the entire plan
- Use ⌘+F to search for specific sections (Cursor 2.1+)
- Check file paths are correct
- Verify structure makes sense
- Ensure requirements are captured

### 4. Request Changes When Needed
Don't approve if something is off:
```
"Wait, also include error handling for failed notifications"
"Can you add a section about retry logic?"
"Let's use the existing EmailService pattern"
```

### 5. Trust the Process
The plan-approve-execute pattern may seem slower at first, but it:
- Prevents wasted work
- Catches issues early
- Produces better results
- Saves time overall

## All Commands Use PLAN Mode

Every SDD command now follows this pattern:

| Command | What You'll Review Before Approval |
|---------|-----------------------------------|
| `/brief` | Brief structure, research scope, requirements |
| `/evolve` | Proposed changes, before/after comparison |
| `/research` | Research strategy, areas to examine |
| `/specify` | Specification structure, user stories |
| `/plan` | Architecture approach, tech decisions |
| `/tasks` | Task breakdown, effort estimates |
| `/implement` | Todo-list preview, execution order |
| `/upgrade` | Upgrade strategy, document mapping |

## What If I Don't Like a Plan?

You have full control:

### Option 1: Request Changes
```
"Add security considerations to the plan"
"Focus on backend first, defer frontend"
"Use Redis instead of in-memory cache"
```

### Option 2: Ask Questions
```
"Why did you choose this approach?"
"What alternatives did you consider?"
"How does this integrate with existing code?"
```

### Option 3: Reject and Restart
```
"Let's start over with a different approach"
"Can we simplify this?"
"I need to rethink the requirements"
```

## Keyboard Shortcuts

While no special shortcuts exist, use clear language:

**To Approve:**
- "Approved"
- "Yes, proceed"
- "Go ahead"
- "Looks good"

**To Request Changes:**
- "Change X to Y"
- "Also add Z"
- "Remove section about W"

**To Ask Questions:**
- "Why did you choose X?"
- "What about Y?"
- "Can you explain Z?"

## Advanced Usage

### Seeing Patterns Across Plans

After using PLAN mode a few times, you'll notice:
- Consistent structure in plans
- Similar questions for similar features
- Reusable patterns being identified
- AI learning from your preferences

### Providing Context Upfront

Speed up the process by providing context in your command:
```bash
/brief payment-integration 
  Support Stripe and PayPal
  Tokenization for security
  Retry logic for failures
  Team: 2 developers
  Timeline: 4 weeks
```

More context = fewer questions = faster to approval!

## Troubleshooting

### "AI didn't ask enough questions"
→ Provide more context in your command

### "Plan is too detailed / not detailed enough"
→ Request adjustment: "Simplify this" or "Add more detail"
→ Use ⌘+F to search within plan and find specific sections (Cursor 2.1+)

### "AI keeps asking questions"
→ This is good! It ensures understanding. Answer thoroughly.
→ Questions appear in interactive UI - answer directly for faster workflow (Cursor 2.1+)

### "Plan takes too long to generate"
→ Be patient - thoughtful planning takes time but saves more later
→ For complex projects, use background planning (Cursor 2.1+)

### "I approved but want to change something"
→ Use `/evolve` to update after creation

### "How do I find something in a large plan?"
→ Use ⌘+F to search within the plan (Cursor 2.1+)
→ Search for keywords, file paths, or section names

## Next Steps

1. **Try your first PLAN mode command:**
   ```bash
   /brief test-plan-mode Testing PLAN mode workflow
   ```

2. **Read comprehensive examples:**
   - See [PLAN_MODE_EXAMPLES.md](./PLAN_MODE_EXAMPLES.md)

3. **Learn the methodology:**
   - Read [guidelines.md](./guidelines.md)

4. **Explore all commands:**
   - Check `.cursor/commands/` directory

5. **Understand the philosophy:**
   - Read `.cursor/rules/sdd-system.mdc`

## Key Takeaways

✅ **You're in control** - Nothing happens without your approval  
✅ **See before create** - Review plans before files are made  
✅ **Ask and adjust** - Request changes anytime  
✅ **Learn and improve** - Understand AI reasoning  
✅ **Quality guaranteed** - Deliberate planning produces better results  

## Questions?

- Check [PLAN_MODE_EXAMPLES.md](./PLAN_MODE_EXAMPLES.md) for detailed walkthroughs
- Read command-specific docs in `.cursor/commands/`
- Review [guidelines.md](./guidelines.md) for methodology
- See [README.md](../README.md) for complete system overview

---

🎉 **Ready to Experience PLAN Mode?**

Start with a simple `/brief` command and see the magic happen!

```bash
/brief your-feature-name Describe what you want to build
```

The AI will guide you through the rest! 🚀

