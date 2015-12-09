#!/bin/bash

set -e

SSH_CONFIG=$(dirname $0)/ssh-config

echo 'Checking if code is up to date...'
SOURCE_MD5="$(ssh -F $SSH_CONFIG solo -t "md5sum /tmp/solocode.tar.gz | awk '{ print \$1 }'" | tr -d '\r\n')"
LOCAL_MD5="$(md5sum solocode.tar.gz | awk '{ print $1 }' | tr -d '\r\n')"

if [ "$SOURCE_MD5" != "$LOCAL_MD5" ] || [ "$1" == "--force" ]; then
    echo 'Uploading new code...'
    scp -F $SSH_CONFIG solocode.tar.gz solo:/tmp/solocode.tar.gz
    ssh -F $SSH_CONFIG solo -t '
set -e
rm -rf /tmp/solocode || true
mkdir /tmp/solocode
cd /tmp/solocode
tar -xvf /tmp/solocode.tar.gz
virtualenv --clear env || virtualenv env
source ./env/bin/activate
pip install --no-index -UI ./wheelhouse/* 
'

else
    echo 'Code already up to date.'
fi
