## How to delete a recovery partition from Windows

```
DISKPART> list disk
DISKPART> select disk 4

Disk 4 is now the selected disk.

DISKPART> list partition

  Partition ###  Type              Size     Offset
  -------------  ----------------  -------  -------
  Partition 1    Primary            223 GB  1024 KB
  Partition 3    Recovery           450 MB   223 GB
  
DISKPART> select partition 3

Partition 3 is now the selected partition.

DISKPART> delete partition override

DiskPart successfully deleted the selected partition.

DISKPART> list partition

  Partition ###  Type              Size     Offset
  -------------  ----------------  -------  -------
  Partition 1    Primary            223 GB  1024 KB
```
