# 00NFT-project

This project is a simple NFT collection consisting of 3 unique images, deployed to the Sepolia testnet and available on OpenSea. The project is developed using Foundry, a fast and powerful development framework for Ethereum smart contracts.

Contract Address: 0xA31cA1c5B81F560B0C415327D9641b55cb0291E4

## Project Details

- **Blockchain**: Sepolia Testnet
- **Marketplace**: [OpenSea (Sepolia)](https://testnets.opensea.io/)
- **Number of NFTs**: 3 unique pieces
- **Smart Contract Framework**: Foundry
- **Storage for Metadata and Images**: IPFS

## Features

1. **ERC721-Compliant**: The smart contract adheres to the ERC721 standard for NFTs.
2. **IPFS Storage**: Metadata and images are securely stored and retrieved using IPFS.
3. **Deployable on Testnet**: Optimized for Sepolia, making it cost-effective for testing and experimentation.

## Setup and Deployment

### Prerequisites

- [Foundry](https://book.getfoundry.sh/) installed on your machine
- [Node.js](https://nodejs.org/) and [npm](https://www.npmjs.com/) installed
- A wallet with Sepolia ETH (can be obtained from a faucet)
- IPFS node or service like [Pinata](https://www.pinata.cloud/)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/6kim6krueger6/00NFT-project
   cd <repository_name>
   ```

2. Install dependencies:
   ```bash
   forge install
   ```

3. Add remappings for OpenZeppelin and Foundry Std libraries:
   ```toml
   [profile.default]
   libs = ["lib"]
   remappings = [
       '@openzeppelin/contracts=lib/openzeppelin-contracts/contracts/',
       'forge-std/=lib/forge-std/src/'
   ]
   ```

### Deployment Steps

1. Configure the deployment script in `script/` to point to the Sepolia testnet:

   ```solidity
   vm.startBroadcast();
   NFT(contractAddress).mint("<IPFS_URI>");
   vm.stopBroadcast();
   ```

2. Deploy the contract:
   ```bash
   forge script script/Deploy.s.sol:DeployNFT --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --broadcast
   ```

3. Verify the deployment by checking the contract on [Sepolia Etherscan](https://sepolia.etherscan.io/).

## Interacting with the Contract

- **Mint NFTs**:
  Use the provided script to mint NFTs with their respective metadata URIs stored on IPFS.

- **View on OpenSea**:
  Once deployed, NFTs can be viewed on OpenSea by searching for the contract address.

## File Structure

```plaintext
project/
├── src/
│   └── NFT.sol         # Smart contract source code
├── script/
│   ├── Deploy.s.sol    # Deployment script
│   └── MintNFT.s.sol   # Minting script
├── lib/
│   └── (dependencies)  # OpenZeppelin, Foundry Std
├── out/                # Compiled output
├── .env                # Environment variables
└── README.md           # Project overview (this file)
```

## Metadata Example

Here is an example of the metadata JSON stored on IPFS:

```json
{
  "name": "NFT #1",
  "description": "This is one of the 3 unique NFTs in the collection.",
  "image": "ipfs://<CID>/nft1.png",
  "attributes": [
    { "trait_type": "Rarity", "value": "Legendary" },
    { "trait_type": "Category", "value": "Art" }
  ]
}
```

## Troubleshooting

If you encounter issues:

- Ensure your Sepolia RPC URL and private key are correctly configured in `.env`.
- Verify your IPFS CIDs are valid and files are accessible.
- Check gas fees and Sepolia ETH balance for the deploying wallet.

## License

This project is licensed under the MIT License. See `LICENSE` for more details.

