# This script is to autonamte configuration of webservers on multiple vms from local server.
#!/bin/bash


# Checking the server type and depends on the server type executes script on them.
# & > /dev/null ---- output of the command stores nothing and displays nothing on scrren.
sudo yum --help > /dev/null 
if [ $? -eq 0 ]
then
    # variables declaration
    PACKAGE="httpd unzip vim wget"
    SVC="httpd"
    TEMP_DIR="/tmp/web_files"
    SRC_CODE="2098_health"
    URL="https://www.tooplate.com/zip-templates/2098_health.zip"
    # installing dependencies for AWS Linux
    echo "########################################################"
    echo "Installing.. Dependencies for $SVC"
    sudo yum update -y && sudo yum install $PACKAGE -y > /dev/null
    echo "########################################################"


    # Start & enable server
    echo "########################################################"
    echo "Staring and enabling $SVC"
    sudo systemctl start $SVC
    sudo systemctl enable $SVC
    echo "########################################################"


    # create temp directory
    echo "########################################################"
    echo "Creating Temporary dir on server"
    sudo mkdir -p $TEMP_DIR
    cd $TEMP_DIR
    echo "########################################################"


    echo "########################################################"
    echo "Downloading Source_code and copying to html dir of $SVC "

    sudo wget $URL &> /dev/null
    sudo unzip $SRC_CODE.zip &> /dev/null
    sudo cp -r $SRC_CODE/* /var/www/html/
    echo "########################################################"

    # Restarting Service
    echo "########################################################"
    echo "Restarting $SVC service"
    sudo systemctl restart $SVC
    echo "########################################################"

    echo "Status of $SVC server"
    sudo systemctl status $SVC |  head -3
    echo "########################################################"

    # Removing temporary files
    echo "########################################################"
    echo "Removing Temporary files on $hostname Server"
    cd ..
    sudo rm -rf $TEMP_DIR
    echo "########################################################"
    echo "Contents of html directory"
    sudo ls /var/www/html/
else
    # variables declaration
    PACKAGE="apache2 unzip vim wget"
    SVC="apache2"
    TEMP_DIR="/tmp/web_files"
    SRC_CODE="2098_health"
    URL="https://www.tooplate.com/zip-templates/2098_health.zip"
    # installing dependencies for AWS Linux
    echo "########################################################"
    echo "Installing.. Dependencies for $SVC"
    sudo apt-get update -y && sudo apt-get install $PACKAGE -y &> /dev/null
    echo "########################################################"


    # Start & enable server
    echo "########################################################"
    echo "Staring and enabling $SVC"
    sudo systemctl start $SVC
    sudo systemctl enable $SVC
    echo "########################################################"


    # create temp directory
    echo "########################################################"
    echo "Creating Temporary dir on server"
    sudo mkdir -p $TEMP_DIR
    cd $TEMP_DIR
    echo "########################################################"


    echo "########################################################"
    echo "Downloading Source_code and copying to html dir of $SVC "

    sudo wget $URL &> /dev/null
    sudo unzip $SRC_CODE.zip &> /dev/null
    sudo cp -r $SRC_CODE/* /var/www/html/
    echo "########################################################"

    # Restarting Service
    echo "########################################################"
    echo "Restarting $SVC service"
    sudo systemctl restart $SVC
    echo "########################################################"

    echo "Status of $SVC server"
    sudo systemctl status $SVC |  head -3
    echo "########################################################"

    # Removing temporary files
    echo "########################################################"
    echo "Removing Temporary files on $SVC Server"
    cd ..
    sudo rm -rf $TEMP_DIR
    echo "########################################################"
    echo "Contents of html directory"
    sudo ls /var/www/html/
fi