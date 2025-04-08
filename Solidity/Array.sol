// SPDX-License-Identifier: MIT
pragma solidity >=0.8.1 <0.9.0;

contract Array {
    // uint[5] public testArray = [2,3,4,6];

    // function setter(uint index, uint value) public {
    //     testArray[index] = value;
    // }

    // function lenght() public view returns(uint){
    //     return testArray.length;
    // }


    //  dynamic array

    // uint[] public arr;

    // function push(uint item) public {
    //      arr.push(item);
    // }

    // 1 byte = 8 bits
    // 1 hexadecimal digit = 4 bits
    // Everything that will be stored in the byte array will be in the form of hexadecimal digits

// byte array

//    bytes3 public b3; // 3 bytes array
//    bytes2 public  b2; // 2 bytes array

//    function setter() public  {
//     b3 = "abc";
//     b2= "ab";
//    }


// dynamic byte array

  bytes public b1 = "abc";

  function push() public {
    b1.push("d");
  }

  function getElement(uint i) public view returns (bytes1){
    return  b1[i];
  }

}