// SPDX-License-Identifier: MIT
// The above line it's optional, however if missing,
// warnings can be thrown depending on the compiler

///////////////
// PRAGMA (VERSION)
///////////////
//pragma solidity ^0.8.7 // use ^ for the written version or any newest MINOR version    
//pragma solitity >=0.8.7 // Use >= for any mayor version newer than the written one
//pragma solidity >=0.8.7 <0.9.0 // A version range
///////////////

pragma solidity 0.8.17; 
contract Types {
    // types: boolean, unit, int, address, byets
    bool hasFavoriteNumber = true;
    uint favoriteNumber = 5; // default size allocation is 256
    uint256 favoriteNumber256 = 5; // It's recomended to be explicit on variable allocation, even if we use the default one because adds expressivitive
    uint256 zero;  // by default non initialized ints are 0
    uint32 favoriteNumber32 = 5;
    string favoriteNumberInText = "Five";
    int256 favoriteNegativeInt = -5;
    address myAddress = 0x388C818CA8B9251b393131C08a736A67ccB19297; // (Not my real address) (Note that letter case it's important, otherwise gives an "invalid checksum" warning)
    bytes32 favoriteBytes = "cat"; // 32 it's the maximum size a bytes variable can be
    bytes favoriteAnyBytes = "cat"; // In this case the variblae can have any size
}
