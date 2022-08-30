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

    event tweetCreated(
        address tweeter,
        uint256 id,
        string tweetText,
        string tweetImg,
        bool isDeleted,
        uint256 timestamp
    );

    event tweetDeleted(uint256 id, bool isDeleted);

    // Method to add a Tweet

    function addTweet(string memory tweetText, string memory tweetImg)
        public
        payable
    {
        require(msg.value == (0.01 ether), "Please submit 0.01 MATIC");
        tweet storage newTweet = Tweets[counter];
        newTweet.tweetText = tweetText;
        newTweet.tweetImg = tweetImg;
        newTweet.tweeter = msg.sender;
        newTweet.id = counter;
        newTweet.isDeleted = false;
        newTweet.timestamp = block.timestamp;
        emit tweetCreated(
            msg.sender,
            counter,
            tweetText,
            tweetImg,
            false,
            block.timestamp
        );
        counter++;
        payable(owner).transfer(msg.value);
    }

    // Method to fetch all tweets

    function getAllTweets() public view returns (tweet[] memory) {
        tweet[] memory temporary = new tweet[](counter);
        uint countTweets = 0;

        for (uint i = 0; i < counter; i++) {
            if (Tweets[i].isDeleted == false) {
                temporary[countTweets] = Tweets[i];
                countTweets++;
            }
        }

        tweet[] memory result = new tweet[](countTweets);
        for (uint i = 0; i < countTweets; i++) {
            result[i] = temporary[i];
        }

        return result;
    }

    // Method to get all tweets of a particular user

    function getMyTweets() external view returns (tweet[] memory) {
        tweet[] memory temporary = new tweet[](counter);
        uint countMyTweets = 0;

        for (uint i = 0; i < counter; i++) {
            if (Tweets[i].tweeter == msg.sender && Tweets[i].isDeleted == false) {
                temporary[countMyTweets] = Tweets[i];
                countMyTweets++;
            }
        }

        tweet[] memory result = new tweet[](countMyTweets);
        
        for (uint i = 0; i < countMyTweets; i++) {
            result[i] = temporary[i];
        }

        return result;
    }
}
