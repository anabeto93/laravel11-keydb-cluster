#!/bin/bash

# Define your KeyDB service names here
keydb_services=("keydb1" "keydb2" "keydb3")

# Initialize an empty array to hold the IP addresses
keydb_ips=()

# Loop through the KeyDB service names
for service in "${keydb_services[@]}"; do
  # Retrieve the IP address using getent
  ip=$(docker compose exec keydb1 getent hosts $service | awk '{ print $1 }')
  
  echo -e "IP address for $service: $ip"
  # Check if the IP address was successfully retrieved
  if [ -z "$ip" ]; then
    echo "Failed to retrieve IP address for $service"
    exit 1
  fi
  
  # Append the IP address and port to the keydb_ips array
  keydb_ips+=("$ip:6379")
done

# Construct the cluster create command with the retrieved IP addresses
cluster_create_command="docker compose exec keydb1 keydb-cli --cluster create ${keydb_ips[*]} --cluster-replicas 0"

echo "Executing cluster create command: $cluster_create_command"

# Execute the cluster create command
$cluster_create_command

echo "KeyDB cluster setup complete."
