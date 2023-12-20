#!/bin/bash

# Install K3s
echo "Installing K3s Kubernetes..."
curl -sfL https://get.k3s.io | INSTALL_K3S_CHANNEL=v1.27 sh -

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

# 2.1 - Install Helm
echo "Installing Helm..."
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
echo "Helm installation completed. Verifying installation..."
helm version

# 2.3 - Install Helmfile
echo "Installing Helmfile..."
curl -fsSL -o helmfile_0.158.0_linux_amd64.tar.gz https://github.com/helmfile/helmfile/releases/download/v0.158.0/helmfile_0.158.0_linux_amd64.tar.gz
tar -xvzf helmfile_0.158.0_linux_amd64.tar.gz -C /tmp
sudo mv /tmp/helmfile /usr/local/bin
echo "Helmfile installation completed. Verifying installation..."
helmfile version

# 2.4 - Install Helm Diff plugin
echo "Installing Helm Diff plugin..."
helm plugin install https://github.com/databus23/helm-diff
echo "Helm Diff plugin installation completed. Verifying installation..."
helm plugin list

echo "Installation and setup complete. Please restart your shell or source ~/.bashrc to apply changes."
