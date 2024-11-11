// SPDX-License-Identifier: MIT

//Implement a contract with a function that updates a variable 
//and uses a modifier to restrict access based on a condition.
pragma solidity ^0.8.7;

contract Updater{
    uint public variable;

    modifier restrict(){
        require(variable>=10);
        _;
    }

    function update(uint _x) public restrict{
        variable = _x;
    } 
}

