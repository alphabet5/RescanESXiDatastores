# RescanESXiDatastores
 Startup script to start VM's after the datastore (san) is available.
 
## Instructions
Place local.sh from this repo in /etc/rc.local.d/, or edit the existing local.sh.

Modify the local.sh to include the name of the datastore to rescan. The example uses 'freenas' as the datastore.

Note: VmWare does not recommend modifying local.sh. This file is also replaced when esxi is updated.

After updating local.sh, sync the changes.
```bash
/sbin/auto-backup.sh
```

This will regenerate the state.tgz file. It will also be automatically regenerated with an hourly cron job, or during a graceful shutdown or restart. It is best to manually run it, just in case. See [here](https://kb.vmware.com/s/article/2001780) for more details.

See [here](https://kb.vmware.com/s/article/2043564) for more details on modifying local.sh.
