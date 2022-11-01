// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

contract demo {
    mapping(uint => string) public id;

    function setter(uint _id, string memory _name) public{
        id[_id] = _name;
    }

}