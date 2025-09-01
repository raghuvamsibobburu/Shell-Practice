#!/bin/bash

echo "All variables passed to the script: $@"
echo "script Name: $0"
echo "Present working directory: $PWD"
echo "Home directory: $HOME"
echo "Number of variables: $#"
echo "User running the script: $USER"
echo "PID of the script: $$"
sleep 10 &
echo "PID of last command in background: $!"