#!/bin/bash

set -e
apt-get update && \
  apt-get install -y \
    git \
    python3-pip && \
  git clone https://github.com/pytorch/serve -b v0.9.0 && \
  cd serve && \
  cp /dev/null requirements/torch_linux.txt && \
  python3 ./ts_scripts/install_dependencies.py --environment prod $* && \
  pip install . && \
  cd .. && \
  rm -rf serve

