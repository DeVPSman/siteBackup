
function getWebdirectories {
	websiteList=`ls $WEBSERVER_ROOT`
	for entry in $websiteList; do
		if [ -d "$WEBSERVER_ROOT/$entry" ]; then
			echo $entry
		fi
	done
}


function readJoomlaConfig {
	webdir=${1}
	joomlaConfig="${webdir}/configuration.php"
}

function getDatabases {
	echo "show databases" | mysql | grep -v Database | grep -v information_schema | grep -v performance_schema
}

function getDeletelist {
	backupTarget=${1}
	backupList=`ls -t ${backupTarget}* 2> /dev/null `
	keepBackupsList=`ls -t ${backupTarget}* 2> /dev/null | head -${RETENTION} `
	for file in $backupList; do
		inKeepList=`echo $keepBackupsList | grep $file`
		if ! [ "$inKeepList" ]; then
			echo "$file"
		fi
	done
}
