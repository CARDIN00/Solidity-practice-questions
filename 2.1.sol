// SPDX-License-Identifier: MIT

//Create a contract that stores user balances using a mapping, 
//with functions to deposit and check balance.
pragma solidity ^0.8.7;

contract UserValance{
    mapping (address => uint) public balance;

    function deposite()public payable {
        balance[msg.sender] += msg.value;
    }
    function check()view public returns(uint){
        return  balance[msg.sender];
    }

}

