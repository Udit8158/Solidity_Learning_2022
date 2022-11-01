// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

contract Conditional {
    function check(int input) public pure returns(string memory) {
        string memory result;

        if (input == 0) {
            result = "Equal to zero";
        } else if (input > 0) {
            result = "Greater than zero";
        } else {
            result = "Lesser than zero";
        }

        return result;
    }
}