#!/bin/bash

RESPONSE=$(curl localhost:8080/ping | jq .status)
if [ "${RESPONSE}" == '"Healthy"' ]; then
  exit 0
fi
exit 1
