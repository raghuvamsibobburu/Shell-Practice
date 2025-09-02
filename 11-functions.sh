#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: Please run this script with root access"
    exit 1 #give other then 0 upto 127
else
    echo "Your running with root access"
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo "Installing $2 is.......SUCCESS"
    else
        echo "Installing $2 is.......FAILURE"
        exit 1
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "Mysql is Not Installed....Going to Install"
    dnf install mysql -y
    VALIDATE $? "Mysql"
else
    echo "Mysql is Already Installed...Nothing todo!"
fi

dnf list installed python3
if [ $? -ne 0 ]
then
    echo "python3 is Not Installed....Going to Install"
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo "python3 is Already Installed...Nothing todo!"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "nginx is Not Installed....Going to Install"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo "nginx is Already Installed...Nothing todo!"
fi