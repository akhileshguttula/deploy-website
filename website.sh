#!/bin/bash

URL=https://www.tooplate.com/zip-templates/2098_health.zip
FILE=2098_health

apt --version &> /dev/null

if [ $? -eq 0 ]
then
        echo "initializing ubuntu"
        sleep 2
        sudo apt update &> /dev/null

        echo " installing prerequistics "
        sleep 2
        sudo apt install unzip wget apache2 -y &> /dev/null

        echo " starting server "
        sleep 2
        sudo systemctl start apache2

        echo " getting and unzipping the url "
        sleep 2
        wget $URL &> /dev/null
        unzip $FILE &> /dev/null

        echo " removing previous website"
        sleep 2
        sudo rm -r /var/www/html/*

        echo " copying new website into html "
        sleep 2
        sudo cp -r $FILE/* /var/www/html/

        echo " removing the downloaded file to make look good in the directory "
        sleep 2
        rm -r $FILE*
        i
        echo " restarting server        "
        sleep 2
        sudo systemctl restart apache2

        sleep 2
        echo "successfully changed by using ubuntu "
        sleep 2

else
        echo "initializing centOS"
        sudo yum update -y &> /dev/null
        sleep 2

        echo " installing prerequistics "
        sleep 2
        sudo yum install wget net-tools unzip httpd -y &> /dev/null

        echo " starting server"
       sleep 2
        sudo systemctl start httpd &> /dev/null
        sudo systemctl enable httpd

        echo " getting file downloading  "
        sleep 2
        sudo wget $URL
        sudo unzip $FILE

        echo " removing previous website "
        sleep 2
        sudo rm -rf /var/www/html/*

        echo " copying new website "
        sleep 2
        sudo cp -r $FILE/* /var/www/html/

        echo  " removing downloaded file"
        sleep 2
        sudo rm $FILE

        echo "restarting server"
        sleep 2

        sudo systemctl restart httpd
        echo " successfully changed by using centOS"

fi
