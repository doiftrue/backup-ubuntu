#!/bin/bash

THE_FILE_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source "$THE_FILE_DIR"/_vars.sh

is_mounted() {
    mountpoint -q "$1"
}

if is_mounted "$BACKUP_MOUNT_DIR"
	then
		echo "OK: Already mounted."
	else
		echo "Pre Work: Mount 2TB-BACKUP to $BACKUP_MOUNT_DIR."
		mkdir "$BACKUP_MOUNT_DIR"
		mount --label="2TB-BACKUP" "$BACKUP_MOUNT_DIR"
fi

cd / || exit

EXCLUDE_DIRS="/dev/*
/proc/*
/sys/*
/tmp/*
/run/*
/mnt/*
/media/*
/lost+found
/swapfile
*/Trash/*
*/tmp/*
*/temp/*
*/.cache/*
Downloads/*
*/node_modules/*
*/RECOVERED_FILES/
*/TelegramDesktop/tdata/user_data/cache/*
*/TelegramDesktop/tdata/user_data/media_cache/*"

rsync -aAXv --delete --delete-excluded --exclude-from=<(printf "%s" "$EXCLUDE_DIRS";) "$SOURCE_DIR" "$DESTINATION_DIR"

