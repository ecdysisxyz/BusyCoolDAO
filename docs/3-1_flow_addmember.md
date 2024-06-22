```mermaid
graph TD
    A[Start] --> B{Is caller owner?}
    B -- Yes --> C{Is DAO in Paused state?}
    C -- No --> D{Is DAO in Busy state?}
    D -- No --> E[Add member]
    E --> F[Update DAO status to CoolDown]
    F --> G[End]
    C -- Yes --> H[Revert: DAO is paused]
    D -- Yes --> I[Revert: DAO is busy]
    B -- No --> J[Revert: Only owner can add members]
