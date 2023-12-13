// contract will:
//      collect funds from user
//      withdraw funds
//      set a minimum funding value in USD

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract FundMe {

    uint256 public myValue = 1;
    uint256 public minimumUsd = 5;

    function fund() public payable  {

        myValue = myValue + 2;
        require(msg.value >= minimumUsd, "must send at least 5 dollars"); // 1e18 = 1 eth also = 1000000000000000000 gwei


    }

//    function withdraw() public {}


}