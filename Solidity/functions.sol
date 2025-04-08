// SPDX-License-Identifier: MIT
pragma solidity >= 0.5.0 < 0.9.0;

contract functions {
    uint public age = 10;

    function get() public view returns (uint) {
        return age;
    }

    function Pure() public pure returns (uint) {
        uint roll = 100;
        return roll;
    }

    function set(uint newage) public{
        age = newage;
    }
}

// view vs pure

// view is only used where you can not modify but read state var
// Pure is only used where you cannot modify and use state var