// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract Enum {
    enum user{
        allowed,
        denied,
        waiting
    }

    user public u1=user.waiting;
}