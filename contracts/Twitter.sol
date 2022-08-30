// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Twitter {
    address public owner;
    uint256 private counter; // represent ID of a tweet

    constructor() {
        owner = msg.sender;
        counter = 0;
    }

    struct tweet {
        address tweeter;
        uint256 id;
        string tweetText;
        string tweetImg;
        bool isDeleted;
        uint256 timestamp;
    }

    struct user {
        string name;
        string bio;
        string profileImg;
        string profileBanner;
    }

    mapping(uint256 => tweet) Tweets; // id to tweet struct
    mapping(address => user) Users; // address to a user struct

    event tweetCreated (
        address tweeter,
        uint256 id,
        string tweetText,
        string tweetImg,
        bool isDeleted,
        uint256 timestamp
    );

    event tweetDeleted (
        uint256 id,
        bool isDeleted
    );
}