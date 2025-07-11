#!/bin/bash

# our program goal is to install mysql

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo " error: please run with root access "
    exit 1
else 
    echo " info:: you are running with root access"
fi 

 # it is our responsibility again to check installation is success or not

yum install mysql -y


if [$? -ne 0 ]
then 
    echo " Installation of myql is error "
else 
    echo "Installation of myql is success  "
 fi 

 yum install postfix -y   


if [$? -ne 0 ]
then 
    echo " Installation of postfix  is error "
else 
    echo "Installation of postfix   is success  "
 fi 

