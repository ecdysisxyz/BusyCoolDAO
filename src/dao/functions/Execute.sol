// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "../storage/Storage.sol";

contract Execute {
    function execute(uint256 proposalId) public {
        // Get the proposal
        Schema.DAO storage dao = Storage.getDAO();
        Schema.Proposal storage proposal = dao.proposals[proposalId];

        // Check if proposal is expired
        require(proposal.state != 3, "Proposal is expired");

        // Check if proposal is approved
        require(proposal.state == 1, "Proposal is not approved");

        // Check if proposal is executed
        require(proposal.state != 2, "Proposal is already executed");

        // Execute proposal logic (demo: increment a value)
        dao.executionCount++;

        // Update proposal state to Executed
        proposal.state = 2; // Executed

        // Update DAO status to Active
        dao.status = "Active";
    }
}
