# Data Manipulation for LibSVM datasets for my Master Thesis

Follow these steps to obtain the results for a given dataset:
 - use the latest libsvm files changing the svm-predict.c with the one in the folder and generate the new svm-predict function using the makefile. You can also use the svm-predict in the folder if you are using a linux based system.
 - Put into the folder data the downloaded files from the libsvm library, having the test file the same name as the train but with a .c extension.
 - Use python to run the maindata.py with the arguments --data_name as the name of the dataset, --create_test (default 0)as 1 if there is no test file and --main_tag with the tag that you want to consider as the main one from the original dataset.
 For example: ```py maindata.py --data_name url --main_tag 1```
 - Run the command ```run_main {datasetName} {gamma}```. The gamma will be used to run the script also on gamma/10 and gamma x 10. 
 For example: ```run_main fouclass 0.5```
 
 *Example of the whole process of downloading a dataset and running the program*
 
 From inside this folder:
- Go to data folder, download the wanted data file and uncompress it.  Then go back to parent folder:
 ```cd data
 wget -O poker https://www.csie.ntu.edu.tw/~cjlin/libsvmtools/datasets/multiclass/poker.bz2
 bzip2 -d poker.bz2
 cd ..```

- Scale the dataset if needed:
 ```./svm-scale  data/poker >  data/poker_scale```

- Get information of the dataset to know what tag to use:
 ```python3 getDataInfo.py --data_file poker_scale```

- Run the main python program with the desired main_tag you want. The --create_test 1 is only need if the file does not already have a test file. If there is a test file it should be in the data folder with format ```{dataset name}.t```.
 ```python3 maindata.py --data_name poker_scale --main_tag -1 --create_test 1``` 
 
 - Run the Libsvm command with the desired n value and the number of features in the dataset:
 ```./run_main.sh 0.15 poker_scale 54 | tee log1 ```
