import React from "react";
import { Link } from "react-router-dom";
import "./Profile.css";
import { defaultImgs } from "../defaultImgs";
import TweetInFeed from "../components/TweetInFeed";

const Profile = () => {
  return (
    <>
      <img className="profileBanner" src={defaultImgs[1]} />
      <div className="pfpContainer">
        <img className="profilePFP" src={defaultImgs[0]} />
        <div className="profileName">Joowon Kim</div>
        <div className="profileWallet">0x412351235123</div>
        <Link to="./settings">
          <div className="profileEdit">Edit Profile</div>
        </Link>
        <div className="profileBio">A middle class web3 developer</div>
        <div className="profileTabs">
          <div className="profileTab">Your Tweets</div>
        </div>
      </div>
      <TweetInFeed profile={true}></TweetInFeed>
    </>
  );
};

export default Profile;
