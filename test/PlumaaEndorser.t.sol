// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {PlumaaEndorser} from "src/PlumaaEndorser.sol";

contract PlumaaEndorserTest is Test {
  PlumaaEndorser public instance;

  function setUp() public {
    address initialOwner = vm.addr(1);
    instance = new PlumaaEndorser(initialOwner);
  }

  function testName() public view {
    assertEq(instance.name(), "Plumaa Endorser");
  }
}
