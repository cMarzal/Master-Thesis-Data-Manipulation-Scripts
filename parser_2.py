from __future__ import absolute_import
import argparse

def arg_parse():
    parser = argparse.ArgumentParser(description='Data division so make 2 class into 1 class')

    # Datasets parameters
    parser.add_argument('--data_file', type=str, default='poker0',
                    help="root path to data file")
    parser.add_argument('--save_file', type=str, default='poker0.train',
                        help="root path to new created dataset file")

    # extra parameters
    parser.add_argument('--tag_main', default='+1', type=str,
                    help='Class that we want to keep as our main one')
    parser.add_argument('--tag_sec', default='0', type=str,
                        help='Class tag of the secondary class')
    parser.add_argument('--total_size', default=2000000, type=int,
                    help="Total size of the new dataset")
    parser.add_argument('--pctg_sec', default=10, type=int,
                        help="Percentage of data we want to have as the secondary one")

    args = parser.parse_args()

    return args
