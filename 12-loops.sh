#!/bin/bash
DATE=$(date +%F)
LOGSDIR=/home/centos/shellscript-logs
# /home/centos/shellscript-logs/script-name-date.log
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$0-$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"


USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo " error : run with root access "
    exit 1
else
    echo "info  you are with sudo access"
fi 


    
VALIDATE(){

    #$1 --> it will receive the argument1

    if [ $1 -ne 0 ];
    then
        echo -e "Installing $2 ... $R FAILURE $N"
        exit 1
    else
        echo -e "Installing $2 ... $G SUCCESS $N"
    fi
}



for i in $@
do 
    yum list installed $i &>>$LOGFILE
    if [ $? -ne 0 ]
    then 
        echo "$i is not installed, lets install it "
        yum install $i -y &>>$LOGFILE
        VALIDATE $? "i"
    else
        echo -e "$Y $i is already installed $N"
    fi

#yum install $i -y


done 

