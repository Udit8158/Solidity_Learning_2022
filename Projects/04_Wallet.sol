// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Wallet {
    // mapping (uint => mapping(address => uint)) public users;
    struct User {
        uint user_id;
        uint balance;
        bool is_our_user;
    }
    mapping(address => User) public users;
    uint public user_count = 0; 

    mapping(address => mapping(address => uint)) public transations;
    uint transation_count = 0;

    function create() public{
       require(users[msg.sender].is_our_user == false, "You all ready our user");
       users[msg.sender] = User(user_count + 1,msg.sender.balance,true);
        user_count ++;
    }

    function send(address _recepient) public payable{
        require(users[msg.sender].user_id > 0,"Please create your wallet to transfer");
        // require(_user_id <= user_count, "Not a valid user now");
        require(users[_recepient].user_id > 0,"Recipent is not using our wallet.");
        payable(_recepient).transfer(msg.value);

        transations[msg.sender][_recepient] = msg.value;
        transation_count ++;
    }

    function check_balance() public view returns(uint _bal)  {
        require(users[msg.sender].user_id > 0,"Please create your wallet to check balance");
        _bal = users[msg.sender].balance;
    }
}