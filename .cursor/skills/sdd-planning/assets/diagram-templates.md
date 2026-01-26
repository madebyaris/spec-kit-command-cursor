# Architecture Diagram Templates

Mermaid diagram templates for common SDD architectures.

## Basic Web Application

```mermaid
flowchart TB
    subgraph Client [Client Layer]
        Browser[Browser]
        Mobile[Mobile App]
    end
    
    subgraph API [API Layer]
        Gateway[API Gateway]
        Auth[Auth Service]
    end
    
    subgraph Services [Service Layer]
        UserSvc[User Service]
        CoreSvc[Core Service]
    end
    
    subgraph Data [Data Layer]
        DB[(Database)]
        Cache[(Cache)]
    end
    
    Browser --> Gateway
    Mobile --> Gateway
    Gateway --> Auth
    Gateway --> UserSvc
    Gateway --> CoreSvc
    UserSvc --> DB
    CoreSvc --> DB
    CoreSvc --> Cache
```

## Microservices Architecture

```mermaid
flowchart LR
    subgraph Gateway [API Gateway]
        GW[Gateway]
    end
    
    subgraph Services [Services]
        SvcA[Service A]
        SvcB[Service B]
        SvcC[Service C]
    end
    
    subgraph Messaging [Message Bus]
        Queue[Message Queue]
    end
    
    subgraph Data [Data Stores]
        DBA[(DB A)]
        DBB[(DB B)]
        DBC[(DB C)]
    end
    
    GW --> SvcA
    GW --> SvcB
    GW --> SvcC
    SvcA --> DBA
    SvcB --> DBB
    SvcC --> DBC
    SvcA <--> Queue
    SvcB <--> Queue
    SvcC <--> Queue
```

## Event-Driven Architecture

```mermaid
flowchart TB
    subgraph Producers [Event Producers]
        API[API Service]
        Worker[Worker]
    end
    
    subgraph Bus [Event Bus]
        Events[Event Stream]
    end
    
    subgraph Consumers [Event Consumers]
        Handler1[Handler 1]
        Handler2[Handler 2]
        Handler3[Handler 3]
    end
    
    subgraph Storage [Storage]
        EventStore[(Event Store)]
        ReadDB[(Read DB)]
    end
    
    API --> Events
    Worker --> Events
    Events --> Handler1
    Events --> Handler2
    Events --> Handler3
    Events --> EventStore
    Handler1 --> ReadDB
    Handler2 --> ReadDB
```

## Component Diagram

```mermaid
classDiagram
    class Controller {
        +handleRequest()
        +validateInput()
    }
    
    class Service {
        +businessLogic()
        +orchestrate()
    }
    
    class Repository {
        +find()
        +save()
        +delete()
    }
    
    class Entity {
        +id
        +data
        +validate()
    }
    
    Controller --> Service
    Service --> Repository
    Repository --> Entity
```

## Sequence Diagram - Request Flow

```mermaid
sequenceDiagram
    participant C as Client
    participant G as Gateway
    participant A as Auth
    participant S as Service
    participant D as Database
    
    C->>G: Request
    G->>A: Validate Token
    A-->>G: Token Valid
    G->>S: Forward Request
    S->>D: Query Data
    D-->>S: Data
    S-->>G: Response
    G-->>C: Response
```

## State Machine

```mermaid
stateDiagram-v2
    [*] --> Draft
    Draft --> Pending: Submit
    Pending --> Approved: Approve
    Pending --> Rejected: Reject
    Rejected --> Draft: Revise
    Approved --> Published: Publish
    Published --> Archived: Archive
    Archived --> [*]
```

## Data Flow Diagram

```mermaid
flowchart LR
    subgraph Input [Input]
        User[User Input]
        API[External API]
    end
    
    subgraph Process [Processing]
        Validate[Validate]
        Transform[Transform]
        Enrich[Enrich]
    end
    
    subgraph Output [Output]
        Store[Store]
        Notify[Notify]
        Response[Response]
    end
    
    User --> Validate
    API --> Validate
    Validate --> Transform
    Transform --> Enrich
    Enrich --> Store
    Enrich --> Notify
    Store --> Response
```

## Deployment Diagram

```mermaid
flowchart TB
    subgraph Cloud [Cloud Provider]
        subgraph LB [Load Balancer]
            ALB[Application LB]
        end
        
        subgraph Compute [Compute]
            Container1[Container 1]
            Container2[Container 2]
        end
        
        subgraph Storage [Storage]
            RDS[(RDS)]
            S3[S3 Bucket]
            Redis[(Redis)]
        end
    end
    
    Internet[Internet] --> ALB
    ALB --> Container1
    ALB --> Container2
    Container1 --> RDS
    Container2 --> RDS
    Container1 --> Redis
    Container2 --> Redis
    Container1 --> S3
```

## Usage Notes

1. Copy the relevant template
2. Replace placeholder names with actual component names
3. Adjust relationships to match your architecture
4. Add or remove components as needed
5. Use consistent naming conventions
