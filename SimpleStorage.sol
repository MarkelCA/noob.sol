// SPDX-License-Identifier: MIT
pragma solidity 0.8.17; 

contract SimpleStorage {
	uint256 public contractFavoriteNumber;
    mapping(string => uint256) public favoriteNumbers;
    struct Person {
		uint256 favoriteNumber;
		string name;
	}
	Person[] public people;

    function setContractFavoriteNumber(uint256 _favoriteNumber) public {
        contractFavoriteNumber = _favoriteNumber;
    }

    function getContractFavoriteNumber() public view returns(uint256) {
        return contractFavoriteNumber;
    }


	function addPerson(string calldata _name, uint256 _favoriteNumber) public {
		Person memory newPerson = Person({
            favoriteNumber: _favoriteNumber,
            name: _name
            });
		people.push(newPerson); 
        favoriteNumbers[_name] = _favoriteNumber;
	} 
}