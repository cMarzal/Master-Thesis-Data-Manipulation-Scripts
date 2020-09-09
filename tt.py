from __future__ import absolute_import
import random
import argparse


def arg_parse():
    parser = argparse.ArgumentParser(description='Data division so make 2 class into 1 class')

    # Datasets parameters
    parser.add_argument('--data_file', type=str, default='real-sim',
                    help="root path to data file")
    parser.add_argument('--train_ext', type=str, default='',
                    help="extention to add to the train file")
    parser.add_argument('--test_ext', type=str, default='.t',
                    help="extention to add to the test file")

    # extra parameters

    parser.add_argument('--size_train', default=2000000, type=int,
                    help="Total size of the new train dataset")
    parser.add_argument('--pctg_test', default=35, type=int,
                        help="Percentage of data we want to have in the test compared to the train")
    args = parser.parse_args()

    return args


if __name__ == '__main__':
    args = arg_parse()

    f = open(args.data_file, "r")
    f1 = f.readlines()

    random.shuffle(f1)
    pctg = args.pctg_test / 100

    if (args.pctg_test > 100 or args.pctg_test < 0):
        print('Percentage is above 100 or below 0, changed to 50')
        pctg = 0.5

    length_tot = args.size_train/(1-pctg)
    if len(f1) < length_tot:
        print('Total size exceeds the one of the dataset, changed ')
        length_tot = len(f1)
    
    length_train = int(length_tot * (1-pctg))
    length_test = int(length_tot * pctg)

    train_ds = f1[:length_train]
    test_ds = f1[length_train:length_train+length_test]
    
    print('Saving data in train file')
    file = open(args.data_file+args.train_ext, "w")
    for i in range(len(train_ds)):
        file.write(str(train_ds[i]))
    file.close()

    if pctg != 0:
        print('Saving data in test file')
        file = open(args.data_file+args.test_ext, "w")
        for i in range(len(test_ds)):
            file.write(str(test_ds[i]))
        file.close()

    print('Done')
