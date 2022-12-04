#!/bin/bash

THE_FILE_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source "$THE_FILE_DIR"/_vars.sh
source "$THE_FILE_DIR"/_mount.sh

cd "$BACKUP_MOUNT_DIR/$BACKUP_FOLDER_NAME" || exit

TAR_FNAME="$BACKUP_FOLDER_NAME-$(date +%Y-%m-%d).tar"

sudo tar --exclude="home/kama/Music/*" -cf "$BACKUP_MOUNT_DIR/$TAR_FNAME" -- *
