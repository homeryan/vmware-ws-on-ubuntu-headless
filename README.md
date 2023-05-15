[https://www.linuxtechi.com/install-vmware-workstation-on-ubuntu/](https://www.linuxtechi.com/install-vmware-workstation-on-ubuntu/)  
 

Download VMware Workstation PRO  
To install VMware Workstation on Ubuntu 22.04, visit the Official [VMWare download Page](https://www.vmware.com/products/workstation-pro/workstation-pro-evaluation.html) and download the installation bundle as indicated below.

```text-plain
wget https://download3.vmware.com/software/WKST-1702-LX/VMware-Workstation-Full-17.0.2-21581411.x86_64.bundle
```

* * *

Install VMware Workstation  
Before starting the installation, let’s first install the prerequisites using beneath apt command,

```text-plain
sudo apt update
sudo apt install -y build-essential libxi6 libgconf-2-4 libxinerama1 libxcursor1 libxtst6 gcc make
```

To install VMware Workstation, run the following bash command. Kindly note that the VMware Workstation installation file name will be different from yours if a newer version will be made available.

```text-plain
sudo bash VMware-Workstation-Full-17.0.2-21581411.x86_64.bundle
```

The command extracts the VMware installer and installs VMware on your system. This takes roughly 5 minutes, so just be patient. At the very end, you will get confirmation that the installation was successful.

* * *

Patches needed to build VMware (Player and Workstation) host modules against recent kernels.  
[https://github.com/mkubecek/vmware-host-modules](https://github.com/mkubecek/vmware-host-modules)

```text-plain
wget https://github.com/mkubecek/vmware-host-modules/archive/workstation-17.0.2.tar.gz
tar -xzf workstation-17.0.2.tar.gz
cd vmware-host-modules-workstation-17.0.2
make
sudo make install
```

* * *

Install required additional kernel modules  
For VMware workstation to work seamlessly, some additional kernel modules are required. As such, install them as follows.

```text-plain
sudo vmware-modconfig --console --install-all
```

* * *

Add VMware Workstation Serial Number

```text-plain
sudo /usr/lib/vmware/bin/vmware-vmx-debug --new-sn XXXXX-XXXXX-XXXXX-XXXXX-XXXXX
```

* * *

Syntax of `vmrun` Commands: [https://docs.vmware.com/en/VMware-Fusion/13/com.vmware.fusion.using.doc/GUID-24F54E24-EFB0-4E94-8A07-2AD791F0E497.html](https://docs.vmware.com/en/VMware-Fusion/13/com.vmware.fusion.using.doc/GUID-24F54E24-EFB0-4E94-8A07-2AD791F0E497.html)

Start a VM:

```text-plain
#!/bin/bash
vmrun list
echo 'Starting /vm/win10/Win10-Pro.vmx'
sudo rm -rf /vm/win10/*.lck
echo '----------'
vmrun -T ws start '/vm/win10/Win10-Pro.vmx' nogui
vmrun list
```

Stop a VM:

```text-plain
#!/bin/bash
vmrun list
echo 'Soft stopping /vm/win10/Win10-Pro.vmx'
vmrun stop '/vm/win10/Win10-Pro.vmx' stop
sudo rm -rf /vm/win10/*.lck
echo '----------'
vmrun list
```

* * *

Install VMware tools on guest

```text-plain
vmrun installTools /vm/win10/Win10-Pro.vmx
```
