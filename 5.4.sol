// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
//assign "admin" and "user" roles to addresses.
// functions to assign roles, check an address’s role, 
//and restrict certain functions based on these roles.

contract roleBasef{
    address public owner;

    enum Roles{ none,admin , user}

    mapping (address => Roles) public roleassigned;

    constructor(){
        owner = msg.sender;
        roleassigned[owner] = Roles.admin; 
    }
    
    modifier Ownercall(){
        require(msg.sender == owner);
        _;
    }

    function assignRole(address _user, Roles _role) public Ownercall{
        roleassigned[_user]= _role;
    }

    function checkrole(address _user) public view returns(string memory){
        if(roleassigned[_user] == Roles.admin){
            return  "Admin";
        }
        if(roleassigned[_user] == Roles.none){
            return "no role";
        }
        else{
            return " User";
        }
    }

    function call1() public view returns (string memory){
        require(roleassigned[msg.sender] == Roles.admin || roleassigned[msg.sender] == Roles.user);
        return "this func can be called by the user and the admin only";
    }
    


}