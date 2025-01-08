// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * @title Codo
 * @dev A basic ERC20 token faucet contract that mints tokens and allows the owner to send tokens to users.
 * @notice Codo Testnet is a multichain cryptocurrency designed to be used across multiple blockchain networks.
 */
contract Codo is ERC20 {
    address public creator;
    uint256 public amount = 1;

    /**
     * @dev Modifier to check if the caller is the owner (creator) of the contract.
     */
    modifier isOwner() {
        require(msg.sender == creator, "only owner can do this");
        _;
    }

    /**
     * @notice Constructor to initialize the token with a name and symbol, and mint initial tokens to the creator.
     * The creator's address is set to the deployer's address.
     */
    constructor() ERC20("codo testnet", "CODO") {
        creator = msg.sender; 
        _mint(msg.sender, 100 * 10**uint256(decimals())); 
    }

    /**
     * @notice Allows the owner (creator) to send a fixed amount of tokens (1 token) to a specified address.
     * @param _userAddress The address of the user receiving the tokens.
     * @dev The function checks if the creator has enough balance before sending tokens.
     */
    function sendCodo(address _userAddress) public {
        require(balanceOf(creator) >= amount, "Insufficient balance");
        _transfer(creator, _userAddress, amount);
    }

    /**
     * @notice Allows the creator to mint more tokens to their own address (faucet refill).
     * @dev Only the creator (owner) can call this function to mint additional tokens.
     */
    function inventory() external isOwner {
        _mint(msg.sender, 100 * 10**uint256(decimals())); 
    }
}
