// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

contract DynArr {

    uint[] public arr = [1,2,3];

    // Basic functionality of array
    function set_element(uint index, uint element) public {
        arr[index] = element;
    }

    function length() public view returns(uint) {
        return arr.length;
    }

    function push(uint element) public {
        arr.push(element);
    }

    function pop() public {
        arr.pop();
    }

}