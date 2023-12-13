// contract will:
//      collect funds from user
//      withdraw funds
//      set a minimum funding value in USD

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract FundMe {

    uint256 public myValue = 1;

    function fund() public payable  {

        myValue = myValue + 2;
        require(msg.value >= 1e18, "must send at least 1 ETH"); // 1e18 = 1 eth also = 1000000000000000000 gwei


    }

//    function withdraw() public {}


}