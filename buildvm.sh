#!/bin/bash

# build new vm image using virt-builder and spin it up using qemu

# declare variables

# image_src defines choice of os from virt-builder --list
image_src="ubuntu-18.04"

# img_size defines the max size of the vm image
img_size="10G"

# img_format defines the image format - qcow2 is prefered by qemu
img_format="qcow2"

# os_arch defines the os architecture
os_arch="x86_64"

# host_name defines the hostname of the new vm
host_name="test-vm-ubuntu1804"

# user_name defines the new user to be created
user_name="shawn"

# user_pw defines the new user's password
user_pw="password"

# out_file defines the name of the output file
out_file="$host_name.img"

# run the virt-builder command
virt-builder $image_src --format $img_format --size $img_size --arch $os_arch --hostname $host_name --network --output $out_file\
    --firstboot-command "useradd -m $user_name -p $user_pw && usermod -aG sudo $user_name"
