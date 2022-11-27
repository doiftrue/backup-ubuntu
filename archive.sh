#!/bin/bash

THE_FILE_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source "$THE_FILE_DIR"/_vars.sh

sudo tar cf "$BACKUP_MOUNT_DIR/$BACKUP_FOLDER_NAME-$(date +%Y-%m-%d)".tar "$DESTINATION_DIR"
