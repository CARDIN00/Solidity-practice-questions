// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

//contract that maps uint IDs to string names
//, representing a database of items. 
//Add functions to insert, update, and fetch item names by their ID.

contract Items{
    mapping (uint => string) itemInfo;

    function insert(uint _id, string memory _name) public {
        itemInfo[_id] = _name;// assignes
    }

    function update(uint _id,string memory _name) public{
        require(bytes(itemInfo[_id]).length != 0,"the item does not exist");// checks if the bytes assigned are zero 
        itemInfo[_id] = _name; // uodates

    }

    function fetch(uint _id) public view  returns(string memory){
        return  itemInfo[_id];// fetches
    }
}