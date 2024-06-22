// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "../storage/Storage.sol";

contract AddMember {
    function addMember(address newMember) public {
        // Check if the caller is the owner
        require(Storage.getOwner() == msg.sender, "Only owner can add members");
        
        // Get DAO status
        Schema.DAO storage dao = Storage.getDAO();
        
        // Check if DAO is paused
        require(keccak256(bytes(dao.status)) != keccak256("Paused"), "DAO is paused");
        
        // Check if DAO is busy
        require(keccak256(bytes(dao.status)) != keccak256("Busy"), "DAO is busy");

        // Add new member logic (assuming a list of members is managed elsewhere)
        // Storage.addMember(newMember); // Implement this in Storage.sol as needed

        // Set DAO to CoolDown state
        dao.status = "CoolDown";
        dao.coolDownEndTime = block.timestamp + 1 days;
    }
}
