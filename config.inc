
WEBSERVER_ROOT="/www/"

BACKUPDIR="/mnt/disk/backups/"
DBDUMPDIR="${BACKUPDIR}databases/"

RETENTION=3 # keep x backups

TARBIN=`which tar`
#TARBIN='echo'

MYSQLDUMP='mysqldump'
#MYSQLDUMP='echo'
