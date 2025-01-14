require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.24",
  optimizer: {
    enabled: true,
    runs: 200,
  },
  networks: {
    moon: {
      url: "https://rpc.testnet.moonbeam.network",
      chainId: 1287,
      accounts: [process.env.PRIVATE_KEY],
    },
  },
};
