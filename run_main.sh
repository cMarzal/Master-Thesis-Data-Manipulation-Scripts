#!/bin/bash
train_dir="final/${2}.train"
test_dir="final/${2}.test"
model_dir="models/${2}.train.model"
out_dir="models/${2}.out"
features=$3
g1=$(echo "scale=8;1/$3" | bc)
g2=$(echo "scale=8;$g1/100" | bc)
g3=$(echo "scale=8;$g1/10" | bc)
g4=$(echo "scale=8;$g1*10" | bc)
g5=$(echo "scale=8;$g1*100" | bc)
echo "Dataset: $2"
echo "Features: $3"
echo "g1: $g1"
echo "g2: $g2"
echo "g3: $g3"
echo "g4: $g4"
echo "g5: $g5"
./svm-train -s 2 -t 0 -e 0.00001 -n $1 $train_dir $model_dir
echo "LINEAR"
./svm-predict $test_dir $model_dir $out_dir
./svm-train -s 2 -t 2 -e 0.00001 -n $1 -g $g1 $train_dir $model_dir
echo "RB WITH NORMAL G"
./svm-predict $test_dir $model_dir $out_dir
./svm-train -s 2 -t 2 -e 0.00001 -n $1 -g $g2 $train_dir $model_dir
echo "RB WITH G/100"
./svm-predict $test_dir $model_dir $out_dir
./svm-train -s 2 -t 2 -e 0.00001 -n $1 -g $g3 $train_dir $model_dir
echo "RB WITH G/10"
./svm-predict $test_dir $model_dir $out_dir
./svm-train -s 2 -t 2 -e 0.00001 -n $1 -g $g4 $train_dir $model_dir
echo "RB WITH G*10"
./svm-predict $test_dir $model_dir $out_dir
./svm-train -s 2 -t 2 -e 0.00001 -n $1 -g $g5 $train_dir $model_dir
echo "RB WITH G*100"
./svm-predict $test_dir $model_dir $out_dir
