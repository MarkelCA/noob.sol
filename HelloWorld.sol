// SPDX-License-Identifier: MIT
pragma solidity 0.8.17; 
contract HelloWorld {
    // For this function Remix will trigger the following warning:
    // "Gas requirement of function HelloWorld.greet is infinite"
    // This happens because strings are a kind of dynamic array,
    // and since the parser can't evaluate the size of this variable
    // on compilation then triggers the warning
    string public greet = "Hello World!";
}
