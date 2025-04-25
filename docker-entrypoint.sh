#!/usr/bin/env bash

export CLAMMIT_CFG_FILE=${CLAMMIT_CFG_FILE:-/etc/clammit/clammit.cfg}
if [ -f "${CLAMMIT_CFG_FILE}.tpl" ]; then
    envsubst < "${CLAMMIT_CFG_FILE}.tpl" > ${CLAMMIT_CFG_FILE}
fi

exec $@
