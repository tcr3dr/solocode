#!/bin/bash

SSH_CONFIG=$(dirname $0)/ssh-config

# In case files arent synced
$(dirname $0)/solocode-push.sh

echo ''

ssh -F $SSH_CONFIG solo -t "
set -e
cd /tmp/solocode
source ./env/bin/activate
exec python $1
"
