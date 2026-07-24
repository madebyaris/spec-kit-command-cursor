# Common Architectural Patterns

Reference guide for pattern selection during research.

## Structural Patterns

### Repository Pattern
**When to use**: Data access abstraction needed
**Structure**: Interface defines CRUD operations, implementation handles persistence
**Benefits**: Testability, swappable data sources
**Example**:
```typescript
interface UserRepository {
  findById(id: string): Promise<User | null>;
  save(user: User): Promise<User>;
}
```

### Service Layer Pattern
**When to use**: Complex business logic spanning multiple entities
**Structure**: Services orchestrate operations, repositories handle persistence
**Benefits**: Separation of concerns, reusable business logic

### Factory Pattern
**When to use**: Complex object creation, multiple variants
**Structure**: Factory method/class creates instances
**Benefits**: Encapsulates creation logic, flexible instantiation

### Strategy Pattern
**When to use**: Multiple algorithms for same operation
**Structure**: Interface defines operation, implementations vary behavior
**Benefits**: Runtime algorithm selection, open/closed principle

## API Patterns

### REST
**When to use**: Standard CRUD operations, resource-oriented
**Characteristics**: HTTP methods, stateless, cacheable
**Best for**: Public APIs, simple operations

### GraphQL
**When to use**: Complex queries, mobile clients, multiple consumers
**Characteristics**: Single endpoint, client-specified data
**Best for**: Flexible data requirements, reducing over-fetching

### RPC (gRPC, tRPC)
**When to use**: Internal services, high performance needed
**Characteristics**: Method-based, typed contracts
**Best for**: Microservices, real-time communication

## Data Patterns

### Event Sourcing
**When to use**: Audit trail required, complex state reconstruction
**Structure**: Store events, derive state from event stream
**Trade-offs**: Complexity vs. auditability

### CQRS
**When to use**: Read/write patterns differ significantly
**Structure**: Separate read and write models
**Trade-offs**: Complexity vs. optimization

### Unit of Work
**When to use**: Multiple database operations need atomicity
**Structure**: Track changes, commit as single transaction
**Benefits**: Consistency, rollback capability

## Frontend Patterns

### Container/Presenter
**When to use**: Separating logic from presentation
**Structure**: Container handles state/logic, presenter handles UI
**Benefits**: Testability, reusability

### Compound Components
**When to use**: Related components that share state
**Structure**: Parent provides context, children consume
**Benefits**: Flexible composition, implicit state sharing

### Render Props / Hooks
**When to use**: Sharing stateful logic between components
**Structure**: Function receives state/handlers as props or from hook
**Benefits**: Reusability, composition

## Integration Patterns

### Circuit Breaker
**When to use**: Protecting against cascading failures
**Structure**: Monitor failures, open circuit when threshold exceeded
**Benefits**: Resilience, graceful degradation

### Retry with Backoff
**When to use**: Transient failures expected
**Structure**: Retry with increasing delays
**Benefits**: Resilience, reduced load during issues

### Message Queue
**When to use**: Async processing, decoupling producers/consumers
**Structure**: Producer → Queue → Consumer
**Benefits**: Scalability, reliability, decoupling

## Selection Criteria

| Pattern | Complexity | Testability | Scalability | Use When |
|---------|------------|-------------|-------------|----------|
| Repository | Low | High | Medium | Data access |
| Service Layer | Medium | High | Medium | Business logic |
| Event Sourcing | High | Medium | High | Audit needs |
| CQRS | High | Medium | High | Read/write split |
| Circuit Breaker | Low | High | High | External deps |
