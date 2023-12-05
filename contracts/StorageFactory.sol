// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {

    SimpleStorage[] public listOfSimpleStorageContracts;

    function createSimpleStorageContract() public {
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }

    function sfStore(uint256 _simpleStorageIndex, string memory dogName) public {
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        
        // You can convert the dog's name to a number or use it directly based on your use case
        uint256 dogNameAsNumber = uint256(keccak256(abi.encodePacked(dogName)));
        mySimpleStorage.store(dogNameAsNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        return mySimpleStorage.retrieve();
    }
}
