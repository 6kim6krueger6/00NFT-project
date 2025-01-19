// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NFT is ERC721 {
    error UriNotFound();

    mapping (uint256 tokenId => string tokenUri) s_tokenToUri;
    uint256 private s_tokenCounter;

    constructor() ERC721("0pium", "00") {
        s_tokenCounter = 0;
    }

    function mint(string memory tokenUri) public {
        s_tokenToUri[s_tokenCounter] = tokenUri;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        if (ownerOf(tokenId) == address(0)) {
            revert UriNotFound();
        }
        return s_tokenToUri[tokenId];
    }

}