#!/bin/bash

# Function to convert and apply Kubernetes manifests
convert_and_apply() {
  dir=$1
  apply=$2

  # Navigate to the directory
  cd "$dir" || exit

  echo "Converting Docker Compose in directory $dir"

  # Convert the Docker Compose file
  kompose convert -f docker-compose.yaml

  # Apply the manifests to the Kubernetes cluster if the apply flag is set
  if [[ $apply == "apply" ]]; then
    echo "Applying manifests to Kubernetes cluster"
    kubectl apply -f .
  fi

  # Navigate back to the original directory
  cd - || exit
}

# List of directories containing Docker Compose files
directories=(
  "data-simulator"
  "pjm-extractor"
  "tauth"
  "tbackup"
  "tcalc"
  "tcore"
  "tcore-new"
  "tdebug"
  "tmon"
  "tproxy"
  "tstore"
  "tstore-interface"
  "tsystem"
)

# Loop through each directory and convert the Docker Compose files
for dir in "${directories[@]}"; do
  # Call the function with the directory name and optionally the apply flag
  convert_and_apply "$dir" "$1"
done
