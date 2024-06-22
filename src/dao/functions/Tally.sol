// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "../storage/Storage.sol";

contract Tally {
    function tally(uint256 proposalId) public {
        // Get the proposal
        Schema.DAO storage dao = Storage.getDAO();
        Schema.Proposal storage proposal = dao.proposals[proposalId];

        // Check if proposal is expired
        require(proposal.state != 3, "Proposal is expired");

        // Check if proposal is approved
        require(proposal.state != 1, "Proposal is already approved");

        // Check if proposal is executed
        require(proposal.state != 2, "Proposal is already executed");

        // Tally votes logic (assuming a tally mechanism is implemented)
        // bool isApproved = Storage.tallyVotes(proposalId); // Implement this in Storage.sol as needed

        

        // If approved, update proposal state to Approved
        proposal.state = 1; // Approved
    }
}
