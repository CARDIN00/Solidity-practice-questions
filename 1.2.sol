// SPDX-License-Identifier: MIT

// Create a contract with a modifier that only allows the owner to call a specific function.

pragma solidity ^0.8.7;

contract Ownercall{
    address public owner;

    modifier ownercall(){
        require(msg.sender == owner,"only the manager can call this function");
        _;
    }

    constructor(){
        owner = msg.sender;// construstor sets the deployer as owner.
    }

    function toCheck() public view ownercall returns(bool){
        return true;
    }
}

