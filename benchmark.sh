#!/bin/bash
PATTERNS=${PATTERNS:-$(ls -1 patterns/ | tr '\n' ' ')}
for i in $PATTERNS
do
    echo "Benchmarking: $i"
    timeout 10 ssh root@remarkable RECROSSABLE_BENCHMARKING=1 RECROSSABLE_PUZZLENAME=$i /opt/bin/recrossable 2>&1 | grep Generated || echo "timeout"
    echo "----"
done
