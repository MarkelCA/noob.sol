// SPDX-License-Identifier: MIT

pragma solidity 0.8.17; 
contract SimpleStorage {
    uint256 favoriteNumber;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }
}

//0xd9145CCE52D386f254917e481eB44e9943F39138
