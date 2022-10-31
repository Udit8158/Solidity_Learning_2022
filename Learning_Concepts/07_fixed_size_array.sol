// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

contract FixedSizeArray {

    // Making a fixed size array -> where you need to fixed the size while creation
    // Also you can store only one type of values in an fixed array
    uint[4] public arr = [3,5,7,9];

    // Setting element of array by setter as it is a state variable
    function set_element_in_array(uint index, uint element) public {
        arr[index] = element;
    }

    // getter - length of array
    function length_of_arr() view public returns(uint) {
        return arr.length;
    }
}