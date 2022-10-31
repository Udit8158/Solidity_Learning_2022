// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

contract PlayWithPrice {
    int public price = 30;
    // when we use public state variable you are not need of getter function

    // Getter function
    function get_price() public view returns(int) {
        return price;
    }

    // setter function
    function incriment_price() public  {
        price = price + 1;
    }

    // Taking parameter
    function set_price(int new_price) public {
        price = new_price;
    }

}