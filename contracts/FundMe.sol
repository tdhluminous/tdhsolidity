// contract will:
//      collect funds from user
//      withdraw funds
//      set a minimum funding value in USD
// this is basically a decentralized web3 kickstarter (crowdfunding)

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {

    using PriceConverter for uint256;

    uint256 public minimumUsd = 5e18;

    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function fund() public payable  {
        msg.value.getConversionRate();

       
        require(msg.value.getConversionRate() >= minimumUsd, "did not send enough ETH"); 
//      require(msg.value >= 1e18);   1e18 = 1 eth also = 1000000000000000000 gwei
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
        


    }

    function withdraw() public onlyOwner {
        
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex = funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

// reset the funders array
        funders = new address[] (0);

        // withdraw the funds

 // you must wrap msg.sender address in payable typecast or it cannot receive funds
    payable(msg.sender).transfer(address(this).balance);
    // send
    bool sendSuccess = payable(msg.sender).send(address(this).balance);
    require(sendSuccess, "Send Failed");
    // call
    (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
    require(callSuccess, "Call failed");

    }



    modifier onlyOwner() {
        require(msg.sender == owner, "Sender is not owner!");
        _;

    }


}