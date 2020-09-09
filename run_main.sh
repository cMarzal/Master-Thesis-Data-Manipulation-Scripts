#!/bin/bash
cd "$(dirname "$0")"
train_dir="${1}.train"
test_dir="${1}.test"
model_dir="${1}.train.model"
out_dir="${1}.out"
x=$2
c=$(echo "scale=8;$2/10" | bc)
d=$(echo "scale=8;$2*10" | bc)
echo "$c"
echo "$d"
svm-train -s 2 -t 0 -n 0.1 $train_dir
echo "LINEAR"
./svm-predict $test_dir $model_dir $out_dir
svm-train -s 2 -t 2 -n 0.1 -g $x $train_dir
echo "RB WITH NORMAL G"
./svm-predict $test_dir $model_dir $out_dir
svm-train -s 2 -t 2 -n 0.1 -g $c $train_dir
echo "RB WITH G/10"
./svm-predict $test_dir $model_dir $out_dir
svm-train -s 2 -t 2 -n 0.1 -g $d $train_dir
echo "RB WITH G*10"
./svm-predict $test_dir $model_dir $out_dir