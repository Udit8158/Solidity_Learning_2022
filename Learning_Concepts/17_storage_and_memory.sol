// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

contract Demo {
    uint[] public arr1 = [1,2,3]; // This store in storage

    function sto() public {
        uint[] storage arr2 = arr1; // This store in storage -> so now arr2 is pointing arr1

        arr2[0] = 0; // so now arr1[0] changed
    }

    function mem() public view{
        uint[] memory arr2 = arr1; // This store in memory -> so now arr2 copied arr1 elements not pointing

        arr2[0] = 0; // so now arr1[0] unchanged

        
    }
}