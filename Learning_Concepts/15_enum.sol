// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

contract Lottery {
    uint public lottery_amount = 100;

    enum user{won,loose} // means -> user.won = 0, user.loose = 1
    // uint user_1 = 1;
    user public user_1 = user.won; // means uint8 0

    function lottery_result() public {
        if (user_1 == user.won) {
            // lottery won
            lottery_amount = 0; // he collected all lottery amount
        } 
    }
}