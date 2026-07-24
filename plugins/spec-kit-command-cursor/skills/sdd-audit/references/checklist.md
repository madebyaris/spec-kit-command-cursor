# SDD Audit Checklist

Comprehensive checklist for auditing implementations against specifications.

## Functional Requirements

### Core Functionality
- [ ] All user stories implemented
- [ ] Acceptance criteria met for each story
- [ ] Happy path works correctly
- [ ] Error paths handled gracefully
- [ ] Edge cases from spec addressed

### API Compliance
- [ ] Endpoints match spec contract
- [ ] Request/response schemas correct
- [ ] Error responses follow standard format
- [ ] Authentication/authorization enforced
- [ ] Rate limiting implemented (if specified)

### Data Integrity
- [ ] Data models match spec
- [ ] Validations in place
- [ ] Required fields enforced
- [ ] Relationships correct
- [ ] Migrations reversible

## Non-Functional Requirements

### Performance
- [ ] Response times within targets
- [ ] No N+1 queries
- [ ] Caching implemented where specified
- [ ] Pagination for large datasets
- [ ] Async operations for heavy tasks

### Security
- [ ] Input validation on all user input
- [ ] SQL injection prevention
- [ ] XSS prevention
- [ ] CSRF protection
- [ ] Secrets not hardcoded
- [ ] Sensitive data encrypted
- [ ] Auth tokens secure

### Reliability
- [ ] Error handling comprehensive
- [ ] Logging adequate for debugging
- [ ] Graceful degradation
- [ ] Retry logic where appropriate
- [ ] Circuit breakers (if specified)

## Code Quality

### Structure
- [ ] Follows project patterns
- [ ] Single responsibility principle
- [ ] DRY - no unnecessary duplication
- [ ] Clear separation of concerns
- [ ] Appropriate abstraction levels

### Readability
- [ ] Meaningful names (variables, functions, classes)
- [ ] Functions under 50 lines
- [ ] Comments for complex logic
- [ ] Consistent formatting
- [ ] No dead code

### Testing
- [ ] Unit tests for business logic
- [ ] Integration tests for APIs
- [ ] Edge cases tested
- [ ] Error paths tested
- [ ] Test coverage meets target

## Documentation

- [ ] README updated if needed
- [ ] API documentation current
- [ ] Code comments adequate
- [ ] Changelog updated
- [ ] Migration guide (if breaking changes)

## Deployment Readiness

- [ ] Environment variables documented
- [ ] Database migrations ready
- [ ] Feature flags configured
- [ ] Monitoring/alerts set up
- [ ] Rollback plan available
