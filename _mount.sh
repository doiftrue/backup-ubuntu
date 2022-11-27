#!/bin/bash

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