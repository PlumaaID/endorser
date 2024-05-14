// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {Upgrades} from "@openzeppelin/foundry-upgrades/Upgrades.sol";
import {Endorser} from "~/Endorser.sol";

contract EndorserTest is Test {
    Endorser public instance;

    function setUp() public {
        address initialOwner = vm.addr(1);
        address proxy = Upgrades.deployUUPSProxy(
            "Endorser.sol",
            abi.encodeCall(Endorser.initialize, (initialOwner))
        );
        instance = Endorser(proxy);
    }

    function testName() public view {
        assertEq(instance.name(), "Endorser");
    }
}
