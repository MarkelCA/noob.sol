# Variables

## Modifiers
- `pure` for functions: Disallows modification or access of state.
- `view` for functions: Disallows modification of state.
- `payable` for functions: Allows them to receive Ether together with a call.
- `constant` for state variables: Disallows assignment (except initialisation), does not occupy storage slot.
- `immutable` for state variables: Allows exactly one assignment at construction time and is constant afterwards. Is stored in code.
- `anonymous` for events: Does not store event signature as topic.
- `indexed` for event parameters: Stores the parameter as topic.
- `virtual` for functions and modifiers: Allows the function’s or modifier’s behaviour to be changed in derived contracts.
- `override`: States that this function, modifier or public state variable changes the behaviour of a function or modifier in a base contract.

## Function Visibility Specifiers
- `public`: Can be used when contract was deployed, can be used in inherited contract.
- `external`: Can be used when contract was deployed, can NOT be used in inherited contract
- `internal`: Can NOT be used when contract was deployed , can be used in inherited contract (This is the option set by default when no specifier is used)
- `private`: Can NOT be used when contract was deployed, can NOT be used in inherited contract


[More info](https://docs.soliditylang.org/en/v0.8.17/cheatsheet.html)
