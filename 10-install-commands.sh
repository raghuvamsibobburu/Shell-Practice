#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: Please run this script with root access"
    exit 1 #give other then 0 upto 127
else
    echo "Your running with root access"
fi

# dnf install mysql -y

# if [ $? -eq 0 ]
# then
#     echo "Installing mysql is.......SUCCESS"
# else
#     echo "Installing mysql is.......FAILURE"
#     exit 1
# fi

