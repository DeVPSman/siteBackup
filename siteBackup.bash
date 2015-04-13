#!/bin/bash

. config.inc
. functions.inc

TIMESTRING=`date +%F-%H%M`
webdirs=`getWebdirectories`

for site in $webdirs; do
	# tarren
	$TARBIN czfv ${BACKUPDIR}/${site}.${TIMESTRING}.tgz ${WEBSERVER_ROOT}/${site}
done
