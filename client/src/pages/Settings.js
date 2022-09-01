import React, { useState } from "react";
import { Link } from "react-router-dom";
import "./Settings.css";
import { Input, Upload } from "@web3uikit/core";

const Settings = () => {
  const [profileFile, setProfileFile] = useState();
  const [bannerFile, setBannerFile] = useState();
  const [name, setName] = useState();
  const [bio, setBio] = useState();

  const bannerHandler = (event) => {
    if (event != null) {
      setBannerFile(event);
    }
  };

  const profileHandler = (event) => {
    if (event != null) {
      setProfileFile(event);
    }
  };

  return (
    <>
      <div className="settingsPage">
        <Input
          label="Name"
          name="NameChange"
          width="100%"
          labelBgColor="#141d26"
          onChange={(e) => setName(e.target.value)}
        />
        <Input
          label="Bio"
          name="BioChange"
          width="100%"
          labelBgColor="#141d26"
          onChange={(e) => setBio(e.target.value)}
        />
        <div className="pfp">Change Profile Image</div>
        <Upload onChange={profileHandler} />
        <div className="pfp">Change Banner Image</div>
        <Upload onChange={bannerHandler} />
        <div className="save">Save</div>
      </div>
    </>
  );
};

export default Settings;
