// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

contract Demo {
    // Defining byte array -> Fixed size bite array
    bytes2 public b2; // bytes2 -> datatype of 2byte array -> array of 2 bytes -> 16 bits -> 4 hexadecimal values can be stored
    // extra spaces in the array -> 0 
    // now by default all spaces are 0
    bytes3 public b3;

    function setter() public  {
        b2 = "ab";
        b3 = "ab";
        
    }

    function getter(uint index) public view returns(byte) {
        return b2[index];
    }
}