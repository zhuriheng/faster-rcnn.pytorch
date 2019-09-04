#!/usr/bin/env bash
set -eux
set -o pipefail

eval_model(){
    model_path=$1

    runCmd="python test_net.py --dataset pascal_voc --net res101 --cuda \
                   --checksession 2 --checkepoch ${1} --checkpoint 625 \
                   --input_dir output/res101/pascal_voc/2019-04-19-16-48"
    echo ${runCmd}
    eval ${runCmd}
}

for epoch in `seq 1 10`
do
    echo $epoch
    eval_model $epoch
done