// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "../storage/Storage.sol";

contract Propose {
    function propose(string memory title, string memory description) public {
        // Check if the caller is a member
        require(Storage.isMember(msg.sender), "Only members can propose");
        
        // Get DAO status
        Schema.DAO storage dao = Storage.getDAO();
        
        // Check if DAO is paused
        require(keccak256(bytes(dao.status)) != keccak256("Paused"), "DAO is paused");
        
        // Check if DAO is in cool down
        require(block.timestamp > dao.coolDownEndTime, "DAO is in cool down");
        
        // Check if DAO is busy
        require(keccak256(bytes(dao.status)) != keccak256("Busy"), "DAO is busy");

        // Create proposal
        Schema.Proposal memory newProposal;
        newProposal.id = dao.proposals.length;
        newProposal.title = title;
        newProposal.description = description;
        newProposal.proposer = msg.sender;
        newProposal.state = 0; // Pending
        newProposal.daoId = dao.id;

        // Add proposal to DAO
        dao.proposals.push(newProposal);

        // Set DAO to Busy state
        dao.status = "Busy";
    }
}
