#!/bin/bash
# starts a qemu vm using provided image file
echo -e "Enter image file name: "
read name
qemu-system-x86_64 -m 1G -boot d -enable-kvm -smp 2 -nic user,model=e1000,hostfwd=tcp::10022-:22 -hda $name