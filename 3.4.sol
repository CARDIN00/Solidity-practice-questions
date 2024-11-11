// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
// Write a contract to implement a voting system using mappings. 
//Create a mapping of candidate names to vote counts 
//and a mapping of voter addresses to a boolean indicating if they’ve voted. 
//functions to vote for  candidate, if an address has voted, retrieve vote counts.

contract voteSystem{
    mapping(string => uint) public voteCount;
    mapping(address =>bool) public voteStatus;

    //can only vote once
    

    function vote(string memory _candidate) public{
        require(voteStatus[msg.sender] ==false,"the person has already voted");
        voteCount[_candidate] +=1;
        voteStatus[msg.sender] =true;
    }

    function checkStatus () public view returns (bool) {// check the vote status of the voter
        return  voteStatus[msg.sender];
    }

    function count(string memory _candidate) public view returns (uint){
        return voteCount[_candidate];
    }


}