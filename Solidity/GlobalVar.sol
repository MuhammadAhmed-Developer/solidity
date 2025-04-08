// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 < 0.9.0;

contract globalvar {
    function demo() public view returns (uint block_no, uint timestamp, address sender){
         return (block.number, block.timestamp, msg.sender);
    }
}

// https://docs.soliditylang.org/en/v0.8.6/units-and-global-variables.html