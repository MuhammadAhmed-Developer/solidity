// SPDX-License-Identifier: MIT
pragma solidity >=0.8.9 <0.9.0;

contract pay{
    address payable user=payable(0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db);
    function payeth() public payable {

    }

    function checkblance() public view returns(uint){
        return address(this).balance;
    }

    function sendEth() public {
       user.transfer(2);
    }
}