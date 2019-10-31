#!/bin/bash

sudo yum -y update
sudo yum -y install epel-release
sudo yum -y install ansible

export ANSIBLE_HOST_KEY_CHECKING=False

sudo chmod 400 Ansible-Test.pem

ansible-playbook -i inventory prepare.yml --key-file Ansible-Test.pem
ansible-playbook -i inventory openshift-ansible/playbooks/prerequisites.yml --key-file Ansible-Test.pem
ansible-playbook -i inventory openshift-ansible/playbooks/deploy_cluster.yml --key-file Ansible-Test.pem