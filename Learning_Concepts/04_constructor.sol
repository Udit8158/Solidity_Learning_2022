// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

contract State {
    int public count;

    // changing state variable using constructor
    constructor(int new_count) {
        count = new_count;
    }
}