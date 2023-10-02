#!/bin/bash

# Check if the script is run with sudo privileges
if [ "$(id -u)" -ne 0 ]; then
  echo "Please run this script with sudo privileges."
  exit 1
fi

# Define environment variables for the baud rates, defaulting to 500000
CAN0_BAUD_RATE="${CAN0_BAUD_RATE:-500000}"
CAN1_BAUD_RATE="${CAN1_BAUD_RATE:-500000}"

# Enable SocketCAN for can0 and can1 with specified or default baud rates
sudo ip link set can0 up type can bitrate "$CAN0_BAUD_RATE"
sudo ip link set can1 up type can bitrate "$CAN1_BAUD_RATE"

# Increase txqueuelen for can0 and can1
sudo ifconfig can0 txqueuelen 65536
sudo ifconfig can1 txqueuelen 65536

echo "SocketCAN is enabled with the specified or default baud rates."
