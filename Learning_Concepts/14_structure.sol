// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

// Structur creation -> struncture = custom datatype -> here Student is our custom datatype
struct Student  {
    string name;
    uint roll;
}

contract studentDemo {
    // Creating a state var s1 which type is Student (Custom datatype)
    // 2 types of stytax
    Student public s1;
    Student public s2 = Student({
        name: "Harry",
        roll: 3
    });

    // Setting property of s1 by setter function
    function set_student(string memory _name, uint _roll) public {
        s1.name = _name;
        s1.roll = _roll;
    }

    // Modifying s1 
    function modify(string memory _new_name, uint _new_roll) public {
        // 2 types of syntax
        
        // s1.name = _new_name;
        // s1.roll = _new_roll;

        // Student memory new_student = Student({
        //     name: _new_name,
        //     roll: _new_roll
        // });

        // Also can do like this
        Student memory new_student = Student(_new_name,_new_roll);

        s1 = new_student;
    }
}