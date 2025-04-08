// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Loops{
    // while
    //  for
    // do-while

    uint[3] public arr;
    uint public count;

// function loop() public {
//     while(count < arr.length){
//         arr[count]= count;
//         count++;
//     }
// }
// function Forloop() public {
//     for(uint i=count;i < arr.length; i++){
//     arr[count] = count;
//     count++;
//     }
// }
function Doloop() public {
    do{
        arr[count]=count;
        count ++;
    }while(count < arr.length);
}

}