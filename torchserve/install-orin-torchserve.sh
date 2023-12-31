#!/bin/bash

set -e
apt-get update && \
  apt-get install -y \
    git \
    python3-pip \
    openjdk-17-jdk \
    wget \
    numactl
  apt-get purge -y opencv-python && \
  pip install "opencv-python<4.8.0.76" && \
  echo /usr/local/lib/python3.8/dist-packages/opencv_python.libs > /etc/ld.so.conf.d/opencv.conf && \
  ldconfig && \
  $(dirname $0)/clone-torchserve.sh && \
  cd serve && \
  pip install -r requirements/common.txt && \
  pip install -r requirements/common_gpu.txt && \
  pip install -r requirements/torch_common.txt && \
  pip install . && \
  cd .. && \
  rm -rf serve && \
  $(dirname $0)/install-common.sh
