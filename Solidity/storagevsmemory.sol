// SPDX-License-Identifier: MIT
pragma solidity >=0.8.4 <0.9.0;

contract demo {
    string[] public students=["ahmad", "faiq", "mohamed"];

    function mem() public view
    {
        string[] memory s1 = students;
        s1[0]="ali";
    } 
    function sto() public
    {
        string[] storage s1 = students;
        s1[0]="ali";
    } 
}