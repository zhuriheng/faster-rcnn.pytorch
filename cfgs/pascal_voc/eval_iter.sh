#!/usr/bin/env bash
set -eux
set -o pipefail

source activate faster-rcnn.pytorch

cd ../../

eval_model(){
    model_path=$1

    runCmd="CUDA_VISIBLE_DEVICES=2 \
                   nohup python test_net.py --dataset pascal_voc --net vgg16 --cuda \
                   --checksession 2 --checkepoch ${1} --checkpoint 2504 \
                   --input_dir output/pascal_voc/vgg16/2019-10-14-16-34 \
                   > eval_pascal_voc_vgg16_v0.2.log 2>&1 &"
    echo ${runCmd}
    eval ${runCmd}
}

for epoch in `seq 1 9`
do
    echo $epoch
    eval_model $epoch
done