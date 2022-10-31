// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

contract State {
    // Variable in the scope of a contract -> state variable
    // State variables are also stored in contract storage -> means more state var == more gas fee

    uint public age; // By default it stores age in to storage and value = 1
    // public is used to see this on deployment
    // age = 10; // can't set state variable by this.

    string public name = "Udit";

    // Setting value of state variable by setter function
    function setAge() public {
        age = 18;
    }
}