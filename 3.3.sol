// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
// a mapping to store employee information using a struct
// with fields for employee ID, name, and salary. 
// add an employee, update  salary, and fetch employee details by ID.

contract employeeDetails{
    struct empDetail{
        uint Id;
        string name;
        uint salary;
    }

    mapping(uint => empDetail) public empInfo;

    function set( uint _id, string memory _name , uint _salary) public{
        require(bytes(empInfo[_id].name).length ==0,"the employee already exists");
        empInfo[_id]= empDetail({ Id : _id, name : _name, salary :_salary});
    }

    function uodate( uint _id, uint _salary) public {// onlu update the salary.
        require(bytes(empInfo[_id].name).length !=0,"the employee does not exist");
        empInfo[_id].salary =_salary;
    }

    function fetch(uint _id) public view returns (empDetail memory){
        return empInfo[_id];// fetching through id.
    }
}