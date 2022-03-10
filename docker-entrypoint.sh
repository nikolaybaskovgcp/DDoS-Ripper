#!/bin/bash
set -ex
PROXY=''
sleep "${START_DELAY:-0}"
if [[ "${USE_PROXYCHAIN:-no}" == "yes" ]];
then
	PROXY=/usr/bin/proxychains4
fi
exec ${PROXY} python3 ./DRipper.py "$@"
