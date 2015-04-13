
function getWebdirectories {
	websiteList=`ls $WEBSERVER_ROOT`
	for entry in $websiteList; do
		if [ -d "$WEBSERVER_ROOT/$entry" ]; then
			echo $entry
		fi
	done
}


