// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//contract that uses a mapping to store usernames associated with user balances 
//Implement functions to add a user, update their balance,
// and retrieve their balance.

contract Balances{
    mapping (string => uint) public balanceInfo;

    function addUser(string memory _user , uint _intitalAmount) public{
        require(balanceInfo[_user] == 0, "user already exists");
        balanceInfo[_user] = _intitalAmount;
    }

    function updateInfo(string memory _user) public payable {
        balanceInfo[_user] += msg.value;
    }

    function getBalance(string memory _user) public view returns(uint){
        return balanceInfo[_user];
    }
}