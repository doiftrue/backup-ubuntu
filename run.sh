#!/bin/bash

# create tar file
# sudo tar cf /media/kama/2TB-BACKUP/system-backup-$(date +%Y-%m).zip /media/kama/2TB-BACKUP/system-backup/
# OR
# sudo tar cf system-backup-$(date +%Y-%m-%d).tar system-backup/

BACKUP_MOUNT_DIR=/media/kama/2TB-BACKUP

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

SOURCE=/
DESTINATION="$BACKUP_MOUNT_DIR/system-backup"
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
Downloads/*
*/node_modules/*
*/RECOVERED_FILES/
/home/kama/.cache/
*/TelegramDesktop/tdata/user_data/media_cache/*"

rsync -aAXv --delete --delete-excluded --exclude-from=<(printf "%s" "$EXCLUDE_DIRS";) "$SOURCE" "$DESTINATION"

