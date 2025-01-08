const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("ERC_20", (m) => {
  const ERC = m.contract("Codo", [], {});

  return { ERC };
});
