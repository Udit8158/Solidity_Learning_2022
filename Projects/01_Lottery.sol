// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

// Rule : -> Here we have array of participants who buy lotter ticket with 10 ether and a adress can buy multiple lottery 
// and its probability will increase as in array the address has multiple time, this participants address are payable, to start
// lottery we need to have atlease 3 participants address. Here a manager address start lottery and select winner randomly.
// Then manger got 1 ether and rest got the winner.

contract Lottery {
    address public manager;
    address[] public participants;
    address public winner;

    constructor() {
        manager = msg.sender;
    }

    // Except manager
    function buy_lottery() payable public {
        require(msg.sender != manager);
        require(msg.value == 10 ether);
        participants.push(payable(msg.sender));
    }

    // Manager only
    function show_balance() public view returns(uint){
        require(msg.sender == manager);
        return address(this).balance;
    }

    // Manager only
    function random_number_generator() public view returns(uint) {
        require(msg.sender == manager);
        return uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, participants.length))) % participants.length;
    }

    // Manger only
    function select_winner() public returns(address) {
        require(msg.sender == manager);
        require(participants.length >= 3);

        winner = participants[random_number_generator()];
        payable(winner).transfer(show_balance() - 1 ether);
        payable(manager).transfer(1 ether);
        return winner;
    }
}