#!/bin/bash
# creates a new vm and names it using the provided hostname
# spins up a vm and maps port 10022 on the hos to port 22 on the guest
# use 'ssh shawn@localhost -p 10022'

# get hostname and set variables
echo -e "Enter hostname: "
read hname
imgname="$hname.img"

# create a new image by copying the ubuntu-focal-image.img file
cp ubuntu-focal-image.img $imgname

# set hostname inside the vm - requires root
sudo virt-customize -a $imgname --hostname $hname

# spin up the vm
qemu-system-x86_64 -m 1G -boot d -enable-kvm -smp 2 -nic user,model=e1000,hostfwd=tcp::10022-:22 -hda $imgname