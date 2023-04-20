#!/bin/bash
#Before running the script make sure all the datasets are in the folder /data with the names you see below
#If there is a test file it should have a .t extention, while train files have no extention
python3 maindata.py --data_name fourclass --main_tag -1 --random_seed 1 --create_test 1
python3 maindata.py --data_name cod-rna --main_tag -1 --random_seed 1
python3 maindata.py --data_name poker --main_tag 0 --random_seed 1
python3 maindata.py --data_name ijcnn1 --main_tag 1 --random_seed 1
python3 maindata.py --data_name covtype --main_tag 2 --random_seed 1 --create_test 1
python3 maindata.py --data_name sensit --main_tag 3 --random_seed 1
python3 maindata.py --data_name a9a --main_tag -1 --random_seed 1
python3 maindata.py --data_name w7a --main_tag +1 --random_seed 1
python3 maindata.py --data_name mnist1 --main_tag 1 --random_seed 1
python3 maindata.py --data_name mnist5 --main_tag 5 --random_seed 1
python3 maindata.py --data_name epsilon --main_tag -1 --random_seed 1
python3 maindata.py --data_name smallNORB --main_tag 0 --random_seed 1
python3 maindata.py --data_name gisette --main_tag 1 --random_seed 1
python3 maindata.py --data_name real-sim --main_tag -1 --random_seed 1 --create_test 1
python3 maindata.py --data_name rcv1 --main_tag 1 --random_seed 1
python3 maindata.py --data_name avazu --main_tag 1 --random_seed 1 --create_test 1
python3 maindata2.py --data_name criteo --main_tag 0 --random_seed 1 --create_test 1
python3 maindata.py --data_name astro --main_tag +1 --random_seed 1 --create_test 1
python3 maindata.py --data_name news20 --main_tag -1 --random_seed 1 --create_test 1
python3 maindata.py --data_name url --main_tag -1 --random_seed 1 --create_test 1
python3 maindata.py --data_name webspam --main_tag +1 --random_seed 1 --create_test 1
