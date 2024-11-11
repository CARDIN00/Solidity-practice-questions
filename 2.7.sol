// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
//nested mapping to store grades of each student for multiple subjects.
// The structure should be mapping(address => mapping(string => uint)).
// set, retrieve, and update grades by student and subject.

contract studentScores{
    mapping(address => mapping(string=>uint)) public scoreInfo;

    function set(address _student, string memory _name, uint _score) public {
        scoreInfo[_student][_name] = _score;
    }

    function update (address _student, string memory _name, uint _score) public{
        require(scoreInfo[_student][_name] != 0, "the student does not exist" );
        scoreInfo[_student][_name]= _score;
    }

    function get(address _student, string memory _name) public view returns (uint){
        return scoreInfo[_student][_name];
    }
}