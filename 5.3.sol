// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
//assign  roles to addresses.
// functions to assign roles, check an address’s role, 
//and restrict certain functions based on these roles.

contract roleBasef{
    address public owner;
    constructor(){
        owner = msg.sender;
    }

    mapping (address => string) public roleassigned;
    
    modifier Ownercall(){
        require(msg.sender == owner);
        _;
    }

    function assignrole(address _user, string memory _role) public Ownercall{
        roleassigned[_user] = _role;
    }

    function checkRole(address _user) public view returns(string memory){
        return roleassigned[_user];
    }


    
    


}