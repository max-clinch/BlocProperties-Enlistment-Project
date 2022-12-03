const HDWalletProvider = require('@truffle/hdwallet-provider');
const fs = require('fs');
const mnemonic = fs.readFileSync(".secret").toString().trim();
require('dotenv').config(); // Load .env file


module.exports = {
  networks: {
    matic: {
      //provider: () => new HDWalletProvider(process.env.mnemonic, `https://polygon-mumbai.infura.io/v3/4458cf4d1689497b9a38b1d6bbf05e78`),
      host: "127.0.0.1",     // Localhost (default: none)
      port: 8545,            // Standard Ethereum port (default: none)
      network_id: 80001,
      gas: 5500000,       // Any network (default: none)
    },
    matic: {
      provider: () => new HDWalletProvider(process.env.mnemonic, `https://polygon-mumbai.infura.io/v3/4458cf4d1689497b9a38b1d6bbf05e78`),
      network_id: 80001,
      confirmations: 2,
      timeoutBlocks: 2,
      skipDryRun: true,
      gas:  4612388,
      //gasPrice: 10000000000,

    },
  },

  // Set default mocha options here, use special reporters etc.
  mocha: {
    // timeout: 100000
  },

  // Configure your compilers
  compilers: {
    solc: {
        //version: "0.8.13",
    }
  }
}