// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

contract Pay {
    // address public contract_address = address(this) ;
    // uint public contract_balance = contract_address.balance;

    address payable user_address = payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
    // This is function get ether in contract address from deploying address
    function get_ether() public payable {} 

    function show_balance() public view returns(uint) {
        return address(this).balance;
    }

    function send_ether() public {
        user_address.transfer(1 ether);
    }
}