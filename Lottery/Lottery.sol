// SPDX-License-Identifier: MIT
pragma solidity >=0.8.17 <0.9.0;

contract Lottery{
    address public manager;
    address payable[] public participants;

    constructor(){
        manager=msg.sender; //global variable 
    }

//    recieve balance
    receive() external payable {
        require(msg.value == 2 ether);
        participants.push(payable(msg.sender));
     }

    //   check balance
    function getBalance() public view returns (uint) {
        require(msg.sender == manager);
        return address(this).balance;
    }

    function Random() public view returns (uint){
     return uint(keccak256(abi.encodePacked(block.prevrandao, block.timestamp, participants.length)));
    }

    function winner() public {
        require(msg.sender == manager);
        require(participants.length >= 3);
        uint r = Random();
        address payable winnerp;
        uint index = r % participants.length;
        winnerp =participants[index];
        winnerp.transfer(getBalance());
        participants= new address payable[](0);
    }
}