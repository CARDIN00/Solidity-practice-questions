// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
//each user (address) has a mapping of the friends' addresses (as keys)
// with a boolean indicating friendship status. 
//add and remove friends, and  check if two addresses are friends.


contract Friendship{
    mapping (address => mapping (address => bool)) public friends;
    
    function addFriend(address p1, address p2 ) public{
        require( !friends[p1][p2],"the two are already friends");
        friends[p1][p2] = true;
        friends[p2][p1] =true;
    }

    function remove(address p1, address p2 ) public {
        require(friends[p1][p2] ,"the two are not friends");
        friends[p1][p2] =false;
        friends[p2][p1] =false;
    }

    function viewStatus(address p1, address p2) public view returns (bool){
        return friends[p1][p2];
    }
}