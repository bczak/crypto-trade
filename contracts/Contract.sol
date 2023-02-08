// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract Contract {
    AggregatorV3Interface internal btcPriceFeed;

    enum Side {
        long, short
    }

    struct Position {
        uint entryPrice;
        uint leverage;
        int size;
    }

    address public owner;
    mapping(Side => Position) shorts;
    mapping(Side => Position) longs;
    
    constructor(){
        owner = msg.sender;
        btcPriceFeed = AggregatorV3Interface();
    }


    function openPosition(string memory symbol, Side side, int size, int leverage) public payable {
        require(msg.sender == owner, "You aren't the owner");

    }




    function deposit() public payable {}

    function withdraw(uint amount) public {
        require(msg.sender == owner, "You aren't the owner");
        require(address(this).balance >= amount, "Not enough funds");

        payable(msg.sender).transfer(amount);
    }
}
