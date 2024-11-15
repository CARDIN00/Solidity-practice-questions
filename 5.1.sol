// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
//contract with two functions: 
//one accessible by everyone, another accessible only by specific address 
//that is set during contract deployment.
contract  AccessControl{
    // get access from owner
    address public  owner;
    constructor(){
        owner =msg.sender;
    }
    mapping(address => bool) public Access;

    modifier ownerAccess(){
        require(owner ==msg.sender );
        _;
    }
    bool public access =false; 

    function haveAccess(address _user)public ownerAccess {
        Access[_user] = true;
    }
    function accessibleByAll() public pure returns(string memory){
        return "accessible by all ";
    }

    function accessByFew()public view returns(string memory){
    require(Access[msg.sender] == true,"not accessible");
    return "you have the access to this function";
    }
}