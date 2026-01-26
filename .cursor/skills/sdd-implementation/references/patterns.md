# SDD Implementation Patterns

Common patterns and conventions for SDD implementations.

## File Organization

### Spec-Driven Structure
```
specs/active/[task-id]/
├── spec.md           # Requirements
├── plan.md           # Technical design
├── tasks.md          # Task breakdown
├── todo-list.md      # Execution checklist
└── research.md       # (optional) Investigation findings
```

### Code Organization
- Keep related code together
- One component/module per file (generally)
- Tests alongside source files or in `__tests__/` folder
- Shared utilities in `utils/` or `lib/`

## Naming Conventions

### Files
- `kebab-case` for file names: `user-service.ts`
- `.test.ts` or `.spec.ts` for tests
- `index.ts` for barrel exports

### Code
- `camelCase` for variables and functions
- `PascalCase` for classes and components
- `UPPER_SNAKE_CASE` for constants
- Descriptive names over abbreviations

## Error Handling

### Standard Pattern
```typescript
try {
  const result = await operation();
  return { success: true, data: result };
} catch (error) {
  logger.error('Operation failed', { error, context });
  return { success: false, error: formatError(error) };
}
```

### Validation Pattern
```typescript
function validateInput(input: unknown): Result<ValidInput> {
  const parsed = schema.safeParse(input);
  if (!parsed.success) {
    return { success: false, error: parsed.error };
  }
  return { success: true, data: parsed.data };
}
```

## Todo Tracking

### Format
```markdown
- [ ] Task description
  - Pattern: [pattern to follow]
  - Files: [files to create/modify]
  - Depends: [dependencies]
```

### Completion
```markdown
- [x] Task description
  - Completed: [timestamp]
  - Files: [actual files changed]
```

### Blocked
```markdown
- [ ] [BLOCKED: reason] Task description
  - Attempted: [what was tried]
  - Needs: [what's required to unblock]
```

## Testing Patterns

### Unit Test Structure
```typescript
describe('ComponentName', () => {
  describe('methodName', () => {
    it('should handle happy path', () => {
      // Arrange
      // Act
      // Assert
    });
    
    it('should handle error case', () => {
      // Arrange
      // Act
      // Assert
    });
  });
});
```

### Integration Test Pattern
```typescript
describe('Feature Integration', () => {
  beforeAll(async () => {
    // Setup
  });
  
  afterAll(async () => {
    // Cleanup
  });
  
  it('should complete full workflow', async () => {
    // Test end-to-end scenario
  });
});
```

## API Patterns

### Request Handler
```typescript
async function handleRequest(req: Request): Promise<Response> {
  // 1. Validate input
  const validation = validateInput(req.body);
  if (!validation.success) {
    return errorResponse(400, validation.error);
  }
  
  // 2. Execute business logic
  const result = await businessLogic(validation.data);
  if (!result.success) {
    return errorResponse(500, result.error);
  }
  
  // 3. Return success
  return successResponse(result.data);
}
```

### Response Format
```typescript
// Success
{ success: true, data: T }

// Error
{ success: false, error: { code: string, message: string } }
```

## Component Patterns (React)

### Functional Component
```tsx
interface Props {
  value: string;
  onChange: (value: string) => void;
}

export function ComponentName({ value, onChange }: Props) {
  // Hooks at top
  const [state, setState] = useState();
  
  // Event handlers
  const handleChange = useCallback(() => {}, []);
  
  // Render
  return <div>{/* JSX */}</div>;
}
```

## Database Patterns

### Repository Pattern
```typescript
class EntityRepository {
  async findById(id: string): Promise<Entity | null> {}
  async findAll(filter: Filter): Promise<Entity[]> {}
  async create(data: CreateDTO): Promise<Entity> {}
  async update(id: string, data: UpdateDTO): Promise<Entity> {}
  async delete(id: string): Promise<void> {}
}
```
