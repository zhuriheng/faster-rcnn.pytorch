#!/usr/bin/env bash
set -eux
set -o pipefail

source activate faster-rcnn.pytorch

cd ../../

# --ls (whether use large imag scale)
# --cag (whether to perform class_agnostic bbox regressio)
# --mGPUs

# ********************* 8 GPU *********************** #
## 1x schedule
#version="1"
#max_epoch="12"
#workers="16"
#batch="8"
#lr="0.01"
#lr_decay_step="8"

# 2x schedule
version="2"
max_epoch="24"
workers="16"
batch="8"
lr="0.01"
lr_decay_step="16"

# ********************* 4 GPU *********************** #
## 1x schedule
#version="1"
#max_epoch="12"
#workers="8"
#batch="4"
#lr="0.005"
#lr_decay_step="8"

## 2x schedule
#version="2"
#max_epoch="24"
#workers="8"
#batch="4"
#lr="0.005"
#lr_decay_step="16"


# train res101
CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7  \
nohup python ./trainval_net.py \
                --dataset coco \
                --net res101  \
                --cuda \
                --nw ${workers}  \
                --epochs ${max_epoch} \
                --bs ${batch} \
                --lr ${lr} \
                --lr_decay_step ${lr_decay_step} \
                --s ${version} \
                --use_tfb \
                --ls \
                --mGPUs \
        >  coco_res101_epoch_${max_epoch}_v0.${version}.log 2>&1 &



## train res50
#CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7  \
#nohup python ./trainval_net.py \
#                --dataset coco \
#                --net res50  \
#                --cuda \
#                --nw ${workers}  \
#                --epochs ${max_epoch} \
#                --bs ${batch} \
#                --lr ${lr} \
#                --lr_decay_step ${lr_decay_step} \
#                --s ${version} \
#                --use_tfb \
#                --ls \
#                --mGPUs \
#        >  coco_res50_epoch_${max_epoch}_v0.${version}.log 2>&1 &