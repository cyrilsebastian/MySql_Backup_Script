#Basic MySql backup script.

You need to define username, password, database names and directory(where backup
needs to taken).

This script will be taking the backup, compressing and will be transferring the
backup to another machine.

crontab entry
* 05 * * * /bin/bash /root/backup.sh > backup.log
