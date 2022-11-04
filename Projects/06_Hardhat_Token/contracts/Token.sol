// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
import "hardhat/console.sol";

contract Token {
    // Token details
    string public tokenName = "Hardhat Token";
    string public tokenSymbol = "HHT";
    uint public maxSupply = 1000;

    // Owner of token in first
    address public owner;
    mapping(address => uint) public balances; // store all addresses with balace in HHT token

    constructor() {
        // owner => max supply
        owner = msg.sender;
        balances[owner] = maxSupply;
    }

    function getBalance(address account) public view returns (uint) {
        return balances[account];
    }

    function transfer(address recipient, uint amount) public {
        require(balances[msg.sender] >= amount, "Not enough balance");
        console.log("##### %s -> %s   [%s] HHT", msg.sender, recipient, amount); // using js and sol
        balances[msg.sender] -= amount;
        balances[recipient] += amount;
    }
}
