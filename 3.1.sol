// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
//  mapping to store user profiles as structs, 
//with fields for name, age, and registration timestamp.
// add, update, and retrieve profiles by user address.

contract userProfile{
    struct userinfo{
        string name;
        uint age;
        uint timeStamp;
    }

    mapping (address => userinfo) public data;// mapping index with struct.

    function addInfo( string memory _name, uint _age) public{
        require(data[msg.sender].timeStamp ==0,"the user already exists");
        
        data[msg.sender] = userinfo({
            name : _name ,  age :_age ,  timeStamp :block.timestamp});//here we added for each element.
            //we used (block.timestamp) rather than updating the timestamo mannually
    }

    function updateInfo( string memory _name, uint _age) public{
        require(data[msg.sender].timeStamp !=0, "there is no data for the index value");// checks if the time stamp is zero or not
         data[msg.sender].name =_name;
         data[msg.sender].age =_age;
         data[msg.sender].timeStamp =block.timestamp;
         // we update each field individually
    }

    function retrieve(address _person) public view returns (userinfo memory){// return entire struct values
        return  data[_person];
    }
}