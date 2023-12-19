// contract will:
//      collect funds from user
//      withdraw funds
//      set a minimum funding value in USD
// this is basically a decentralized web3 kickstarter (crowdfunding)

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    
    uint256 public minimumUsd = 5e18;

    function fund() public payable  {

       
        require(getConversionRate(msg.value) >= minimumUsd, "did not send enough ETH"); 
//      require(msg.value >= 1e18);   1e18 = 1 eth also = 1000000000000000000 gwei


    }

//    function withdraw() public {}

  function getPrice() public view returns(uint256){
   AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
   (uint80 roundId, int256 price, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound) = priceFeed.latestRoundData();
 
   return uint256(price * 1e10);
}


    function getConversionRate(uint256 ethAmount) public view returns(uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;  
        return ethAmountInUsd;


    }

    function getVersion() public view returns (uint256){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }





}