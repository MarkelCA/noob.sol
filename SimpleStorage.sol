// SPDX-License-Identifier: MIT

pragma solidity 0.8.17; 
contract SimpleStorage {
	uint256 favoriteNumber;

    Person public person = Person({favoriteNumber:2, name: "Patrick"});

	struct Person {
		uint256 favoriteNumber;
		string name;
	}

	Person[] public people;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    }

	function addPerson(string memory _name, uint256 _favoriteNumber) public {
		Person memory newPerson = Person(_favoriteNumber, _name);
		people.push(newPerson); 
	} 
}


