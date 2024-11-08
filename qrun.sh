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
    -nic user,model=virtio-net-pci \
    -nic model=e1000 \
    -initrd ./rootfs.cpio
