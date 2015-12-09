#!/bin/bash

set -e

PREVDIR=$(pwd)

rm -rf /tmp/solocode || true
cp -rf . /tmp/solocode

cd /tmp/solocode
rm -rf env
virtualenv env
source ./env/bin/activate
echo 'import sys; import distutils.core; s = distutils.core.setup; distutils.core.setup = (lambda s: (lambda **kwargs: (kwargs.__setitem__("ext_modules", []), s(**kwargs))))(s)' > env/lib/python2.7/site-packages/distutils.pth
pip install wheel
pip wheel -r ./requirements.txt --build-option="--plat-name=py27"
tar -cvzf "$PREVDIR/solocode.tar.gz" --exclude solocode.tar.gz --exclude .git --exclude env -C /tmp/solocode .
