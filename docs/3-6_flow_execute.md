```mermaid
graph TD
    A[Start] --> B{Is proposal expired?}
    B -- No --> C{Is proposal approved?}
    C -- Yes --> D{Is proposal executed?}
    D -- No --> E[Execute proposal]
    E --> F[Update proposal state to Executed]
    F --> G[Increment DAO execution count]
    G --> H[Update DAO status to Active]
    H --> I[End]
    B -- Yes --> J[Revert: Proposal is expired]
    C -- No --> K[Revert: Proposal is not approved]
    D -- Yes --> L[Revert: Proposal is already executed]
