#!/bin/bash

echo "Making 5 requests with 0.2 second delay between each..."
echo "Expected: First 3 requests should succeed, last 2 should be rate limited"

for i in {1..5}; do
    echo -n "Request $i: "
    curl -v -H "Host: example.com" http://localhost:8080 2>&1 | grep "< HTTP"
    if [ $i -lt 5 ]; then
        sleep 0.2
    fi
done 