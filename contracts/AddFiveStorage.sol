// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import {SimpleStorage} from "./SimpleStorage.sol";

// below is inheritance of SimpleStorage, all of this contracts
// functionality is now available from this contract

contract AddFiveStorage is SimpleStorage {

    function store(uint256 _newNumber) public override {
        myFavoriteNumber = _newNumber + 5;
    }
}