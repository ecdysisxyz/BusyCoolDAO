```mermaid
stateDiagram-v2
    [*] --> Pending
    Pending --> Approved : approve()
    Approved --> Executed : execute()
    Approved --> Expired : expire()
    Pending --> Expired : expire()
