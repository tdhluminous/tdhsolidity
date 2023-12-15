// contract will:
//      collect funds from user
//      withdraw funds
//      set a minimum funding value in USD
// this is basically a decentralized web3 kickstarter (crowdfunding)

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    
    uint256 public minimumUsd = 5;

    function fund() public payable  {

       
        require(msg.value >= minimumUsd, "must send at least 5 dollars"); 
//      require(msg.value >= 1e18);   1e18 = 1 eth also = 1000000000000000000 gwei


    }

//    function withdraw() public {}

    function getPrice() public{

        // address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        //ABI
    }

    function getConversionRate() public {}

    function getVersion() public view returns (uint256){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }





}