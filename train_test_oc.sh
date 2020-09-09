# create subsets of data from dataset and run train and test for libsvm on them
train_dir=$1
test_dir="${1}.t"
save_train_dir="${1}.train"
model_train_dir="${1}.train.model"
out_train_dir="${1}.out"
save_test_dir="${1}.test"
python divide.py --data_file $1 --save_file $save_train_dir --total_size $2 --pctg_sec $3
python divide.py --data_file $test_dir --save_file $save_test_dir --total_size $4 --pctg_sec $5
svm-train $save_train_dir
svm-predict $save_test_dir $model_train_dir $out_train_dir
