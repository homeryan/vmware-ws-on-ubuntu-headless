#!/bin/bash
cd /tmp
echo 'Fetching vmware-host-modules for VMware Workstation Pro 17.0.2'
wget https://github.com/mkubecek/vmware-host-modules/archive/workstation-17.0.2.tar.gz
tar -xzf workstation-17.0.2.tar.gz
cd vmware-host-modules-workstation-17.0.2
echo 'Compiling vmware-host-modules'
make
echo 'Installing vmware-host-modules'
sudo make install
echo '----------'
echo 'Installing required additional kernel modules'
sudo vmware-modconfig --console --install-all
echo '----------'
echo 'Cleaning up installation files'
rm -rf /tmp/workstation-17.0.2.tar.gz
rm -rf /tmp/vmware-host-modules-workstation-17.0.2
