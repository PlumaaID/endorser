// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {Endorser} from "~/Endorser.sol";
import {ICreateX} from "createx/ICreateX.sol";
import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

contract EndorserScript is Script {
    address constant CREATE_X = 0xba5Ed099633D3B313e4D5F7bdc1305d3c28ba5Ed;
    ICreateX public createX;

    function setUp() public {
        createX = ICreateX(CREATE_X);
    }

    function run() public {
        vm.startBroadcast();

        address implementation = createX.deployCreate2(
            keccak256("ENDORSER_IMPLEMENTATION_V1"),
            type(Endorser).creationCode
        );
        address proxy = createX.deployCreate2(
            keccak256("ENDORSER_ERC1967PROXY"),
            abi.encodePacked(
                type(ERC1967Proxy).creationCode,
                abi.encode(
                    implementation,
                    abi.encodeCall(Endorser.initialize, (msg.sender))
                )
            )
        );
        console.log("Contract deployed to %s", address(proxy));
        vm.stopBroadcast();
    }
}
