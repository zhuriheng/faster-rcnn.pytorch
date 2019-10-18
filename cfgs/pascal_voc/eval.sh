#!/usr/bin/env bash
set -eux
set -o pipefail

source activate faster-rcnn.pytorch

cd ../../

dataset="pascal_voc"
net="res152"
log_time="2019-10-15-17-54"
checksession="2"
checkepoch="10"
checkpoint="2504"

CUDA_VISIBLE_DEVICES=3  \
nohup python test_net.py  --dataset ${dataset} \
                    --net ${net} \
                    --cuda \
                    --checksession ${checksession} \
                    --checkepoch ${checkepoch} \
                    --checkpoint ${checkpoint} \
                    --input_dir output/${dataset}/${net}/${log_time} \
                > eval_${dataset}_${net}_v0.${checksession}_${checkepoch}.log 2>&1 &