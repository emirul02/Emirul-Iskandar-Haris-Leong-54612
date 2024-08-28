!/bin/bash

#Outputs the current IP address, subnet mask, and default gateway
output() {
    echo "Current network info:"
    echo "----------------------"

    #IP address and subnet mask
    IP_INFO=$(ip addr show | grep 'inet ' | awk '{print $2}')
    echo "IP Address and Subnet Mask:"
    for IP in $IP_INFO; do
        echo "  $IP"
    done

    #default gateway
    DEFAULT_GATEWAY=$(ip route show default | awk '/default/ {print $3}')
    echo "Default Gateway: $DEFAULT_GATEWAY"
}

# Verifies network connectivity to www.google.com.
verify() {
    echo "Verifying network connectivity to www.google.com"
    if ping -c 4 www.google.com > /dev/null; then
        echo "Network connectivity to www.google.com is successful."
    else
        echo "Network connectivity to www.google.com failed."
    fi
}

output
verify


