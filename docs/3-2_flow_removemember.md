```mermaid
graph TD
    A[Start] --> B{Is caller owner?}
    B -- Yes --> C[Remove member]
    C --> D[End]
    B -- No --> E[Revert: Only owner can remove members]
