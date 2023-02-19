// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Memory {
    uint256 private x = 5;

    function fun1() external pure returns (uint256) { // 315 gas
        return 6;
    }

    function fun2(uint256[] memory _arr) external pure returns (uint256) { // 1423 gas (1 sized arr)
        _arr[0] += 1;
        return 6 + _arr[0];
    }

    function fun3(uint256[] calldata _arr) external pure returns (uint256) { // 950 gas (constant)
        // _arr[0] += 1; // calldata variables are read only
        return 6 + _arr[0];
    }

    function fun31(uint256[] calldata _arr) public pure returns (uint256) { // 972 gas (constant)
        // _arr[0] += 1; // calldata variables are read only
        return 6 + _arr[0];
    }

    function fun32(uint256[] memory _arr) public pure returns (uint256) { // 1508 gas (1 sized arr) / 2648 (6 sized arr)
        // _arr[0] += 1; // calldata variables are read only
        return 6 + _arr[0];
    }

    function fun5(uint256 _var) public pure returns(uint256) {
        return 6 + _var;
    }
}


// Conclusions
// - Public functions are more expensive than external even when both can use calldata
// - Calldata is much cheaper than memory because it doesn't have to copy the full array into memory, also calldata scales as O(1) in memory complexity, and memory as O(n) complexity
