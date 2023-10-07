#!/bin/bash

# Function to handle errors
handle_error() {
  echo "Error: $1" >&2
  exit 1
}

# Download the latest Go version
echo "Downloading the latest Go version..."
wget https://dl.google.com/go/go1.21.2.linux-arm64.tar.gz || handle_error "Failed to download Go tarball."

# Extract the Go tarball
echo "Extracting Go tarball..."
sudo tar -C /usr/local -xzf go1.21.2.linux-arm64.tar.gz || handle_error "Failed to extract Go tarball."

# Remove existing Go installation
echo "Removing existing Go installation..."
sudo rm -rvf /usr/local/go || handle_error "Failed to remove existing Go installation."

# Move the new Go installation
echo "Moving the new Go installation..."
sudo mv /usr/local/go1.21.2.linux-arm64 /usr/local/go || handle_error "Failed to move the new Go installation."

# Clean up the downloaded tarball
echo "Cleaning up downloaded files..."
sudo rm go1.21.2.linux-arm64.tar.gz

echo "Go has been successfully installed."

# uncomment and add to user's .bashrc
# export GOROOT=/usr/local/go
# export GOPATH=$HOME/go
# export PATH=$GOPATH/bin:$GOROOT/bin:$PATH