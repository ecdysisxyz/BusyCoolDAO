// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {MCDevKit} from "@mc/devkit/Flattened.sol";
// Bundle interface
// Functions

library DeployLib {
    function bundleName() internal returns(string memory) {
        return "Counter";
    }

    function deployCounter(MCDevKit storage mc, uint256 initialNumber) internal returns(MCDevKit storage) {
        mc.init(bundleName());
        // mc.deploy(abi.encodeCall(Initialize.initialize, initialNumber));
        return mc;
    }
}
