#!/bin/bash

USERID=$(id -u)

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
RESET="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "Script started executing at $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]
then
    echo -e "$RED ERROR:: Please run this script with root access" $RESET | tee -a $LOG_FILE
    exit 1 #give other then 0 upto 127
else
    echo "Your running with root access" | tee -a $LOG_FILE
fi

# validate functions takes input as exit status, what command they tried to install
VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e "Installing $2 is.......$GREEN SUCCESS $RESET" | tee -a $LOG_FILE
    else
        echo -e "Installing $2 is.......$RED FAILURE $RESET" | tee -a $LOG_FILE
        exit 1
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "Mysql is Not Installed....Going to Install" | tee -a $LOG_FILE
    dnf install mysql -y
    VALIDATE $? "Mysql" #function calling
else
    echo -e "$YELLOW Mysql is Already Installed...Nothing todo! $RESET" | tee -a $LOG_FILE
fi

dnf list installed python3
if [ $? -ne 0 ]
then
    echo "python3 is Not Installed....Going to Install" | tee -a $LOG_FILE
    dnf install python3 -y
    VALIDATE $? "python3" #function calling
else
    echo -e "$YELLOW python3 is Already Installed...Nothing todo! $RESET" | tee -a $LOG_FILE
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "nginx is Not Installed....Going to Install" | tee -a $LOG_FILE
    dnf install nginx -y
    VALIDATE $? "nginx" #function calling
else
    echo -e "$YELLOW nginx is Already Installed...Nothing todo! $RESET" | tee -a $LOG_FILE
fi

echo "Script Ended at $(date)" | tee -a $LOG_FILE