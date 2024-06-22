// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

library Schema {
    struct DAO {
        uint256 id;
        string name;
        Proposal[] proposals;
        address[] members;
        uint256 executionCount;
        string status; // "Active", "Paused", "Busy", "CoolDown"
        uint256 coolDownEndTime;
        address owner;
    }

    struct Proposal {
        uint256 id;
        string title;
        string description;
        address proposer;
        uint yay;
        uint quorum;
        uint256 state; // 0: Pending, 1: Approved, 2: Executed, 3: Expired
        uint256 daoId;
    }
}
