// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// 0x7D1AfA7B718fb893dB30A3aBc0Cfc608AaCfeBB0 matic contract address

// 0xae7ab96520DE3A18E5e111B5EaAb095312D7fE84 stETH contract address

contract swapper {

     address owner;
     uint256 decimal = 18;
     AggregatorV3Interface pricefeed;

     int256[] currentprice;

     mapping (address => currentprice) name;

     
    constructor() {
        owner = msg.sender;
        pricefeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    }

   

        function swap(uint _amount) public {
       

        (, int price, , , ) = priceFeed.latestRoundData();

        uint priceDecimals = uint(price) * (10 ** (token2Decimals - token1Decimals));
        uint token2Amount = (_amount * priceDecimals) / (10 ** token1Decimals);

        token1.transferFrom(msg.sender, address(this), _amount);
        token2.transfer(msg.sender, token2Amount);
    }




}