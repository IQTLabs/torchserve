# TorchServe

This repository provides Docker containers for [TorchServe](https://github.com/pytorch/serve) (an inference server for [PyTorch](https://github.com/pytorch/pytorch) models) for multiple hardware platforms.

For an example use, see https://github.com/iqtlabs/gamutrf/tests/test_torchserve.sh, or see [TorchServe's examples](https://github.com/pytorch/serve/tree/master/examples/object_detector/yolo/yolov8).

## Platforms

* [iqtlabs/torchserve](https://hub.docker.com/r/iqtlabs/torchserve): CPU only, for arm64 (includes Pi4 and Apple) and amd64.
* [iqtlabs/cuda-torchserve](https://hub.docker.com/r/iqtlabs/cuda-torchserve): CUDA accelerated for amd64 only.
* [iqtlabs/orin-torchserve](https://hub.docker.com/r/iqtlabs/orin-torchserve): [Jetson Orin](https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/jetson-orin/), arm64 only.

## Apple MPS support

Currently, [Docker does not support access to Apple MPS devices](https://github.com/pytorch/pytorch/issues/81224), so inference will be CPU only. However, [PyTorch itself does support MPS](https://developer.apple.com/metal/pytorch/), and so TorchServe could be run with MPS support outside a Docker container.
