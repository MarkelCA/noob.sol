## Fundamental concepts
- Every deploy / call of a smart contract is a transaction. Hence has a sender, a receiver and a transaction cost measured in gas.
- `view` and `pure` functions, when called in the code, don't spend gas. They spend gas when they're called by a contract though.
- The hability for contracts to interact with each other it's what is known as composibility.

## Call vs Transaction
### Call
A call is a local invocation of a contract function that does not broadcast or publish anything on the blockchain.
It is a read-only operation and will not consume any Ether. It simulates what would happen in a transaction, but discards all the state changes when it is done.

### Transaction
A transaction is broadcasted to the network, processed by miners, and if valid, is published on the blockchain.
It is a write-operation that will affect other accounts, update the state of the blockchain, and consume Ether (unless a miner accepts it with a gas price of zero).
[More info](https://ethereum.stackexchange.com/questions/765/what-is-the-difference-between-a-transaction-and-a-call)


## Optimization
### Word size
The EVM's word size it's 256 or (32 bytes), that's why it's encouraged to use variables packed by 32 bytes whenever possible, because it takes extra computation (and therefore gas & time) to shrink. Therefore, if the element is smaller than that, the EVM must use more operations in order to reduce the size of the element from 32 bytes to the desired size. That's why all the ints are written as uint256.

Sources:
[Stackexchange: Why use anything but uint256 outside a struct](https://ethereum.stackexchange.com/questions/77153/why-use-anything-but-uint256-int256-outside-of-a-struct#77154)
[Stackexchange: Why do solidity examples use bytes32 type instead of string](https://ethereum.stackexchange.com/questions/3795/why-do-solidity-examples-use-bytes32-type-instead-of-string)

More info about optimization in: [Gas Optimization in Solidity (Medium)](https://medium.com/coinmonks/gas-optimization-in-solidity-part-i-variables-9d5775e43dde)

### Consumption on pure and view functions
Pure and view functions do not cost gas if are not called from non pure/view functions/contracts. This is because they may be run off-chain and the don't publish transactions to the blockchain.

Technically, this means that Ethereum node executes transaction locally, the same way as miner would execute it, obtains execution result, but does not include transaction into block. Though, when transaction is being executed locally, EVM still counts how much gas does it use, and this calculated value is what Remix shows to you. You may need this number to estimate how much gas the function will use when called on-chain, i.e. in published transaction, called directly or from another contract.

[Transaction call gas consumption](https://ethereum.stackexchange.com/questions/69024/transaction-function-call-gas-consumption)

## Data access
EVS can access and store information in six places:
This data location can only be specified for array, struct or mapping types as structs.
1. Stackexchange
2. Memory
3. Storage
4. Calldata
5. Code
6. Logs

Both memory and calldata varibles are defined with function scope, so are removed after the stack frame is deleted.
The difference between memory and calldata is that calldata is immutable.
Storage is defined by default for contract parameters. Function parameters can't be defined as storage since these are temporal.

### Memory vs Calldata
Memory should be used when declaring variables (both function parameters as well as inside the logic of a function) that you want stored in memory (temporary), and calldata must be used when declaring an external function's dynamic parameters.
[More info](https://ethereum.stackexchange.com/questions/74442/when-should-i-use-calldata-and-when-should-i-use-memory)

## uint overflow/underflow
This is something that used to happend before solidity 0.8. When you reached the maximum or minimum of integers, and exceed that limit, they used to turn back to 0 or max value respectively. That's why it's common to see the use of  [SafeMath](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol) library in old smart contracts.

[More info on integer overflow](https://en.wikipedia.org/wiki/Integer_overflow)
[More info on integer overflow/underflow in solidity](https://ethereum.stackexchange.com/questions/83226/integer-underflow-overflow)

## Contract composition

- The imported contract's version must be compatible with the current one, otherwise will throw an error.
- In order to interact with any contract you'll always need the address of the contract and the ABI (Application Binary Interface) of the contract

## Ethereum nodes
### Remix VM
From the docs, for the JavaScript VM environment:
"transactions will be executed in a sandbox blockchain in the browser. This means nothing will be persisted and a page reload will restart a new blockchain from scratch, the old one will not be saved."

So Remix uses a private blockchain and accounts by default that you can use for testing.

### What is running a node
From the [ethereum doc](https://ethereum.org/en/run-a-node/): Running an Ethereum node may sound complicated at first, but it's merely the act of continuously running client software on a computer while connected to the internet. While offline, your node will simply be inactive until it gets back online and catches up with the latest changes.

### Why run a local node
The major reason that you would want to run a local node is that it guarantees you a consistent view of the current network state. When you fetch data from a public, untrusted node then that node can lie to you about the current state of the network; i.e. whether your transactions have been confirmed, whether you have recieved a transaction, your current balance, etc.

 More info on ethereum nodes: https://ethereum.org/en/developers/docs/nodes-and-clients/

### Running a light node
You can run a light node with [geth](https://geth.ethereum.org/downloads)

Run a node in light mode: 
```
geth --goerli --syncmode "light" --http
```
The http flag it's to be able to connect through http-rcp, so we can connect our Metamask to our local node.

You now can use web3 to query the blockchain using our irpc file:
```
geth attach <your-path>/geth.ipc
```

A JavaScript console will be opened

```javascript
# We consult the Balance of a random address:
eth.getBalance('0x8dC847Af872947Ac18d5d63fA646EB65d4D99560')
# response: 443558686120856878635 (In Wei)

# We get the chaid ID of the current locally-running blockchain:
web3.eth.chainId()
# response: "0x5"
```

## Merkle Patricia Tries
The data structure running behind some of these processes are Merkle Patricia Tries, This being offers the autenticity of a Merkle tree with a more efficient memory management.
More info:
- https://ethereum.org/en/developers/docs/data-structures-and-encoding/patricia-merkle-trie/
- https://kronosapiens.github.io/blog/2018/07/04/patricia-trees.html
- https://www.youtube.com/watch?v=mZnD3yGNO5k&t=209s


# Oracles
Blockchains are deterministic, thus,they can't make http calls to fetch data. For that purpouse an oracle is used, such as Chainlink oracle system.
The smart contract calls an adapter, which is off-chain and makes the http request, then sends the data back to the smart contract as a regular transaction.

Even if the running adapter is off-chain, the adapter contract is deployed to the blockchain, to serve like a standarized interface.

The smart contract uses the adapter to make a transaction to a certain address with the desired data to make the call. 
The off-chain adapter is programmed to listen to this address' transactions, so when a transaction happens the off-chain adapter makes the http call using the transaction's data, and then sends the result back to the blockchain using a transaction.
Example:
- Adapter on-chain (interface): https://github.com/smartcontractkit/chainlink/blob/develop/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol
- Adapter off-chain (implementation): https://github.com/smartcontractkit/chainlink/blob/develop/core/gethwrappers/generated/aggregator_v3_interface/aggregator_v3_interface.go
