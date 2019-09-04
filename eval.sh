#!/usr/bin/env bash

# source activate faster-rcnn.pytorch

python test_net.py --dataset pascal_voc --net res101 --cuda \
                   --checksession 1 --checkepoch 20 --checkpoint 2504 \
                   --input_dir output/res101/pascal_voc/2019-04-17-17-38