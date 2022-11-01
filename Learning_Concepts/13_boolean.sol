// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

contract BOOL{
    bool public value; // default -> false

    function setter() public  {
        value = !value; // opposite value
    }
}