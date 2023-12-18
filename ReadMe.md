# BlocProperties 

### Smart contract Real EState Application - SMARTER, SECURE & FASTER
---

BlocProperties is Proof of Concept Project; a real-estate property enlistment decentalized application integrated with the Ethereum Blockchain, using Ethereum Smart Contracts written in Solidity.It is platform that provides services for sell and rent  real estate launch in the property registry using smart contract.

##### Blockchain Technology
  Blockchain Technology has been adopted and adapted for use by the commercial real estate (CRE) industry. Blockchain technology can  potentially transform core CRE operations such as property  transactions like purchase, sale, financing, leasing, and management transactions.

  Blockchain technology has impacted the real estate industry in a  variety of ways, including offering a new means for buyers and  sellers to connect with one another.

  Blockchain could be used to cut intermediaries out of the real estate transaction process, thereby reducing costs.

  This technology could also help to codify the practice of fractional ownership of real estate.

##### Digital Wallet - Metamask
    * Software that manages private keys and converts it to blockchain address format.
    * It’s a so-called digital wallet that runs as a Chrome extension. It stores Ethereum assets and shows transactions.

##### Ethereum Gas
---
Gas refers to the fee, or pricing value, required to successfully conduct a transaction or execute a contract on the Ethereum blockchain platform.
  * Every single operation that takes part in Ethereum, be it a simple transaction, or a smart contract, or even an ICO takes some amount of gas.
  *  Incentivizes nodes for participating in the network and computing 
  * Miners get paid an amount in Ether which is equivalent to the total amount of gas it took them to execute a complete operation.In that 
  *  Motivates developers to deploy efficient code to optimize the use of deployed proticols

##### Smart contracts
A smart contract is an agreement that needs no external action to execute the terms of the contract. Once the conditions for its execution have been met, the smart contract completes the agreed actions automatically.

Blockchain technology maintains a record of transactions is maintained across several computers linked in a peer-to-peer network. This allows smart contracts to be self-executing, with the terms of the agreement between buyer and seller directly written into lines of code existing on a decentralized network.

Ethereum allows developers to write smart contracts which define the EVM* instructions. (Ethereum Virtual Machine, Decentralized database – allows functional code to be distributed along the decentralized set of nodes.)

Smart contracts render transactions traceable, transparent, and irreversible.
Ethereum Real Estate Contracts are Flexible as contracts may be written so that any number of final sales prices, reductions in price, or increases, can be triggered based on specific events agreed to by the parties.



## Getting Started 
Follow these instructions to get a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites and Installation
  * You need Node.js  ^8.0.0.
    Install Truffle
    npm install -g truffle
    Install Ganache or ganache-cli to run local Ethereum blockchain.
  * npm install -g ganache-cli

####  Installing the DApp

#### Clone the Repository 

https://github.com/max-clinch/BlocProperties-Enlistment-Project.git

  * Install dependencies
  
  npm install

###  NOTE: The Truffle Project is in the ethereum/ directory, where all the smart contracts and their corresponding test scripts reside.

 Compile the Smart Contracts.
 cd contract/
 truffle compile

#### Deploy the Smart contracts onto your network of choice (default "development"). Check Truffle docs for details.
  truffle migrate

##### Test the Smart contracts on your network of choice. Check Truffle docs for details.

  truffle test

## Property Enlistments

 * Property enlistment is the core entity in the project. This API allows to create property enlistment in a database. Once created, it should be validated and either approved or rejected. Aproval triggers the deployment of Ethereum smart contract.


 ### Get all enlistments

 This method allows to retreive all property enlistments available.

### Approve enlistment

Approve property enlistment after manual validation. Successful aproval triggers Ethereum smart contract deployment.

## Comtract ADDRESS 
##### Elistment contract: 0x1D8720774d98409730561f3552B1642B2655D208
#### RentContract: 0xf485944cc41aCe350D1891CF02756D5DA7aE4EdF
