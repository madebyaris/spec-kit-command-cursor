# Team Commands Setup Guide

**Feature:** Cursor 2.1 Team Commands Integration  
**Date:** 2025-10-21  
**Status:** ✅ Ready

---

## Overview

Cursor 2.1 allows you to define custom commands in the dashboard that are automatically shared with your entire team. This guide shows how to set up SDD commands for team-wide use.

## Benefits

### For Teams
- ✅ **Consistent Workflow** - Everyone uses same SDD commands
- ✅ **Centralized Management** - Update commands once, applies to all
- ✅ **Easy Onboarding** - New team members get commands automatically
- ✅ **No Local Setup** - No need to manage `.cursor/commands/` files locally
- ✅ **Version Control** - Commands managed in dashboard

### For Admins
- ✅ **Control** - Define team standards
- ✅ **Updates** - Change commands, team gets updates automatically
- ✅ **Visibility** - See who's using which commands
- ✅ **Compliance** - Ensure team follows SDD methodology

---

## Setup Process

### Step 1: Access Team Dashboard

1. Go to [Cursor Dashboard](https://cursor.com/dashboard)
2. Navigate to **Team Settings**
3. Select **Team Commands** section

### Step 2: Add SDD Commands

**Option A: Import from Repository**

If your team has SDD commands in a repository:

1. Click **Import Commands**
2. Select repository
3. Choose `.cursor/commands/` directory
4. Commands are imported automatically

**Option B: Create Manually**

For each SDD command:

1. Click **New Command**
2. Enter command name (e.g., `brief`)
3. Paste command content from `.cursor/commands/brief.md`
4. Save command

### Step 3: Configure Command Access

**Set Permissions:**
- **All Team Members** - Everyone can use
- **Specific Roles** - Limit to certain roles
- **Read-Only** - View but not modify

**Set Visibility:**
- **Public** - Visible to all team members
- **Private** - Only admins see
- **Archived** - Hidden but not deleted

### Step 4: Share with Team

**Automatic Sharing:**
- Commands appear automatically for team members
- No action needed from team members
- Available immediately after setup

**Notification:**
- Team members get notification about new commands
- Commands appear in `/` dropdown
- Usage tracked in dashboard

---

## SDD Commands to Add

### Primary Commands (SDD 2.5)

1. **`brief`** - Quick feature planning
   - Source: `.cursor/commands/brief.md`
   - Usage: `/brief [task-id] [description]`
   - Team-wide: ✅ Recommended

2. **`evolve`** - Living documentation
   - Source: `.cursor/commands/evolve.md`
   - Usage: `/evolve [task-id] [change]`
   - Team-wide: ✅ Recommended

### Full Planning Commands

3. **`sdd-full-plan`** - Complete roadmaps
   - Source: `.cursor/commands/sdd-full-plan.md`
   - Usage: `/sdd-full-plan [project-id] [description]`
   - Team-wide: ✅ Recommended

4. **`pecut-all-in-one`** - Alias for sdd-full-plan
   - Source: `.cursor/commands/pecut-all-in-one.md`
   - Usage: `/pecut-all-in-one [project-id] [description]`
   - Team-wide: ✅ Optional (personal preference)

5. **`execute-task`** - Task execution
   - Source: `.cursor/commands/execute-task.md`
   - Usage: `/execute-task [task-id]`
   - Team-wide: ✅ Recommended

### Advanced Commands (SDD 2.0)

6. **`research`** - Pattern investigation
   - Source: `.cursor/commands/research.md`
   - Usage: `/research [task-id] [topic]`
   - Team-wide: ✅ Recommended

7. **`specify`** - Requirements specification
   - Source: `.cursor/commands/specify.md`
   - Usage: `/specify [feature-name] [description]`
   - Team-wide: ✅ Recommended

8. **`plan`** - Technical planning
   - Source: `.cursor/commands/plan.md`
   - Usage: `/plan [feature-name]`
   - Team-wide: ✅ Recommended

9. **`tasks`** - Task breakdown
   - Source: `.cursor/commands/tasks.md`
   - Usage: `/tasks [feature-name]`
   - Team-wide: ✅ Recommended

10. **`implement`** - Implementation execution
    - Source: `.cursor/commands/implement.md`
    - Usage: `/implement [task-id]`
    - Team-wide: ✅ Recommended

### Escalation Commands

11. **`upgrade`** - Brief to full SDD
    - Source: `.cursor/commands/upgrade.md`
    - Usage: `/upgrade [task-id] [reason]`
    - Team-wide: ✅ Recommended

---

## Command Configuration

### Command Metadata

For each command, configure:

**Basic Info:**
- **Name:** Command identifier (e.g., `brief`)
- **Description:** What the command does
- **Category:** SDD Primary, SDD Advanced, SDD Planning

**Content:**
- **Source:** Copy from `.cursor/commands/[command].md`
- **Format:** Markdown
- **Variables:** Support for placeholders

**Settings:**
- **Visibility:** Public/Private/Archived
- **Permissions:** Who can use/modify
- **Version:** Track changes

### Example Configuration

```yaml
Command: brief
Name: Brief Feature Planning
Description: Create 30-minute feature brief for rapid development
Category: SDD Primary
Source: .cursor/commands/brief.md
Visibility: Public
Permissions: All Team Members
Version: 2.1
```

---

## Team Member Experience

### For Team Members

**Automatic Access:**
1. Open Cursor
2. Type `/` in Agent input
3. See all team SDD commands
4. Use immediately - no setup needed

**Command Usage:**
```
Type: /brief
See: "Brief Feature Planning" in dropdown
Select: Command appears
Use: /brief user-notifications Add notifications
```

**No Local Files Needed:**
- Commands work without `.cursor/commands/` locally
- Updates happen automatically
- Consistent across team

### For New Team Members

**Onboarding:**
1. Join team
2. Open Cursor
3. Commands appear automatically
4. Start using SDD immediately

**No Setup Required:**
- No repository cloning
- No file copying
- No configuration
- Just start using

---

## Managing Commands

### Updating Commands

**Process:**
1. Admin updates command in dashboard
2. Changes saved
3. Team members get update automatically
4. No action needed from team

**Version History:**
- Track changes over time
- See who made changes
- Rollback if needed
- Audit trail

### Adding New Commands

**Process:**
1. Create command in dashboard
2. Add content
3. Set permissions
4. Share with team
5. Team gets notification

### Removing Commands

**Process:**
1. Archive command (not delete)
2. Team members can't use anymore
3. Can restore if needed
4. History preserved

---

## Best Practices

### For Admins

1. **Start with Core Commands**
   - Add `/brief` and `/sdd-full-plan` first
   - Let team get familiar
   - Add more commands gradually

2. **Document Usage**
   - Create team wiki or docs
   - Show examples
   - Provide training

3. **Gather Feedback**
   - Ask team what works
   - Adjust commands based on feedback
   - Iterate and improve

4. **Monitor Usage**
   - See which commands are popular
   - Identify training needs
   - Optimize workflow

### For Teams

1. **Use Consistently**
   - Follow SDD workflow
   - Use team commands
   - Maintain standards

2. **Provide Feedback**
   - Share what works
   - Suggest improvements
   - Help refine commands

3. **Learn Together**
   - Share examples
   - Help new members
   - Build team knowledge

---

## Integration with Local Commands

### Hybrid Approach

**Team Commands:**
- Standard SDD workflow
- Team-wide consistency
- Centralized management

**Local Commands:**
- Project-specific commands
- Personal preferences
- Experimental features

**Both Work Together:**
- Team commands appear first
- Local commands supplement
- No conflicts

### Priority Order

1. **Team Commands** - Standard workflow
2. **Local Commands** - Project-specific
3. **Built-in Commands** - Cursor defaults

---

## Troubleshooting

### Commands Not Appearing

**Check:**
- Cursor version (2.1+ required)
- Team membership confirmed
- Dashboard permissions set
- Command visibility settings

**Solution:**
- Update Cursor
- Verify team access
- Check dashboard settings
- Contact admin

### Commands Not Working

**Check:**
- Command content is valid
- Markdown format correct
- Variables properly defined
- Permissions set correctly

**Solution:**
- Review command content
- Check format
- Verify permissions
- Test in dashboard

### Updates Not Appearing

**Check:**
- Cursor sync status
- Internet connection
- Dashboard changes saved
- Team member Cursor version

**Solution:**
- Refresh Cursor
- Check connection
- Verify changes saved
- Update Cursor if needed

---

## Examples

### Example 1: Small Team Setup

**Team:** 5 developers
**Commands:** `/brief`, `/sdd-full-plan`, `/execute-task`

**Setup Time:** 10 minutes
**Result:** Consistent SDD workflow across team

### Example 2: Large Team Setup

**Team:** 50 developers
**Commands:** All SDD commands

**Setup Time:** 30 minutes
**Result:** Standardized development process

### Example 3: Enterprise Setup

**Team:** 200+ developers, multiple projects
**Commands:** All SDD commands + custom project commands

**Setup Time:** 2 hours
**Result:** Enterprise-wide SDD adoption

---

## Migration from Local Commands

### If You Have Local Commands

**Option 1: Keep Both**
- Team commands for standard workflow
- Local commands for project-specific needs
- Both work together

**Option 2: Migrate to Team**
- Move local commands to dashboard
- Remove local files
- Use team commands only

**Option 3: Hybrid**
- Core commands in team dashboard
- Project-specific locally
- Best of both worlds

---

## Security Considerations

### Access Control

**Permissions:**
- Who can use commands
- Who can modify commands
- Who can see command usage

**Settings:**
- Role-based access
- Project-based access
- Custom permissions

### Content Security

**Validation:**
- Command content reviewed
- No malicious code
- Safe markdown only

**Audit:**
- Track command changes
- Monitor usage
- Security logs

---

## Support

### Getting Help

**Resources:**
- [Cursor Documentation](https://cursor.com/docs)
- [SDD Guidelines](./guidelines.md)
- [Team Dashboard](https://cursor.com/dashboard)

**Contact:**
- Team admin for command issues
- Cursor support for technical issues
- SDD team for methodology questions

---

## Next Steps

1. **Set Up Commands**
   - Access dashboard
   - Add SDD commands
   - Configure permissions

2. **Share with Team**
   - Notify team members
   - Provide training
   - Gather feedback

3. **Monitor Usage**
   - Track command usage
   - Identify improvements
   - Iterate and refine

---

**Status:** Ready for team adoption  
**Last Updated:** 2025-10-21  
**Cursor Version Required:** 2.1+

🎊 **Team Commands: Ready for Your Team!** 🎊

