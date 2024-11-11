// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
// maps each user’s address to their unique ID
// and maintains an array of all user addresses. 
//add a new user, retrieve a user by their ID, 
//return the full list of users.

contract Userlist{
    mapping(address => uint) public userId;
    mapping (uint => address) public IdtoAddress;// reverse mapping
    address[] public addresses;

    // no two ID's are same

    function isUnique(uint _newid) public view returns (bool) {
        for(uint i =0; i< addresses.length;i++){
            if(userId[addresses[i]] == _newid){//etrieves the unique  ID associated with  address[i]
                return false;
            } 
        }
        return true;
    }

    function addUser(address _newuser, uint _newid) public {
        require(isUnique(_newid));
        require(userId[_newuser] == 0);
        userId[_newuser] = _newid;
        IdtoAddress[_newid] = _newuser;
        addresses.push(_newuser);
    }

    function retrieve(uint _id) public view returns (address){
        require(IdtoAddress[_id] != address(0), "Id does not exist");
        return IdtoAddress[_id];
    }

    function userList() public view returns (address[] memory){
        return addresses;
    }


}