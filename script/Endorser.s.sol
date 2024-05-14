// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {Endorser} from "~/Endorser.sol";
import {Upgrades} from "@openzeppelin/foundry-upgrades/Upgrades.sol";

contract EndorserScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        address initialOwner = address(0); // Replace
        address proxy = Upgrades.deployUUPSProxy(
            "Endorser.sol",
            abi.encodeCall(Endorser.initialize, (initialOwner))
        );
        console.log("Contract deployed to %s", address(proxy));
        vm.stopBroadcast();
    }
}
