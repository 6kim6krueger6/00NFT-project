//SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import {Script} from "forge-std/Script.sol";
import {NFT} from "../src/NFT.sol";

contract MintNFT is Script {
    string public constant CARTI_URI = "https://ipfs.io/ipfs/bafybeid2mns5enc4biisgodwpponvaxbx6fp2hpt2aj4wwedx5dak5cdqy/carti.json";
    string public constant LONE_URI = "https://ipfs.io/ipfs/bafybeid2mns5enc4biisgodwpponvaxbx6fp2hpt2aj4wwedx5dak5cdqy/lone.json";
    string public constant KEN_URI = "https://ipfs.io/ipfs/bafybeid2mns5enc4biisgodwpponvaxbx6fp2hpt2aj4wwedx5dak5cdqy/ken.json";
    

    function run() external {
        address mostRecentlyDeployed = 0xA31cA1c5B81F560B0C415327D9641b55cb0291E4;
        mintOnContract(mostRecentlyDeployed, CARTI_URI);
        mintOnContract(mostRecentlyDeployed, LONE_URI);
        mintOnContract(mostRecentlyDeployed, KEN_URI);
    }

    function mintOnContract(address contractAddress, string memory Uri) public {
        vm.startBroadcast();
        NFT(contractAddress).mint(Uri);
        vm.stopBroadcast();
    }
}