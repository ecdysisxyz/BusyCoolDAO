```mermaid
stateDiagram-v2
    [*] --> Active
    Active --> Paused : pause()
    Paused --> Active : resume()
    Active --> Busy : startProposal()
    Busy --> Active : proposalExecuted() / proposalExpired()
    Active --> CoolDown : newMemberAdded()
    CoolDown --> Active : coolDownComplete()
    CoolDown --> Paused : pause()
    Paused --> CoolDown : resume()
