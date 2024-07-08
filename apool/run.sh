#!/bin/bash
worker="${WORKER:-001}"
thread="${THREAD:-1}"
/app/runner --pool aleo1.hk.apool.io:9090 -A aleo --gpu-off --account CP_1tg9sqj0jv --worker $worker -t $thread

