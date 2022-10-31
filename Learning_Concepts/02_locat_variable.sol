// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

contract Local {
    // Local var -> var inside function

    function getName() pure public returns(string memory) {
        string memory name   = "Udit"; // local variable
        // string by default store in storage so if you use it as local variable then you need to use memory keyword after string
        name = "Kundu"; // You can change local variable in normal way
        return name;
    }
}