#!/bin/bash

# Function to update system packages
update_system() {
    echo "Updating system packages..."
    sudo apt update && sudo apt upgrade -y
}

# Function to clean up disk space
cleanup_system() {
    echo "Cleaning up system..."
    sudo apt autoremove -y
    sudo apt autoclean -y
    sudo rm -rf /tmp/*
}

# Function to back up important files
backup_files() {
    echo "Backing up important files..."
    BACKUP_DIR="/backup/$(date +%Y%m%d)"
    mkdir -p "$BACKUP_DIR"
    cp -r /home/user/Documents "$BACKUP_DIR"
    cp -r /home/user/Pictures "$BACKUP_DIR"
}

# Function to check for disk errors
check_disk() {
    echo "Checking for disk errors..."
    sudo fsck -A -y
}

# Function to display system status
system_status() {
    echo "Displaying system status..."
    df -h
    free -h
    uptime
}

# Main script execution
update_system
cleanup_system
backup_files
check_disk
system_status

echo "System maintenance tasks completed successfully!"
