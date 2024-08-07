# TorchServe

This repository provides Docker containers for [TorchServe](https://github.com/pytorch/serve) (an inference server for [PyTorch](https://github.com/pytorch/pytorch) models) for multiple hardware platforms.

For an example use, see [TorchServe's examples](https://github.com/pytorch/serve/tree/master/examples/object_detector/yolo/yolov8).

Instead of starting torchserve as given in the example, start it with a docker command, as follows for your platform (where your model is stored as a ```.mar``` file, in a ```model_store``` subdirectory of the directory where you are starting torchserve).

## NOTE: MAR setuptools workaround

As of torchserve v11, you will need to add ```setuptools==69.5.1``` to your ```requirements.txt``` when generating a MAR file:

https://github.com/pytorch/serve/issues/3176

## NOTE: token authorization

As of torchserve v11.1, token authorization is on. Add ```--disable-token-auth``` to turn it off.

## Platforms

* [iqtlabs/torchserve](https://hub.docker.com/r/iqtlabs/torchserve): CPU only, for arm64 (includes Pi4 and Apple) and amd64.

```docker run -v $(pwd)/model_store:/model_store -p 8080:8080 --rm --name torchserve -d iqtlabs/torchserve --models <model>=<model>.mar```

* [iqtlabs/cuda-torchserve](https://hub.docker.com/r/iqtlabs/cuda-torchserve): CUDA (12.5 or later) accelerated for amd64 only.

```docker run --gpus all -v $(pwd)/model_store:/model_store -p 8080:8080 --rm --name torchserve -d iqtlabs/cuda-torchserve --models <model>=<model>.mar```

* [iqtlabs/orin-torchserve](https://hub.docker.com/r/iqtlabs/orin-torchserve): [Jetson Orin](https://www.nvidia.com/en-us/autonomous-machines/embedded-systems/jetson-orin/), [JetPack 5.1.2](https://developer.nvidia.com/embedded/jetpack) or later, arm64 only.

```docker run --runtime nvidia -v $(pwd)/model_store:/model_store -p 8080:8080 --rm --name torchserve -d iqtlabs/orin-torchserve --models <model>=<model>.mar```

## Apple MPS support

Currently, [Docker does not support access to Apple MPS devices](https://github.com/pytorch/pytorch/issues/81224), so inference will be CPU only. However, [PyTorch itself does support MPS](https://developer.apple.com/metal/pytorch/), and so TorchServe could be run with MPS support outside a Docker container.
