#!/usr/bin/env bash
set -eux
set -o pipefail

cd /workspace/mnt/bucket/personal/zhuriheng/pvc/
ls @r
mkdir -p /dev/shm/data

tar xvf VOCdevkit_0717.tar -C /dev/shm/data