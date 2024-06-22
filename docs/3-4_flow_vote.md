```mermaid
graph TD
    A[Start] --> B{Is caller a member?}
    B -- Yes --> C{Is proposal expired?}
    C -- No --> D{Is proposal approved?}
    D -- No --> E{Is proposal executed?}
    E -- No --> F[Record vote]
    F --> G[End]
    C -- Yes --> H[Revert: Proposal is expired]
    D -- Yes --> I[Revert: Proposal is already approved]
    E -- Yes --> J[Revert: Proposal is already executed]
    B -- No --> K[Revert: Only members can vote]
