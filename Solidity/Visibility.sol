// SPDX-License-Identifier: MIT
pragma solidity >=0.8.13 <0.9.0;

contract Visibility {
    function f1() public pure returns(uint){
        return 1;
    }
    function f2() private  pure returns(uint){
        return 2;
    }
    function f3() internal pure returns(uint){
        return 3;
    }
    function f4() external pure returns(uint){
        return 4;
    }
}

contract VisibilityTest is Visibility {
    uint public bx = f1();
}
// external contract
contract C{
    Visibility obj = new Visibility();
    uint public externals= obj.f1();
}