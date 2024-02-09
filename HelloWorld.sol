/ SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HelloWorldContract {
    string private greeting;
    address public owner;

    // Constructor to set the initial greeting
    constructor() {
        greeting = "Hello, World!";
        owner = msg.sender;
    }

    event Greeting(string previousMessage, string newMessage);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only contract owner can call this function");
        _;
    }

    // Function to get the current greeting
    function getGreeting() public view returns (string memory) {
        return greeting;
    }

    // Function to set a new greeting
    function setGreeting(string memory newGreeting) public onlyOwner {
        require(bytes(newGreeting).length > 0, "Message should not be empty");
        emit Greeting(greeting, newGreeting);
        greeting = newGreeting;
    }
}
