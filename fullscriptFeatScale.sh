#!/bin/bash
./svm-scale -s range4 -l 0 final/fourclass.train > final/fourclass.fscale.train
./svm-scale -r range4 final/fourclass.test > final/fourclass.fscale.test
./svm-scale -s range4 -l 0 final/cod-rna.train > final/cod-rna.fscale.train
./svm-scale -r range4 final/cod-rna.test > final/cod-rna.fscale.test
./svm-scale -s range4 -l 0 final/poker.train > final/poker.fscale.train
./svm-scale -r range4 final/realsim.test > final/realsim.fscale.test
./svm-scale -s range4 -l 0 final/ijcnn1.train > final/ijcnn1.fscale.train
./svm-scale -r range4 final/ijcnn1.test > final/ijcnn1.fscale.test
./svm-scale -s range4 -l 0 final/covtype.train > final/covtype.fscale.train
./svm-scale -r range4 final/covtype.test > final/covtype.fscale.test
./svm-scale -s range4 -l 0 final/sensit.train > final/sensit.fscale.train
./svm-scale -r range4 final/sensit.test > final/sensit.fscale.test
./svm-scale -s range4 -l 0 final/a9a.train > final/a9a.fscale.train
./svm-scale -r range4 final/a9a.test > final/a9a.fscale.test
./svm-scale -s range4 -l 0 final/w7a.train > final/w7a.fscale.train
./svm-scale -r range4 final/w7a.test > final/w7a.fscale.test
./svm-scale -s range4 -l 0 final/mnist1.train > final/mnist1.fscale.train
./svm-scale -r range4 final/mnist1.test > final/mnist1.fscale.test
./svm-scale -s range4 -l 0 final/mnist5.train > final/mnist5.fscale.train
./svm-scale -r range4 final/mnist5.test > final/mnist5.fscale.test
./svm-scale -s range4 -l 0 final/epsilon.train > final/epsilon.fscale.train
./svm-scale -r range4 final/epsilon.test > final/epsilon.fscale.test
./svm-scale -s range4 -l 0 final/smallNORB.train > final/smallNORB.fscale.train
./svm-scale -r range4 final/smallNORB.test > final/smallNORB.fscale.test
./svm-scale -s range4 -l 0 final/gisette.train > final/gisette.fscale.train
./svm-scale -r range4 final/gisette.test > final/gisette.fscale.test
./svm-scale -s range4 -l 0 final/real-sim.train > final/real-sim.fscale.train
./svm-scale -r range4 final/real-sim.test > final/real-sim.fscale.test
./svm-scale -s range4 -l 0 final/rcv.train > final/rcv.fscale.train
./svm-scale -r range4 final/rcv.test > final/rcv.fscale.test
./svm-scale -s range4 -l 0 final/avazu.train > final/avazu.fscale.train
./svm-scale -r range4 final/avazu.test > final/avazu.fscale.test
./svm-scale -s range4 -l 0 final/astro.train > final/astro.fscale.train
./svm-scale -r range4 final/astro.test > final/astro.fscale.test
./svm-scale -s range4 -l 0 final/criteo.train > final/criteo.fscale.train
./svm-scale -r range4 final/criteo.test > final/criteo.fscale.test
./svm-scale -s range4 -l 0 final/news20.train > final/news20.fscale.train
./svm-scale -r range4 final/news20.test > final/news20.fscale.test
./svm-scale -s range4 -l 0 final/url.train > final/url.fscale.train
./svm-scale -r range4 final/url.test > final/url.fscale.test
./svm-scale -s range4 -l 0 final/webspam.train > final/webspam.fscale.train
./svm-scale -r range4 final/webspam.test > final/webspam.fscale.test

./run_main.sh 0.15 fourclass.fscale 2 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 cod-rna.fscale 8 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 poker.fscale 10 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 ijcnn1.fscale 20 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 covtype.fscale 54 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 sensit.fscale 100 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 a9a.fscale 123 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 w7a.fscale 300 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 mnist1.fscale 780 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 mnist5.fscale 780 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 epsilon.fscale 2000 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 smallnorb.fscale 2048 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 gisette.fscale 5000 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 real-sim.fscale 20958 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 rcv1.fscale 47236 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 astro.fscale 99757 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 avazu.fscale 1000000 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 criteo.fscale 1000000 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 news20.fscale 1355792 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 url.fscale 3231961 | tee log1
python3 log2CSV.py
./run_main.sh 0.15 webspam.fscale 16609143 | tee log1
python3 log2CSV.py
