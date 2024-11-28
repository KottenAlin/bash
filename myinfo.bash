#!/bin/bash

# A script to display system information based on user options.

for arg in $*; do
    if [[ $arg == "--help" ]]; then
        echo "Usage: myinfo.bash OPTION..."
        echo "Print out system information"
        echo "OPTIONS"
        echo "-a, --all        Display all information"
        echo "-v, --version    Display Linux version"
        echo "-i, --ip         Display IP address"
        echo "-m, --mac        Display MAC address"
        echo "--help           Display this help and exit"
    fi

    if [[ $arg == "-a" ]] || [[$arg == "--all"]]; then
        echo -n "Linux Version: "
        lsb_release -a | grep "Description" | awk '{$1=$1; print}' | cut -d':' -f2-
        echo -n "IP address: "
        hostname -I
        echo -n "MAC address (ether): "
        ip link | grep "link/ether" | awk '{ print $2 }'
        # More functionality could be modularized with functions if needed
    fi

    if [[ $arg == "-v" ]] || [[$arg == "--version"]]; then
        echo -n "Linux Version: "
        lsb_release -a | grep "Description" | awk '{$1=$1; print}' | cut -d':' -f2-
    fi

    if [[ $arg == "-i" ]] || [[$arg == "--ip"]]; then
        echo -n "IP address: "
        hostname -I
    fi

    if [[ $arg == "-m" ]] || [[ $arg == "--mac"]]; then
        echo -n "MAC address (ether): "
        ip link | grep "link/ether" | awk '{ print $2 }'
    fi
done
