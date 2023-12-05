// SPDX-License-Identifier: MIT
pragma solidity 0.8.22;

contract SimpleStorage {

// gets initialized to zero if not given
    uint256 public myfavoriteNumber;

    //uint256[] listOfFavoriteNumbers; 
    struct Person {
        uint256 favoriteNumber;
        string name;
    }

   
    Person[] public listOfPeople;


    mapping(string => uint256) public nameToFavoriteNumber;


    function store(uint256 _favoriteNumber) public {
        myfavoriteNumber = _favoriteNumber;
    }

// designating this function as view means you are disallowing changing of state, 
// this function can only read data from the chain
// pure functions disallow reading from or altering state, view and pure functions do not use gas
    function retrieve() public view returns(uint256){
        return myfavoriteNumber;
    }


    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push( Person(_favoriteNumber, _name) ); 
        nameToFavoriteNumber[_name] = _favoriteNumber;

    }


}
