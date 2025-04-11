// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 < 0.9.0;

contract Pledge {
    struct PledgeStruct{
    string name;
    string message;
    uint amount;
    uint time;
    }
    mapping(uint => PledgeStruct) public pledges;
    uint public numRequests; 
    event NewPledge(string name, string message, uint amount, uint time); 

       function addPledge(string calldata _name, string calldata _msg) public payable {
        require(msg.value > 0);
        pledges[numRequests] = PledgeStruct({
            name: _name,
            message: _msg,
            amount: msg.value,
            time: block.timestamp
        });
        emit NewPledge(_name ,_msg,(msg.value),block.timestamp);
        numRequests++;
    }
}