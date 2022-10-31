// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.5.0 ;

contract Problem {
    uint8 public account_balance = 0;

    function add_money(uint8 added_money) public {
        account_balance = account_balance + added_money;
    }
}