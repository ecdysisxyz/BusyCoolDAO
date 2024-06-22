```mermaid
graph TD
    A[Start] --> B{Is proposal expired?}
    B -- No --> C{Is proposal approved?}
    C -- No --> D{Is proposal executed?}
    D -- No --> E[Tally votes]
    E --> F[Update proposal state to Approved]
    F --> G[End]
    B -- Yes --> H[Revert: Proposal is expired]
    C -- Yes --> I[Revert: Proposal is already approved]
    D -- Yes --> J[Revert: Proposal is already executed]
