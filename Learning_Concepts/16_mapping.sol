// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

contract demo {

    struct Student {
        string name;
        uint class;
    }
    
    mapping(uint => Student) public students_list;

    function enroll_student(uint _role, string memory _name, uint _class) public{
        students_list[_role] = Student({
            name: _name,
            class: _class
        });
    }

}