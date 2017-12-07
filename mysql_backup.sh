#!/bin/bash
#by @CyrilSebastian

# Database credentials
dbuser="root"
dbpassword="test@123"
#define the db_names
db_name="DB1 DB2"

#Define directory to where backup needs to be done
data_dir="/backup"
date=`date +%d-%b-%Y`

for data in $db_name
do
  echo $data
  cd $data_dir
  mysqldump --user=$dbuser --password=$dbpassword $data > $data-$date.sql;
  gzip $data-$date.sql
  scp $data-$date.sql.gz root@192.68.1.10:/backup_data/
  rm -rf $data-$date.sql
done

#deleting old backups
/usr/bin/find /backup/ -mtime +3 -delete
