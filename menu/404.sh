#!/bin/bash
#na podstawie banish404
cd /tmp/netext73

GLOBAL_SOURCE="/etc/apt/sources.list"
PPA_SOURCE="/etc/apt/sources.list.d"
BACKUP_FOLDER="/etc/apt/sources_"

BACKUP_FOLDER=${BACKUP_FOLDER}$(date +%Y%m%d-%T)

echo "sources backup folder: $BACKUP_FOLDER"


# safety first - lets do some backups before we potentially change stuff

sudo mkdir -p "$BACKUP_FOLDER"
sudo cp ${GLOBAL_SOURCE} "$BACKUP_FOLDER"
sudo cp -r ${PPA_SOURCE} "$BACKUP_FOLDER"
tput setaf 6
echo "checking PPAs..."

# first check PPAs are still valid
TEMP=$(mktemp);
APT=$(mktemp);
sudo apt-get update > /dev/null 2> $APT
cat $APT | grep '404' | awk '{print $5}' | awk -F/ '{print $4"-"$5"-"$8".list"}' > $TEMP
SOURCES=`cat $TEMP`
for line in $SOURCES
do
	fspath=`echo $PPA_SOURCE/$line`
	if [ -f $fspath ]; then
		tput setaf 1
		echo "Disabling $fspath... "
		sudo sed -i "s/^deb/# deb/" $fspath
		echo "Done!"
	fi
done
rm -f $TEMP
rm -f $APT

# now check that standard software sources are still valid
echo "checking software sources..."

SOURCE=$(mktemp);
NEWSOURCE=$(mktemp);

# for every line in source sources construct the associated web url
while read line
do
        HTTP=""
        tput setaf 1
	if [ "${line:0:7}" = "deb-src" ]; then
		# we must be looking at debian sources
		HTTP=`echo $line | awk '{print $2}'`
		
		if [[ $HTTP != */ ]];then
			HTTP="$HTTP/"
		fi
		
		HTTP_REMAINDER=`echo $line | awk '{print "dists/"$3"/"$4"/source"}'`
		HTTP=${HTTP}${HTTP_REMAINDER}
		
		found=`wget -S --spider $HTTP -o $SOURCE; grep "404 Not Found" $SOURCE`

		if [ -n "$found" ];then
				echo "Disabling $line... "
				line=`echo "#$line"`
				tput sgr0
				echo "Done!"
		fi


	elif [ "${line:0:3}" = "deb" ]; then 	
		# we must be looking at standard sources
		HTTP=`echo $line | awk '{print $2}'`
		
		if [[ $HTTP != */ ]];then
			HTTP="$HTTP/"
		fi
		
		HTTP_REMAINDER=`echo $line | awk '{print "dists/"$3"/"$4}'`
		HTTP=${HTTP}${HTTP_REMAINDER}
		
		found=`wget -S --spider $HTTP -o $SOURCE; grep "404 Not Found" $SOURCE`

		if [ -n "$found" ]; then
				echo "Disabling $line... "
				line=`echo "#$line"`
				tput sgr0
				echo "Done!"
		fi
	fi

	echo $line >> $NEWSOURCE

done < $GLOBAL_SOURCE

sudo rm -f $SOURCE
sudo cp ${NEWSOURCE} ${GLOBAL_SOURCE}
sudo rm -f $NEWSOURCE
tput setaf 2
echo "Completed" 
echo -e "software source checks completed\nbackups are in $BACKUP_FOLDER"
tput setaf 1
exit 0
 