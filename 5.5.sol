// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
//contract that requires a fee to access certain functions 
//but allows the owner and admins to bypass this fee.

contract FeeContract {
    receive() external payable {}// makes the contract recievable
     function checkbal() public view returns(uint){
        return address(this).balance;//returs the contract balance
    }


    address public Owner;
    uint public accessFee;

    enum Role{user, owner,admin, none}

    mapping (address =>Role) public Access;

    constructor( uint _accessFee){
        Owner = msg.sender;
        Access[Owner]= Role.owner;
        accessFee =_accessFee;
    }

    modifier owenrFunction(){
        require(msg.sender ==Owner);
        _;
    }
    modifier adminOwner(){
        require(Access[msg.sender] == Role.owner || Access[msg.sender]== Role.admin);
        _;
    }
    modifier feeRequired(){
        if(Access[msg.sender]!= Role.admin || Access[msg.sender]!= Role.owner){
            require(msg.value>= accessFee);
        }
        _;
    }

    function assignRole(address _user, Role _role)public owenrFunction {
        Access[_user] = _role;
    }

    function nofeeRequired() public payable feeRequired returns (string memory){
        return "access granted";
    }

    function withdrawBalance()public owenrFunction{
        payable (Owner).transfer(address(this).balance);
    }

    
    

}