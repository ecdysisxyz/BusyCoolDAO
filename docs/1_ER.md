```mermaid
erDiagram
    DAO {
        uint256 id
        string name
        Proposal[] proposals
        uint256 executionCount
        string status
        uint256 coolDownEndTime
    }

    Proposal {
        uint256 id
        string title
        string description
        address proposer
        uint256 state
        uint256 daoId
    }

    DAO ||--o{ Proposal : has
    Proposal }o--|| DAO : belongs_to
