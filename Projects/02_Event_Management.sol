// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

contract EventManagement {
    struct Event {
        address payable organizer;
        string event_name;
        uint event_date; // unix date
        uint ticket_price;
        uint ticket_count;
    }
    address payable owner_contract;
    Event[] public events;
    mapping(address => mapping(uint => uint)) public tickets;


    constructor() {
        owner_contract = payable(msg.sender);
    }
    
    // Creating event
    function create_event(string memory _event_name, uint _event_date, uint _ticket_price, uint _ticket_count) public payable {
        // validate the event creationg
        require(msg.sender != owner_contract && msg.sender != address(0), "Enter a valid address or owner can't host an event");
        require(_event_date != 0 && _event_date > block.timestamp, "Please enter a valid date in future");
        require(_ticket_count > 0, "Please create some tickets");

        // Take charge from event organizer for paid events
        if (_ticket_price != 0) {
            require(msg.value == 1000 wei, "Please pay sufficient fund for organizing your event");
        }
    
        // creating new event and pushing into the array
        Event memory new_event = Event(payable(msg.sender),_event_name,_event_date,_ticket_price,_ticket_count);
        events.push(new_event);

        // pay fees for event creation to the owner of contract
        owner_contract.transfer(msg.value);
    }

    // Buying tickets of event
    function buy_ticket(uint _event_index, uint _ticket_quantity) public payable {
        // Ticket buying validation
        require(_event_index < events.length, "No events on this index.");
        require(events[_event_index].event_date > block.timestamp, "Sorry this show already finshed");
        require(_ticket_quantity != 0, "Please select some tickets");
        require(_ticket_quantity <= events[_event_index].ticket_count, "Sorry no more ticket left for this event");
        require(msg.value == events[_event_index].ticket_price * _ticket_quantity, "Transact sufficient fund for tickets");

        // Adding tickets of the selected event to the address of buyer
        tickets[msg.sender][_event_index] = _ticket_quantity;
        events[_event_index].ticket_count -= _ticket_quantity; // substract those purchased ticket
        payable(events[_event_index].organizer).transfer(msg.value); // send the ticket buying money to the organizer
            
    }

    // Sending ticket to someone
    function send_ticket(address _receiver, uint _event_index, uint _ticket_quantity) public {

        // validation for ticket sening
        require(_receiver != address(0), "Please enter a valid address of receiver");
        require(tickets[msg.sender][_event_index] >= _ticket_quantity, "You don't have enought ticket of this event to send");
        
        // sending those tickets
        tickets[msg.sender][_event_index] -= _ticket_quantity;
        tickets[_receiver][_event_index] += _ticket_quantity;
    }

}