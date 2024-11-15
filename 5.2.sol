// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
//contract where only the contract deployer can update a stored message.
// Add a public function to retrieve the message,
// restrict the update function to the deployer only.

contract ContractDev{
    address public deployer;
    string private message;

    constructor(){
        deployer = msg.sender;
    }

    modifier owner(){
        require(msg.sender == deployer);
        _;
    }
    function getMessage() public view returns(string memory){
        return message;
    }

    function update(string memory _updated)public owner {
        message = _updated;
    }


}