#!/bin/bash
python3 scale.py --data_file fourclass.train
python3 scale.py --data_file cod-rna.train
python3 scale.py --data_file poker.train
python3 scale.py --data_file ijcnn1.train
python3 scale.py --data_file covtype.train
python3 scale.py --data_file sensit.train
python3 scale.py --data_file a9a.train
python3 scale.py --data_file w7a.train
python3 scale.py --data_file mnist1.train
python3 scale.py --data_file mnist5.train
python3 scale.py --data_file epsilon.train
python3 scale.py --data_file smallNORB.train
python3 scale.py --data_file gisette.train
python3 scale.py --data_file real-sim.train
python3 scale.py --data_file rcv1.train
python3 scale.py --data_file astro.train
python3 scale.py --data_file news20.train
python3 scale.py --data_file url.train
python3 scale.py --data_file criteo.train
python3 scale.py --data_file webspam.train

python3 scale.py --data_file fourclass.test
python3 scale.py --data_file cod-rna.test
python3 scale.py --data_file poker.test
python3 scale.py --data_file ijcnn1.test
python3 scale.py --data_file covtype.test
python3 scale.py --data_file sensit.test
python3 scale.py --data_file a9a.test
python3 scale.py --data_file w7a.test
python3 scale.py --data_file mnist1.test
python3 scale.py --data_file mnist5.test
python3 scale.py --data_file epsilon.test
python3 scale.py --data_file smallnorb.test
python3 scale.py --data_file gisette.test
python3 scale.py --data_file real-sim.test
python3 scale.py --data_file rcv1.test
python3 scale.py --data_file astro.test
python3 scale.py --data_file news20.test
python3 scale.py --data_file url.test
python3 scale.py --data_file criteo.test
python3 scale.py --data_file webspam.test

./run_main.sh 0.15 fourclass.scale 2 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 cod-rna.scale 8 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 poker.scale 10 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 ijcnn1.scale 20 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 covtype.scale 54 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 sensit.scale 100 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 a9a.scale 123 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 w7a.scale 300 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 mnist1.scale 780 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 mnist5.scale 780 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 epsilon.scale 2000 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 smallnorb.scale 2048 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 gisette.scale 5000 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 real-sim.scale 20958 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 rcv1.scale 47236 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 astro.scale 99757 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 avazu.scale 1000000 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 news20.scale 1355792 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 url.scale 3231961 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 criteo.scale 1000000 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 webspam.scale 16609143 | tee log1
python3 log2CSV.py
