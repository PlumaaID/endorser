# Endorser

A contract to track digital endorsements according to comercial Mexican law. This contract allows for any user to mint a new token by providing the hash of the digital document that's endorsed. Privacy is ensured by only tracking the hash of the document, and not the document itself.

## Deployments

| Network          | Endorser Proxy                             |
| ---------------- | ------------------------------------------ |
| Arbitrum Sepolia | 0xf391CE6C3467E21CeF7154c008B2d4520EA8e953 |

## Installing Foundry

See [Foundry installation guide](https://book.getfoundry.sh/getting-started/installation).

## Testing the contract

```
forge test
```

## Deploying the contract

You can simulate a deployment by running the script:

```
forge script script/Endorser.s.sol
```

See [Solidity scripting guide](https://book.getfoundry.sh/tutorials/solidity-scripting) for more information.
