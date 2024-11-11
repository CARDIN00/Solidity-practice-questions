// SPDX-License-Identifier: MIT

//Create a contract with an address variable. 
//Add functions to set and retrieve the address and verify if it matches a given address
pragma solidity ^0.8.7;

contract retrieve{
    address public  owner;

    function set(address _address )public {
        owner = _address;
    }

    function get() public view returns(address){
        return owner;
    }

    function check(address _address) public view returns(bool){
        return owner ==_address; // will return true or false
    }
}

