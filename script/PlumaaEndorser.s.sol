// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {PlumaaEndorser} from "src/PlumaaEndorser.sol";

contract PlumaaEndorserScript is Script {
  function setUp() public {}

  function run() public {
    // TODO: Set addresses for the variables below, then uncomment the following section:
    /*
    vm.startBroadcast();
    address initialOwner = <Set initialOwner address here>;
    PlumaaEndorser instance = new PlumaaEndorser(initialOwner);
    console.log("Contract deployed to %s", address(instance));
    vm.stopBroadcast();
    */
  }
}
