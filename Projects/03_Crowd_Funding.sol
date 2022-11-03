// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract CrowdFunding {
    address payable manager;
    uint target_amount;
    uint deadline;
    uint min_donation;

    uint public donated_amount;
    uint public donator_count;

    mapping(address => uint) public donators;

    
    struct Request {
        string description;
        uint amount;
        address recepient;
        bool is_completed;
        mapping (address => bool) voters;    // false -> not agree and true -> agree
        uint voter_number;
    }

    mapping (uint => Request) public requests;
    uint number_of_request;

    constructor(uint _target_amount, uint _deadline, uint _min_donation) {
        manager = payable(msg.sender);
        target_amount = _target_amount;
        deadline = block.timestamp + _deadline;
        min_donation = _min_donation;
    }

    function donate() public payable{
        require(msg.sender != manager, "You can't donate");
        require(msg.value >= min_donation, "Please donated atlease min donation");
        require(block.timestamp < deadline, "Deadline crossed");

        if (donators[msg.sender] == 0) {
            donators[msg.sender] = msg.value;
            donator_count ++;
        } else {
            donators[msg.sender] += msg.value;
        }

        donated_amount += msg.value;
        
    }

    function refund(uint _refund_amount) public {
        require(block.timestamp > deadline && donated_amount < target_amount, "You are not eligble for refund now");
        require(donators[msg.sender] >= _refund_amount);

        payable(msg.sender).transfer(_refund_amount);
        donators[msg.sender] -= _refund_amount;

        if (donators[msg.sender] == 0) {
            donator_count --;
        }
    }

    function create_request(string memory _description, uint _amount, address _recepient) public {
        require(msg.sender == manager, "Only manager can do it.");
        require(donated_amount  >= _amount,"Insufficent donated amount.");
        require(_recepient != address(0), "Address is not valid");

        Request storage new_request = requests[number_of_request];
        number_of_request ++;
        new_request.description = _description;
        new_request.amount = _amount;
        new_request.recepient = _recepient;
        new_request.is_completed = false;
    }

    function vote(uint _request_index) public {
        require(donators[msg.sender] != 0, "You are not eligible for voting");
        require(requests[_request_index].recepient != address(0), "Not a valid request");
        
        require(requests[_request_index].voters[msg.sender] == false, "You already voted");

        requests[_request_index].voters[msg.sender] = true;
        requests[_request_index].voter_number ++;
    }

    function transfer_money(uint _request_index) public {
        require(requests[_request_index].is_completed == false, "This req is already completed");
        require(msg.sender == manager,"Not accessable for you");
        require(requests[_request_index].recepient != address(0), "Not a valid request");
        require(requests[_request_index].voter_number >= donator_count/2, "It is not majority chosen");

        payable(requests[_request_index].recepient).transfer(requests[_request_index].amount);
        requests[_request_index].is_completed = true;

    } 



}