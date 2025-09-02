#!/bin/bash

USERID=$(id -u)

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
RESET="\e[0m"

if [ $USERID -ne 0 ]
then
    echo -e "$RED ERROR:: Please run this script with root access" $RESET
    exit 1 #give other then 0 upto 127
else
    echo "Your running with root access"
fi

# validate functions takes input as exit status, what command they tried to install
VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e "Installing $2 is.......$GREEN SUCCESS $RESET"
    else
        echo -e "Installing $2 is.......$RED FAILURE $RESET"
        exit 1
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "Mysql is Not Installed....Going to Install"
    dnf install mysql -y
    VALIDATE $? "Mysql" #function calling
else
    echo -e "$YELLOW Mysql is Already Installed...Nothing todo! $RESET"
fi

dnf list installed python3
if [ $? -ne 0 ]
then
    echo "python3 is Not Installed....Going to Install"
    dnf install python3 -y
    VALIDATE $? "python3" #function calling
else
    echo -e "$YELLOW python3 is Already Installed...Nothing todo! $RESET"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "nginx is Not Installed....Going to Install"
    dnf install nginx -y
    VALIDATE $? "nginx" #function calling
else
    echo -e "$YELLOW nginx is Already Installed...Nothing todo! $RESET"
fi