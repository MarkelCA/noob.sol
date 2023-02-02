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
This is something that used to happend before solidity 0.8. When you reached the maximum or minimum of integers, and operate on these, they used to swap their values. That's why it's common to see the use of  [SafeMath](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol) library in old smart contracts.

[More info on integer overflow](https://en.wikipedia.org/wiki/Integer_overflow)
[More info on integer overflow/underflow in solidity](https://ethereum.stackexchange.com/questions/83226/integer-underflow-overflow)

