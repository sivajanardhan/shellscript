#!/bin/bash

# our program goal is to install mysql
date=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE () {
    #$1 --> it will receive the argument1
if [ $1 -ne 0 ]
then
     echo  -e "$2 ... $R FAILURE $N"
else 
    echo -e "$2 ... $G SUCCESS $N"

fi         

}

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: Please run this script with root access"
    exit 1
# else
#     echo "INFO:: You are root user"
fi

yum install mysql -y &>>$LOGFILE

VALIDATE $? "Installing MySQL"

yum install posfix -y &>>$LOGFILE

VALIDATE $? "Installing posfix"

yum install git  -y &>>$LOGFILE

VALIDATE $? "Installing git"
