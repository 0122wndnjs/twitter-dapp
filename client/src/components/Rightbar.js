import React from "react";
import "./Rightbar.css";
import art1 from "../images/Art1.png";
import art2 from "../images/Art2.png";
import art3 from "../images/Art3.png";
import art4 from "../images/Art4.png";
import { Input } from "@web3uikit/core";
import { Search } from "@web3uikit/icons";

const Rightbar = () => {
  const trends = [
    {
      img: art1,
      text: "Art1 info",
      link: "#",
    },
    {
      img: art2,
      text: "Art2 info",
      link: "#",
    },
    {
      img: art3,
      text: "Art3 info",
      link: "#",
    },
    {
      img: art4,
      text: "Art4 info",
      link: "#",
    },
  ];
  return (
    <>
      <div className="rightbarContent">
        <Input
          label="Search Twitter"
          name="Search Twitter"
          prefixIcon={<Search />}
          labelBgColor="#141d26"
        ></Input>

        <div className="trends">
          Trending
          {trends.map((e) => {
            return (
              <>
                <div className="trend" onClick={() => window.open(e.link)}>
                  <img src={e.img} className="trendImg"></img>
                  <div className="trendText">{e.text}</div>
                </div>
              </>
            );
          })}
        </div>
      </div>
    </>
  );
};

export default Rightbar;
