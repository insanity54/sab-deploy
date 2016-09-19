#!/bin/sh
#install ansible prereqs manually or all apt-based ansible commands will fail
# http://euphonious-intuition.com/2013/01/bootstrapping-a-cluster-with-ansible-debian-6-and-oracle-java-7/
if [ ! -f /root/.ansible_prereqs_installed ]; then
        apt-get update
        apt-get install -y sshpass
        touch /root/.ansible_prereqs_installed
        echo "CHANGE"
fi
