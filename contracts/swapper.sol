// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// 0x7D1AfA7B718fb893dB30A3aBc0Cfc608AaCfeBB0 matic contract address

// 0xae7ab96520DE3A18E5e111B5EaAb095312D7fE84 stETH contract address

contract swapper {

     address owner;
     uint256 decimal = 1e18;
     AggregatorV3Interface private pricefeeddai;
     AggregatorV3Interface private pricefeedusd;
     AggregatorV3Interface private pricefeedeth;
     AggregatorV3Interface private pricefeedbat;

     

     mapping (address => int) pool;

     
    constructor() {
        owner = msg.sender;
        pricefeeddai = AggregatorV3Interface(0x773616E4d11A78F511299002da57A0a94577F1f4);
        pricefeedeth = AggregatorV3Interface(0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419);
        pricefeedbat = AggregatorV3Interface(0x0d16d4528239e9ee52fa531af613AcdB23D88c94);
    }


       function getLatestPrice (AggregatorV3Interface pricefeed) public view returns (uint80 roundID, int price,uint startedAt,uint timeStamp,
        uint80 answeredInRound) {
        (roundID, price,startedAt,timeStamp,answeredInRound) = pricefeed.latestRoundData();

    } 

   

        // function swap(uint tokenamount) public {
       

        // (, int price, , , ) = priceFeed.latestRoundData();

        //  uint token2Amount = (_amount * uint(price)) / (10 ** 18)

        // token1.transferFrom(msg.sender, address(this), token2Amount);
        // token2.transfer(msg.sender, token2Amount);
    }

