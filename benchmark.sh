#!/bin/bash
PATTERNS=${PATTERNS:-$(ls -1 patterns/ | tr '\n' ' ')}
LOGDIR=/tmp/recrossable
mkdir -p $LOGDIR
for i in $PATTERNS
do
    if [[ ! -f "${LOGDIR}/${i}.tested" ]];
    then
        echo "Benchmarking: $i"
        output=$(timeout 30 ssh root@remarkable RECROSSABLE_BENCHMARKING=1 RECROSSABLE_PUZZLENAME=$i /opt/bin/recrossable 2>&1 | egrep -m1 Generated\|Failed)
        if [[ $? -ne 0 ]];
        then
            echo "timeout"
        else
            if [[ "$output" == "Failed to compile" ]]
            then
                echo "failed to compile, skipping"
            else
                echo $output
                touch ${LOGDIR}/${i}.tested
            fi
        fi
        echo "----"
    fi
done
