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

    // Using modifier for not repeating our code
    modifier only_manager() {
        require(msg.sender == manager, "Only manager can do it");
        
        _;
    }

    // Except manager
    function buy_lottery() payable public {
        require(msg.sender != manager, "Manager can't do it.");
        require(msg.value == 10 ether, "Please pay complete lottery price");
        participants.push(payable(msg.sender));
    }

    // Manager only
    function show_balance() public view only_manager returns(uint){
        return address(this).balance;
    }

    // Manager only
    function random_number_generator() public view only_manager returns(uint) {
        return uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, participants.length))) % participants.length;
    }

    // Manger only
    function select_winner() public only_manager returns(address) {
        require(participants.length >= 3, "No enough paticipants to start the lottery");

        winner = participants[random_number_generator()];
        payable(winner).transfer(show_balance() - 1 ether);
        payable(manager).transfer(1 ether);

        address[] memory blank_array;
        participants = blank_array;
        return winner;
    }
}