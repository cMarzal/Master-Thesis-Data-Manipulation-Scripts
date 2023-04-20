from __future__ import absolute_import
import random
import argparse
from collections import Counter

def arg_parse():
    parser = argparse.ArgumentParser(description='Obtain data information from dataset')

    # Datasets parameters
    parser.add_argument('--data_file', type=str, default='cod-rna.t',
                    help="root path to data file")


    # extra parameters
    args = parser.parse_args()

    return args

# Counts the total occurences for each of the tags in a dataset and shows it on console
def getInfo(data_file):
    new = []
    f = open("data/" + data_file, "r")
    f1 = f.readlines()

    for x in f1:
        new.append(x.split(' ')[0])

    counted = Counter(new)

                
    print(counted)


if __name__ == '__main__':
    args = arg_parse()
    getInfo(args.data_file)
