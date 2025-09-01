#!/bin/bash

NUMBER1=100
NUMBER2=200

Timestamp=$(date)

echo "script executed at $(Timestamp)"

echo $((NUMBER1+NUMBER2))