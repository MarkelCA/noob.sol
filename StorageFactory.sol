//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public storages;

    function createSimpleStorageContract() public {
        storages.push(new SimpleStorage());
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        // SimpleStorage simpleStorage = SimpleStorage(storages[_simpleStorageIndex]); // You can access a contract passing its address to the contructor
        SimpleStorage simpleStorage = storages[_simpleStorageIndex];
        simpleStorage.setContractFavoriteNumber(_simpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        return storages[_simpleStorageIndex].getContractFavoriteNumber();
    }
}