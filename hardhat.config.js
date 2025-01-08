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
    bitfinityTestnet: {
      url: "https://testnet.bitfinity.network",
      chainId: 355113,
      accounts: [process.env.PRIVATE_KEY],
    },
  },
};
