#!/usr/bin/env bash
set -eux
set -o pipefail

source activate faster-rcnn.pytorch

cd ../../

dataset="pascal_voc"
net="vgg16"
log_time="2019-10-14-16-34"
checksession="2"
checkepoch="9"
checkpoint="2504"

CUDA_VISIBLE_DEVICES=3  \
nohup python test_net.py  --dataset ${dataset} \
                    --net ${net} \
                    --cuda \
                    --checksession ${checksession} \
                    --checkepoch ${checkepoch} \
                    --checkpoint ${checkpoint} \
                    --input_dir output/${dataset}/${net}/${log_time} \
                > eval_${dataset}_${net}_v0.${checksession}.log 2>&1 &