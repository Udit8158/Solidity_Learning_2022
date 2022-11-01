// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

contract A {

    function f1() public pure returns(uint) {
        return 1;
    }

     function f2() private pure returns(uint) {
        return 2;
    }

     function f3() internal pure returns(uint) {
        return 3;
    }

     function f4() external pure returns(uint) {
        return 4;
    }

    // within contract
    uint a = f1(); //valid
    uint b = f2(); //valid
    uint c = f3(); //valid
    // uint d = f4(); // invalid 

}

// Inherits from contract A
// Derived contract situation
contract B is A {
    // Derived contract
    uint ax = f1(); //valid
    // uint bx = f2(); //invalid
    uint cx = f3(); //valid
    // uint dx = f4(); // invalid -> actually it is visible in deployment but invalid as for derived contract also f4 is in B in backend, so same situation like within contract
}

contract C {
    // Other contract

    // Making obj from contract (class) A
    
    A obj_contract_A = new A();
    uint ay = obj_contract_A.f1(); //valid
    // uint by = obj_contract_A.f2(); //invalid
    // uint cy = obj_contract_A.f3(); //invalid
    uint dy = obj_contract_A.f4(); // invalid 
}