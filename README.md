# noob.sol
My journey learning solidity and smart contracts development.

All the smart contracts written are being tested using the [Remix IDE](https://remix.ethereum.org/)

From now I'll leave here the fundamental must-know concepts about solidity and ethereum smart contracts, as well as some utilities.

## Fundamental concepts
- Every deploy / call of a smart contract is a transaction. Hence has a sender, a receiver and a transaction cost measured in gas
- `view` and `pure` functions, when called in the code, don't spend gas. They spend gas when they're called by a contract though

## Call vs Transaction
### Call
A call is a local invocation of a contract function that does not broadcast or publish anything on the blockchain.
It is a read-only operation and will not consume any Ether. It simulates what would happen in a transaction, but discards all the state changes when it is done.

### Transaction
A transaction is broadcasted to the network, processed by miners, and if valid, is published on the blockchain.
It is a write-operation that will affect other accounts, update the state of the blockchain, and consume Ether (unless a miner accepts it with a gas price of zero).
[More info](https://ethereum.stackexchange.com/questions/765/what-is-the-difference-between-a-transaction-and-a-call)


## Swich solc versions
To check the correctness of these contracts you can run the compiler locally before deploying it on Remix. However the contract must match the `solc` comiler, so it's useful to have an easy way of changing the compiler's version.

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

