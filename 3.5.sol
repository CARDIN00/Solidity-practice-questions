// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
//Implement a contract to manage permissions
// where each address is mapped to a struct
//struct with fields for permission level and expiration time.
// Add functions to set permissions.
// if a user has valid permissions, and update their permission level.

contract Permissions{


    struct permissionDetail{
        uint permissionLevel; // eg 1,2,3...
        uint expiry;
    }

    mapping (address => permissionDetail) public  permission;

    function setPermission(address _user, uint _permissionlevel, uint _expire) public {
         permission[_user] = permissionDetail({
            permissionLevel : _permissionlevel,
            expiry : _expire
         });
    }

    function validity(address _user) public view returns(bool){
        // require(permission[_user].expiry > block.timestamp, "the permission has expired");
        // require(permission[_user].permissionLevel > 0);
        // return  true;
        return (permission[_user].expiry > block.timestamp  && permission[_user].permissionLevel > 0);
    }

    function updatelvl(address _user, uint _permissionlevel) public{
        require(validity(_user),"the permission is not valid");
        permission[_user].permissionLevel = _permissionlevel;
    }

}