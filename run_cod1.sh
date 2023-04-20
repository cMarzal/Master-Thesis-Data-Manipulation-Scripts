#!/bin/bash
train_dir="final/${1}.train"
test_dir="final/${1}.test"
model_dir="models/${1}.train.model"
out_dir="models/${1}.out"
g1=0.00000095367431640625
g2=0.0000019073486328125
g3=0.000003814697265625
g4=0.00000762939453125
g5=0.0000152587890625
g6=0.000030517578125
g7=0.00006103515625
g8=0.0001220703125
g9=0.000244140625
g10=0.00048828125
g11=0.0009765625
g12=0.001953125
g13=0.00390625
g14=0.0078125
g15=0.015625
g16=0.03125
g17=0.0625
g18=0.125
g19=0.25
g20=0.5
g21=1
g22=2
g23=4
g24=8
g25=16
g26=32
g27=64
echo "N= ${2}"
./svm-train -s 2 -t 2 -e 0.00001 -n $2 -g $g1 $train_dir $model_dir
echo "RB WITH G =9.5367431640625e-07"
./svm-predict $test_dir $model_dir $out_dir
./svm-train -s 2 -t 2 -e 0.00001 -n $2 -g $g2 $train_dir $model_dir
echo "RB WITH G =1.9073486328125e-06"
./svm-predict $test_dir $model_dir $out_dir
./svm-train -s 2 -t 2 -e 0.00001 -n $2 -g $g3 $train_dir $model_dir
echo "RB WITH G =3.814697265625e-06"
./svm-predict $test_dir $model_dir $out_dir
./svm-train -s 2 -t 2 -e 0.00001 -n $2 -g $g4 $train_dir $model_dir
echo "RB WITH G =7.62939453125e-06"
./svm-predict $test_dir $model_dir $out_dir
./svm-train -s 2 -t 2 -e 0.00001 -n $2 -g $g5 $train_dir $model_dir
echo "RB WITH G =1.52587890625e-05"
./svm-predict $test_dir $model_dir $out_dir
./svm-train -s 2 -t 2 -e 0.00001 -n $2 -g $g6 $train_dir $model_dir
echo "RB WITH G =3.0517578125e-05"
./svm-predict $test_dir $model_dir $out_dir
./svm-train -s 2 -t 2 -e 0.00001 -n $2 -g $g7 $train_dir $model_dir
echo "RB WITH G =6.103515625e-05"
./svm-predict $test_dir $model_dir $out_dir
./svm-train -s 2 -t 2 -e 0.00001 -n $2 -g $g8 $train_dir $model_dir
echo "RB WITH G =0.0001220703125"
./svm-predict $test_dir $model_dir $out_dir
./svm-train -s 2 -t 2 -e 0.00001 -n $2 -g $g9 $train_dir $model_dir
echo "RB WITH G =0.000244140625"
./svm-predict $test_dir $model_dir $out_dir
./svm-train -s 2 -t 2 -e 0.00001 -n $2 -g $g10 $train_dir $model_dir
echo "RB WITH G =0.00048828125"
./svm-predict $test_dir $model_dir $out_dir
./svm-train -s 2 -t 2 -e 0.00001 -n $2 -g $g11 $train_dir $model_dir
echo "RB WITH G =0.0009765625"
./svm-predict $test_dir $model_dir $out_dir
./svm-train -s 2 -t 2 -e 0.00001 -n $2 -g $g12 $train_dir $model_dir
echo "RB WITH G =0.001953125"
./svm-predict $test_dir $model_dir $out_dir
./svm-train -s 2 -t 2 -e 0.00001 -n $2 -g $g13 $train_dir $model_dir
echo "RB WITH G =0.00390625"
./svm-predict $test_dir $model_dir $out_dir
./svm-train -s 2 -t 2 -e 0.00001 -n $2 -g $g14 $train_dir $model_dir
echo "RB WITH G =0.0078125"
./svm-predict $test_dir $model_dir $out_dir
./svm-train -s 2 -t 2 -e 0.00001 -n $2 -g $g15 $train_dir $model_dir
echo "RB WITH G =0.015625"
./svm-predict $test_dir $model_dir $out_dir
./svm-train -s 2 -t 2 -e 0.00001 -n $2 -g $g16 $train_dir $model_dir
echo "RB WITH G =0.03125"
./svm-predict $test_dir $model_dir $out_dir
./svm-train -s 2 -t 2 -e 0.00001 -n $2 -g $g17 $train_dir $model_dir
echo "RB WITH G =0.0625"
./svm-predict $test_dir $model_dir $out_dir
./svm-train -s 2 -t 2 -e 0.00001 -n $2 -g $g18 $train_dir $model_dir
echo "RB WITH G =0.125"
./svm-predict $test_dir $model_dir $out_dir
./svm-train -s 2 -t 2 -e 0.00001 -n $2 -g $g19 $train_dir $model_dir
echo "RB WITH G =0.25"
./svm-predict $test_dir $model_dir $out_dir
./svm-train -s 2 -t 2 -e 0.00001 -n $2 -g $g20 $train_dir $model_dir
echo "RB WITH G =0.5"
./svm-predict $test_dir $model_dir $out_dir
./svm-train -s 2 -t 2 -e 0.00001 -n $2 -g $g21 $train_dir $model_dir
echo "RB WITH G =1"
./svm-predict $test_dir $model_dir $out_dir
./svm-train -s 2 -t 2 -e 0.00001 -n $2 -g $g22 $train_dir $model_dir
echo "RB WITH G =2"
./svm-predict $test_dir $model_dir $out_dir
./svm-train -s 2 -t 2 -e 0.00001 -n $2 -g $g23 $train_dir $model_dir
echo "RB WITH G =4"
./svm-predict $test_dir $model_dir $out_dir
./svm-train -s 2 -t 2 -e 0.00001 -n $2 -g $g24 $train_dir $model_dir
echo "RB WITH G =8"
./svm-predict $test_dir $model_dir $out_dir
./svm-train -s 2 -t 2 -e 0.00001 -n $2 -g $g25 $train_dir $model_dir
echo "RB WITH G =16"
./svm-predict $test_dir $model_dir $out_dir
./svm-train -s 2 -t 2 -e 0.00001 -n $2 -g $g26 $train_dir $model_dir
echo "RB WITH G =32"
./svm-predict $test_dir $model_dir $out_dir
./svm-train -s 2 -t 2 -e 0.00001 -n $2 -g $g27 $train_dir $model_dir
echo "RB WITH G =64"
./svm-predict $test_dir $model_dir $out_dir
