// SPDX-License-Identifier: MIT
pragma solidity >=0.8.9 <0.9.0;

contract CrowdFunding{
    struct Request{
     string description;
     address payable recipient;
     uint value;
     bool completed;
     uint noOfVoters;
     mapping (address=>bool) voters;   
    }
    mapping(address=>uint) public contributors;
    mapping (uint=>Request) public requests;
    uint public numRequests;  
    address public manager;
    uint public minimumContributions;
    uint public deadline;
    uint public target; // target of money you want to get
    uint public raisedAmount;
    uint public noOfContributers;


   constructor(uint _target, uint _deadline){
     target=_target;
     deadline=block.timestamp+_deadline;
     minimumContributions= 100 wei;
     manager = msg.sender;
   }

   modifier onlyManager(){
    require (msg.sender==manager, "Only the manager can perform this action.");
     _;
   }

   function createRequests(string calldata _description, address payable _recipient, uint _value) public onlyManager {
     Request storage newRequest = requests[numRequests];
     numRequests++;
     newRequest.description = _description;
     newRequest.recipient=_recipient;
     newRequest.value=_value;
     newRequest.completed=false;
     newRequest.noOfVoters=0;
   }

  function contributions() public payable{
    require(block.timestamp<=deadline, "The deadline of the requests has been exceeded.");
    require(msg.value>=minimumContributions, "Minimum conribution is 100 wei");
    if(contributors[msg.sender]== 0){
        noOfContributers++;
    }
    contributors[msg.sender]+= msg.value;
    raisedAmount+=msg.value;
  }


  function getContractBalance() public view returns (uint){
    return address(this).balance;
  }

  function refund() public {
    require(block.timestamp>deadline && raisedAmount<target, "Youa are not elgibile for refund");
    require(contributors[msg.sender]>0, "You don't have any contributions");
    payable(msg.sender).transfer(contributors[msg.sender]);
    contributors[msg.sender]=0;
  }

  function voteRequest(uint _requestNo) public {
     require(contributors[msg.sender]>0, "You don't have any contributions.");
     Request storage thisRequest = requests[_requestNo];
     require(thisRequest.voters[msg.sender]==false,"You already voted for it!");
     thisRequest.voters[msg.sender]= true;
     thisRequest.noOfVoters++;
  }

  function makePayment(uint _requestNO) public onlyManager {
    require(raisedAmount>=target, "The target has not been reached.");
    Request storage thisRequest = requests[_requestNO];
    require(thisRequest.completed==false, "This request has already been completed");
    require(thisRequest.noOfVoters>noOfContributers/2, "There must be more than half of the contributors to make a payment.");
    thisRequest.recipient.transfer(thisRequest.value);
    thisRequest.completed=true;
  }

}