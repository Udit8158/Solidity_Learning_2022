// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

contract Demo {
    // bytes array -> dynamic size byte array

    // bytes public b ; // 0x

    bytes public b = "abc";

    // Every elemnts of byte array -> 1 byte or 2 hexadecimal digit
    function get_element(uint i) public view returns(bytes1) {
        return b[i];
    }

    function length() public view returns(uint) {
        return b.length;
    }

    function push() public {
        b.push("e");
    }

    function pop() public {
        b.pop();
    }
}