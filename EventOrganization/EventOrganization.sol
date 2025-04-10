// SPDX-License-Identifier: MIT
pragma solidity >=0.8.1 <0.9.0;

contract EventOrganization{

    struct Event{
    address organizer;
    string name;
    uint date;
    uint price;
    uint ticketCount;
    uint ticketRemaining;
    }
    
    mapping(uint => Event) public events; //all events

    mapping(address=>mapping(uint=>uint)) public tickets;

    uint public nextId;


    function CreateEvent(string calldata name, uint date, uint price, uint ticketCount) public{
        require(block.timestamp<date, "you cannot create event for past date");
        require(ticketCount>0,"invalid number of tickets");
        events[nextId] = Event(msg.sender,name,date,price,ticketCount,ticketCount);
        nextId++;
    }

    function BuyTicket(uint id, uint quantity) public payable{
        require(events[id].date!=0,"invalid event");
        require(events[id].date>block.timestamp, "the event has already passed!");
        Event storage _event = events[id];
        require(msg.value ==(_event.price * quantity),"wrong value");
        require(_event.ticketRemaining>=quantity, "you do not have enough tickets!");
        _event.ticketRemaining-=quantity;
        tickets[msg.sender][id]+=quantity;
    }
    
    function transferTickets(uint id, uint quantity, address to) public {
         require(events[id].date!=0,"invalid event");
        require(events[id].date>block.timestamp, "the event has already passed!");
        require(tickets[msg.sender][id]>=quantity, "you do not have enough tickets!");
        tickets[msg.sender][id]-=quantity;
        tickets[to][id]+=quantity;
    }
}

 