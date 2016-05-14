#!/bin/bash
cd /var/www/osa2/
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})
BASE=$(git merge-base @ @{u})

if [ $LOCAL = $REMOTE ]; then
        break
else [ $LOCAL = $BASE ];
        git pull
fi
~

