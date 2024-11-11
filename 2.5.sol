// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//Write a contract that maps addresses to boolean values,
// representing if a user has completed a specific action.
// Add functions to set an address as “completed” 
//and check if a particular address has completed the action.

contract actionComplete{
    mapping (address => bool) public hasCompleted;

    function setCompleted(address _user) public {
        hasCompleted[_user] = true;// sets the bool value true for the given user
    }

    function checkStatus( address _user) public view returns(bool){
        return hasCompleted[_user];// returns bool value for any user 
    }
}