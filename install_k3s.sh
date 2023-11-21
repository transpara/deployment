#!/bin/bash

# Install K3s
echo "Installing K3s Kubernetes..."
curl -sfL https://get.k3s.io | sh -

# Check for successful installation
if [ $? -ne 0 ]; then
    echo "K3s installation failed."
    exit 1
else
    echo "K3s installed successfully."
fi

# Create .kube directory
echo "Creating .kube directory..."
mkdir -p $HOME/.kube

# Copy K3s kubeconfig file
echo "Copying K3s kubeconfig file..."
sudo cp /etc/rancher/k3s/k3s.yaml $HOME/.kube/config

# Change ownership and permissions of the kubeconfig file
echo "Updating kubeconfig file permissions..."
sudo chown $USER:$USER $HOME/.kube/config
sudo chmod 600 $HOME/.kube/config

# Set KUBECONFIG environment variable
echo "Setting KUBECONFIG environment variable..."
export KUBECONFIG=$HOME/.kube/config

# Add KUBECONFIG to user profile
echo "Adding KUBECONFIG to .bashrc..."
echo "export KUBECONFIG=$HOME/.kube/config" >> $HOME/.bashrc

echo "Installation and setup complete. Please restart your shell or source ~/.bashrc to apply changes."


