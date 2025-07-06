#!/bin/bash
#
#
# This script runs qemu with timing mode

function realpath(){
    local  path="$( readlink -f "$1" )"
    echo "$path"
}

cd $(dirname $( realpath $0 ))

QEMU_PATH=$(realpath "../qemu/arm-softmmu")
IMAGES_PATH=$(realpath "../images")
KERNEL_PATH=${IMAGES_PATH}"/kernel"
KERNEL="vmlinux-3.2.0-4-arm”
INITRD="initrd.img-3.2.0-4-arm”
QCOW2_PATH=${IMAGES_PATH}"/debian-blank"
QCOW2="debian-sparc64.qcow2"
PREFIX=""


help(){
	echo -e "$0 [options]"
}
for i in "$@"
do
    case $i in
        -g|--gdb)
        PREFIX="gdb ${QEMU_PATH}/qemu-system-arm --args "
        shift
        ;;
        -h|--help)
	help
	exit
        shift
        ;;
        *)
        echo "$0 : what do you mean by $i ?"
        help
        exit
        ;;
    esac
done

cd ${SIM_PATH}

${PREFIX} ${QEMU_PATH}/qemu-system-arm \
-L pc-bios -m 384 \
-kernel ${KERNEL_PATH}/${KERNEL} \
-initrd ${KERNEL_PATH}/${INITRD} \
-drive file=${QCOW2_PATH}/${QCOW2},if=virtio,index=0 \
-rtc base='2006-06-17T16:01:21',clock=vm \
-net none -append 'modprobe.blacklist=pata_cmd64x root=/dev/vda1' \
--monitor telnet::4440,server,nowait 
