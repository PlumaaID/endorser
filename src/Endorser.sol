// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import {ERC721Upgradeable} from "@openzeppelin/contracts-upgradeable/token/ERC721/ERC721Upgradeable.sol";
import {ERC721BurnableUpgradeable} from "@openzeppelin/contracts-upgradeable/token/ERC721/extensions/ERC721BurnableUpgradeable.sol";
import {OwnableUpgradeable, Ownable2StepUpgradeable} from "@openzeppelin/contracts-upgradeable/access/Ownable2StepUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

/// @title Endorser
///
/// @notice A contract to track digital endorsements according to comercial Mexican law. This contract allows for any user
/// to mint a new token by providing the hash of the digital document that's endorsed. Privacy is ensured by only tracking
/// the hash of the document, and not the document itself.
///
/// NOTE: Property is tied to regular Ethereum addresses. It's the responsibility of the developer to implement a robust
/// legal framework to ensure the link between the owner and such address.
///¸
/// @custom:security-contact security@plumaa.id
contract Endorser is
    Initializable,
    ERC721Upgradeable,
    ERC721BurnableUpgradeable,
    Ownable2StepUpgradeable,
    UUPSUpgradeable
{
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize(address initialOwner) public initializer {
        __ERC721_init("Endorser", "END");
        __ERC721Burnable_init();
        __Ownable2Step_init();
        __Ownable_init(initialOwner);
        __UUPSUpgradeable_init();
    }

    function _baseURI() internal pure override returns (string memory) {
        return "https://metadata.plumaa.id/";
    }

    /// @dev Mint a new token for a given hash. This is permissionless since the probability
    /// of hash collisions is negligible.
    function safeMint(address to, bytes32 hash) public {
        _safeMint(to, uint256(hash));
    }

    function _authorizeUpgrade(
        address newImplementation
    ) internal override onlyOwner {}
}
