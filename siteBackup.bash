#!/bin/bash

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

. config.inc
. functions.inc

TIMESTRING=`date +%F-%H%M`

# tests
if ! [ -d "${BACKUPDIR}" ]; then
	echo "backup dir ${BACKUPDIR} bestaat niet!"
	mkdir ${BACKUPDIR};
fi

if ! [ -d "${DBDUMPDIR}" ]; then
	echo "Database backup dir ${DBDUMPDIR} bestaat niet!"
	mkdir ${DBDUMPDIR};
fi

cd ${WEBSERVER_ROOT}

for site in `getWebdirectories`; do
	# tarren
	backupFile="${BACKUPDIR}/${site}.${TIMESTRING}.tgz"
	echo "Making backup: ${backupFile}"
	$TARBIN czf ${backupFile} ${site}
	deleteList=`getDeletelist ${BACKUPDIR}/${site}`
	for deleteBackup in $deleteList; do
		echo "deleting backup: $deleteBackup"
		rm ${deleteBackup}
	done
done

for db in `getDatabases`; do
	backupFile="${DBDUMPDIR}/${db}.${TIMESTRING}.sql.gz"
	echo "Making database dump: $backupFile"
	$MYSQLDUMP -cnl ${db} | gzip -5 > ${backupFile}
	deleteList=`getDeletelist ${DBDUMPDIR}/${db}`
	for deleteBackup in $deleteList; do
		echo "deleting database backup: $deleteBackup"
		rm ${deleteBackup}
	done
done





