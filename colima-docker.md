## Colima won't start

Error:

`exiting, status={Running:false Degraded:false Exiting:true Errors:[] SSHLocalPort:0}`

`.colima/_lima/_networks/user-v2/user-v2_qemu.sock: connect: connection refused`


Solution:

```bash
rm ~/.colima/_lima/_networks/user-v2/usernet_user-v2.pid
```

```bash
colima start
```
