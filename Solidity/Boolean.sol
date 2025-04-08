// SPDX-License-Identifier: MIT
pragma solidity >=0.8.9 <0.9.0;

contract Bool {
    bool public value;

    function check(uint a) public returns (bool){
        if(a==10){
            value=true;
            return value;
        }else {
            value = false;
            return value;
        }
    }
}