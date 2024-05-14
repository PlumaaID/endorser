#!/usr/bin/env bash

# Check if git is installed
if ! which git &> /dev/null
then
  echo "git command not found. Install git and try again."
  exit 1
fi

# Check if Foundry is installed
if ! which forge &> /dev/null
then
  echo "forge command not found. Install Foundry and try again. See https://book.getfoundry.sh/getting-started/installation"
  exit 1
fi

# Setup Foundry project
if ! [ -f "foundry.toml" ]
then
  echo "Initializing Foundry project..."

  # Backup Wizard template readme to avoid it being overwritten
  mv README.md README-oz.md

  # Initialize sample Foundry project
  forge init --force --no-commit --quiet

  # Install OpenZeppelin Contracts
  forge install OpenZeppelin/openzeppelin-contracts@v5.0.2 --no-commit --quiet

  # Remove unneeded Foundry template files
  rm src/Counter.sol
  rm script/Counter.s.sol
  rm test/Counter.t.sol
  rm README.md

  # Restore Wizard template readme
  mv README-oz.md README.md

  # Add remappings
  if [ -f "remappings.txt" ]
  then
    echo "" >> remappings.txt
  fi
  echo "@openzeppelin/contracts/=lib/openzeppelin-contracts/contracts/" >> remappings.txt

  # Perform initial git commit
  git add .
  git commit -m "openzeppelin: add wizard output" --quiet

  echo "Done."
else
  echo "Foundry project already initialized."
fi
