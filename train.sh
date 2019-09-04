#!/usr/bin/env bash

# source activate faster-rcnn.pytorch

# --ls (whether use large imag scale)
# --cag (whether to perform class_agnostic bbox regressio)

nohup python ./trainval_net.py --dataset pascal_voc --net res101  --cuda --mGPUs \
        --nw 16  --epochs 10 --bs 16 --lr 6e-3 --lr_decay_step 8 \
        --s 2 \
>  output/res101_voc_session2.log 2>&1 &