# noob.sol
My journey learning solidity and smart contracts development.

All the smart contracts written are being tested using the [Remix IDE](https://remix.ethereum.org/)


## Swich solc versions
To check for compilation errors on these contracts you can run the solidity compiler (`solc`) locally before deploying it on Remix. However the contract must match the `solc` version, so it's useful to have an easy way of changing the compiler's version.

Firstly check your current version with:
```
solc --version
```

Step 1: Install `solc-select`
```
sudo pip3 install solc-select
```
Step 2: Install the desired version:
```
solc-select install 0.4.24
```
Step 3: Select the desired version:
```
solc-select use 0.4.24
```
Now you can switch the version with the `use` command.
