// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract constructors {
    uint public count;

    constructor(uint new_count){
        count = new_count;
    }
}


// Executed only once
// you can create only one constructor and that is optional
// 