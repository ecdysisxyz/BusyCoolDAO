// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "../storage/Storage.sol";

contract RemoveMember {
    function removeMember(address member) public {
        // Check if the caller is the owner
        require(Storage.getOwner() == msg.sender, "Only owner can remove members");

        // Remove member logic (assuming a list of members is managed elsewhere)
        // Storage.removeMember(member); // Implement this in Storage.sol as needed
    }
}
