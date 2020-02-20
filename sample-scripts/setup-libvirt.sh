#!/bin/bash

##
## NOTE: you must point to the correct inventory
##
##   Take a sample config from ./configs and 
##   copy it to ./playbooks/vars-custom/master-config.yml
##

myInventory="./config/master-config.yml"

## This script is intended to be run:
##     on the libvirt hypervisor node
##     in the project directory
##     EX: CWD == ~root/OCP4-Workshop

if [ ! -e "${myInventory}" ] ; then
    echo "ERROR: Are you in the right directory? Can not find ${myInventory}" ; exit
    exit
fi

if [ ! -e "./playbooks" ] ; then
    echo "ERROR: Are you in the right directory? Can not find ./playbooks" ; exit
    exit
fi

##
##
##

case "$1" in
    "all")
        time ansible-playbook -i ${myInventory} -f 10 ./playbooks/libvirt-setup.yml 
        ;;
         
    "basics")
        time ansible-playbook -i ${myInventory} -f 10 ./playbooks/libvirt-basics.yml 
        ;;
         
    "cockpit")
        time ansible-playbook -i ${myInventory} -f 10 ./playbooks/libvirt-cockpit.yml 
        ;;

    "network")
        time ansible-playbook -i ${myInventory} -f 10 ./playbooks/libvirt-network.yml 
        ;;
         
    "dns")
        time ansible-playbook -i ${myInventory} -f 10 ./playbooks/libvirt-dns.yml 
        ;;
         
    "bastion")
        time ansible-playbook -i ${myInventory} -f 10 ./playbooks/libvirt-create-bastion.yml 
        ;;

    "repo")
        time ansible-playbook -i ${myInventory} -f 10 ./playbooks/libvirt-repo.yml 
        ;;

    "secret")
        time ansible-playbook -i ${myInventory} -f 10 ./playbooks/libvirt-deploy-secret.yml 
        ;;

    "bootstrap")
        time ansible-playbook -i ${myInventory} -f 10 ./playbooks/libvirt-create-bootstrap.yml 
        ;;

    "masters")
        time ansible-playbook -i ${myInventory} -f 10 ./playbooks/libvirt-create-masters.yml 
        ;;

    "workers")
        time ansible-playbook -i ${myInventory} -f 10 ./playbooks/libvirt-create-workers.yml 
        ;;

    *)
        echo "USAGE: libvirt-setup.sh [ all | basics | network | dns | bastion | secret | repo | bootstrap | masters | workers ]"
        ;;

esac         

