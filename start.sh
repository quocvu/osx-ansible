#!/bin/bash

echo "==========================================="
echo "  Setting up your Mac                      "
echo "==========================================="

sudo easy_install pip
sudo easy_install ansible

install_dir="~/setupmac-$RANDOM"
mkdir $install_dir

git clone https://github.com/quocvu/osx-ansible.git $install_dir
if [ ! -d $install_dir ]; then
    echo "git cloned failed"
    exit 1
else
    cd $install_dir
    mkdir -p ~/.ansible/roles
    ansible-galaxy install -r requirements.yml
    ansible-playbook -i ./hosts playbook.yml --verbose
fi

echo "Cleaning up. Remove repo..."
rm -Rfv /tmp/$install_dir

echo "All done!"
exit 0
