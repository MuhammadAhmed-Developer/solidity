// SPDX-License-Identifier: MIT
pragma solidity >= 0.5.0;

contract locla {
    uint8 public money=255;

    function setter() public {
        money = money+1;
    }
}