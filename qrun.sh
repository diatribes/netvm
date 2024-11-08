#!/bin/bash
qemu-system-x86_64 \
    -display none \
    -no-user-config \
    -nodefaults \
    -m 64M \
    -serial stdio \
    -cpu host \
    -enable-kvm  \
    -kernel ./bzImage \
    -append "notsc" \
    -netdev user,id=mynet0,net=192.168.76.0/24,dhcpstart=192.168.76.9 \
    -nic user,model=virtio-net-pci \
    -initrd ./rootfs.cpio



