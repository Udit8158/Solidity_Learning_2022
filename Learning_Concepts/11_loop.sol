// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

contract Loop {
    uint[4] public arr;

    function loop() public {
        // while loop 

        // uint count = 0;
        // while (count < arr.length) {
        //     arr[count] = count;
        //     count ++;
        // }

        // for loop

        for (uint i = 0; i < arr.length; i ++) {
            arr[i] = i;
        }

        // also we have do-while loop -> where code in do {} and logic in while()
    }
}