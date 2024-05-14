// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/access/Ownable2Step.sol";

/// @custom:security-contact security@plumaa.id
contract PlumaaEndorser is ERC721, ERC721Burnable, Ownable2Step {
    constructor(
        address initialOwner
    ) ERC721("Plumaa Endorser", "PLUMEn") Ownable2Step(initialOwner) {}

    function _baseURI() internal pure override returns (string memory) {
        return "https://metadata.plumaa.id/";
    }

    function safeMint(address to, uint256 tokenId) public onlyOwner {
        _safeMint(to, tokenId);
    }
}
