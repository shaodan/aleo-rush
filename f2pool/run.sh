#!/bin/bash
worker="${WORKER:-001}"
thread="${THREAD:-1}"

cpu_cores=$(lscpu | grep '^CPU(s):' | awk '{print $2}')
physical_cores=$(( cpu_cores / 2 ))
cpu_span=1

if [[ $thread -eq 1 ]]; then
    cpu_list=0
else
    cpu_list="0-$((thread - 1))"
fi

TASTSET_CPU_CORES=$cpu_list taskset -c $cpu_list /app/runner -u "stratum+tcp://aleo-asia.f2pool.com:4400" -w "asuka4ever.${worker}"
