#!/bin/sh
exec $(which torchserve) --start --model-store /model_store --ts-config /torchserve/config.properties --ncs --foreground $*
