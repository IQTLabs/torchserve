#!/bin/bash

set -e
apt-get update && \
  apt-get install -y \
    git \
    curl \
    gcc g++ libev-dev libyaml-dev tini ca-certificates \
    libjpeg-dev build-essential zlib1g-dev libffi-dev libssl-dev libbz2-dev libreadline-dev libsqlite3-dev liblzma-dev && \
  export PYENV_ROOT="/pyenv" && \
  curl https://pyenv.run | bash && \
  export PATH="${PATH}:${PYENV_ROOT}/bin:${PYENV_ROOT}/shims" && \
  pyenv install 3.11 && \
  pyenv global 3.11 && \
  $(dirname $0)/clone-torchserve.sh && \
  cd serve && \
  python3 ./ts_scripts/install_dependencies.py --environment prod $* && \
  pip install . && \
  cd .. && \
  rm -rf serve && \
  $(dirname $0)/install-common.sh
