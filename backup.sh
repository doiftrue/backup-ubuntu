#!/bin/bash

THE_FILE_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source "$THE_FILE_DIR"/_vars.sh
source "$THE_FILE_DIR"/_mount.sh

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
/var/log/*
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

