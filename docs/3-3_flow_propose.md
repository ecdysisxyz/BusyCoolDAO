```mermaid
graph TD
    A[Start] --> B{Is caller a member?}
    B -- Yes --> C{Is DAO in Paused state?}
    C -- No --> D{Is DAO in CoolDown state?}
    D -- No --> E{Is DAO in Busy state?}
    E -- No --> F[Create proposal]
    F --> G[Update DAO status to Busy]
    G --> H[End]
    C -- Yes --> I[Revert: DAO is paused]
    D -- Yes --> J[Revert: DAO is in cool down]
    E -- Yes --> K[Revert: DAO is busy]
    B -- No --> L[Revert: Only members can propose]
