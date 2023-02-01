// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {
    address public owner;


    constructor(){
        owner = msg.sender;
    }

    function deposit() public payable {}

    function withdraw(uint amount) public {
        require(msg.sender == owner, "You aren't the owner");
        require(address(this).balance >= amount, "Not enough funds");

        payable(msg.sender).transfer(amount);
    }
}
