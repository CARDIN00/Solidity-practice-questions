// SPDX-License-Identifier: MIT

//Write a contract using a mapping to store a list of student names (string) 
//and their scores (uint).
pragma solidity ^0.8.7;

contract studentInfo{
    mapping(string => uint) public scoreInfo;

    function setInfo(string memory _name, uint _score) public  {
        scoreInfo[_name] = _score;
    }
    function getInfo(string memory _name) public view returns(uint){
        return scoreInfo[_name];
    }
}

