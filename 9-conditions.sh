#!/bin/bash

NUMBER=$1

if [ $NUMBER -lt 10 ]
then
  echo "Given $NUMBER is less then 10"

else
  echo "Given $NUMBER is not less then 10"
fi

