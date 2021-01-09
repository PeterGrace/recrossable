#!/bin/bash
PATTERNS=${PATTERNS:-$(ls -1 patterns/ | tr '\n' ' ')}
for i in $PATTERNS
do
    echo "Benchmarking: $i"
    ssh root@remarkable RECROSSABLE_BENCHMARKING=1 RECROSSABLE_PUZZLENAME=$i /opt/bin/recrossable 2>&1 | grep Generated
    ssh root@remarkable RECROSSABLE_BENCHMARKING=1 RECROSSABLE_PUZZLENAME=$i /opt/bin/recrossable 2>&1 | grep Generated
    ssh root@remarkable RECROSSABLE_BENCHMARKING=1 RECROSSABLE_PUZZLENAME=$i /opt/bin/recrossable 2>&1 | grep Generated
    echo "----"
done
