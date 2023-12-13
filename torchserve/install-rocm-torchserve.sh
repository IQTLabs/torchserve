#!/bin/bash

set -e
apt-get update && \
  apt-get install -y \
    git \
    python3-pip && \
  $(dirname $0)/clone-torchserve.sh && \
  cd serve && \
  cp /dev/null requirements/torch_linux.txt && \
  python3 ./ts_scripts/install_dependencies.py --environment prod $* && \
  pip install . && \
  cd .. && \
  rm -rf serve && \
  $(dirname $0)/install-common.sh
