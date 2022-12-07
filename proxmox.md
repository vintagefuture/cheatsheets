# Where the VMs config files are stored
`/etc/pve/qemu-server/*.conf`

# How to passthrough an internal disk to a VM

```
qm set  592  -scsi2 /dev/disk/by-id/ata-ST3000DM001-1CH166_Z1F41BLC

update VM 592: -scsi2 /dev/disk/by-id/ata-ST3000DM001-1CH166_Z1F41BLC
```

# How to resize a VM disk

```
qm resize 100 virtio0 +5G
```

Sources:

https://pve.proxmox.com/wiki/Manual:_qm.conf

https://pve.proxmox.com/wiki/Passthrough_Physical_Disk_to_Virtual_Machine_(VM)
# How to expand the LV storage on Ubuntu server

```
vgdisplay
```
```
lvdisplay
```
```
lvextend -l +100%FREE /dev/ubuntu-vg/ubuntu-lv
```
```
resize2fs /dev/mapper/ubuntu--vg-ubuntu--lv
```

Source: https://packetpushers.net/ubuntu-extend-your-default-lvm-space/
