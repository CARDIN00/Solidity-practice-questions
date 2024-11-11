// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
//keeps track of user subscriptions 
//using a mapping from addresses to subscription expiry timestamps.
// Add functions to subscribe a user for a given period,
// check if a subscription is active, and renew subscriptions.

contract Subscriptions{
    address public owner;
    mapping (address => uint) public  subTime;

    constructor(){
        owner = msg.sender;
    }

    function subscribe(address _user, uint _time) public {
        require(msg.sender ==owner,"only owner can change the subscription time");
        subTime[_user] = block.timestamp + _time;
    }

    function activeStatus(address _user) public view returns(bool){
        return subTime[_user] > block.timestamp;
    }

    function renew(address _user, uint _time) public {
        require(msg.sender == owner, " the owner can renew");
        require(subTime[_user] > block.timestamp, " please resubscribe");
        subTime[_user] +=_time;

    }
}