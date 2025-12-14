#!/bin/sh

# Generate a new ssh key
ssh-keygen -t ed25519 -C "lasantha1130@gmail.com"

# Add ssh key to ssh-agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# Print ssh public key to clipboard
cat ~/.ssh/id_ed25519.pub
