#!/bin/bash
USER="ubuntu"
echo 
for host in $( cat remhosts)
do 
    echo "########################################"
    echo "Connecting to $host"
    echo "Publishing scripts to $host"
    scp -i nordkeypair.pem multi_host_config.sh $USER@$host:/tmp/
    echo "Executing script on $host"
    ssh -i nordkeypair.pem $USER@$host sudo bash /tmp/multi_host_config.sh
    ssh -i nordkeypair.pem $USER@$host sudo rm -rf /tmp/multihost_config.sh
    echo "#########################################"
done
