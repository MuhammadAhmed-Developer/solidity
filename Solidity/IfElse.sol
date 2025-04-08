// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract IfElse {
    function check(int a) public pure returns (string memory) {
       string memory value; 
      if(a>0)
      {
        value = "greater then 0";
      }
      else if(a==0){
        value = "equal to 0";
      }
      else{
        value = "less then 0";
      }

      return  value;
    }
}