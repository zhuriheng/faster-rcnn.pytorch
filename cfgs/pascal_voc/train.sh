#!/usr/bin/env bash
set -eux
set -o pipefail

source activate faster-rcnn.pytorch

cd ../../

# --ls (whether use large imag scale)
# --cag (whether to perform class_agnostic bbox regressio)
# --mGPUs

# train res101
#CUDA_VISIBLE_DEVICES=2  \
#nohup python ./trainval_net.py \
#                --dataset pascal_voc \
#                --net res101  \
#                --cuda \
#                --nw 10  \
#                --epochs 10 \
#                --bs 2 \
#                --lr 2e-3 \
#                --lr_decay_step 8 \
#                --s 2 \
#                --use_tfb \
#        >  pascal_voc_res101_v0.2.log 2>&1 &

# train res50
#CUDA_VISIBLE_DEVICES=0  \
#nohup python ./trainval_net.py \
#                --dataset pascal_voc \
#                --net res50  \
#                --cuda \
#                --nw 4  \
#                --epochs 7 \
#                --bs 1 \
#                --lr 1e-3 \
#                --lr_decay_step 5 \
#                --s 1 \
#                --use_tfb \
#        >  pascal_voc_res50_v0.1.log 2>&1 &

# train res152
CUDA_VISIBLE_DEVICES=2  \
nohup python ./trainval_net.py \
                --dataset pascal_voc \
                --net res152  \
                --cuda \
                --nw 4  \
                --epochs 7 \
                --bs 1 \
                --lr 1e-3 \
                --lr_decay_step 5 \
                --s 1 \
                --use_tfb \
        >  pascal_voc_res152_v0.1.log 2>&1 &

# train vgg16
#CUDA_VISIBLE_DEVICES=3  \
#nohup python ./trainval_net.py \
#                --dataset pascal_voc \
#                --net vgg16  \
#                --cuda \
#                --nw 10  \
#                --epochs 6 \
#                --bs 1 \
#                --lr 1e-3 \
#                --lr_decay_step 5 \
#                --s 3 \
#                --use_tfb \
#        >  pascal_voc_vgg16_test.log 2>&1 &