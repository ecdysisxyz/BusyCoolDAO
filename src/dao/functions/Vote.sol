// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "../storage/Storage.sol";

contract Vote {
    function vote(uint256 proposalId) public {
        // Check if the caller is a member
        require(Storage.isMember(msg.sender), "Only members can vote");

        // Get the proposal
        Schema.DAO storage dao = Storage.getDAO();
        Schema.Proposal storage proposal = dao.proposals[proposalId];

        // Check if proposal is expired
        require(proposal.state != 3, "Proposal is expired");

        // Check if proposal is approved
        require(proposal.state != 1, "Proposal is already approved");

        // Check if proposal is executed
        require(proposal.state != 2, "Proposal is already executed");

        // Record vote logic (assuming a voting mechanism is implemented)
        // Storage.recordVote(proposalId, msg.sender); // Implement this in Storage.sol as needed
    }
}
