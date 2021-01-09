#!/bin/bash
PATTERNS=${PATTERNS:-$(ls -1 patterns/ | tr '\n' ' ')}
LOGDIR=/tmp/recrossable
mkdir -p $LOGDIR
for i in $PATTERNS
do
    if [[ ! -f "${LOGDIR}/${i}.tested" ]];
    then
        echo "Benchmarking: $i"
        timeout 30 ssh root@remarkable RECROSSABLE_BENCHMARKING=1 RECROSSABLE_PUZZLENAME=$i /opt/bin/recrossable 2>&1 | grep Generated || echo "timeout"
        touch ${LOGDIR}/${i}.tested
        echo "----"
    fi
done
