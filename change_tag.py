from __future__ import absolute_import
import random
import argparse

def arg_parse():
    parser = argparse.ArgumentParser(description='Data division so make 2 class into 1 class')

    # Datasets parameters
    parser.add_argument('--data_file', type=str, default='smallNORB',
                    help="root path to data file")
    parser.add_argument('--save_file', type=str, default='smallNORB1',
                    help="root path to new saved file")


    # extra parameters

    parser.add_argument('--main_tag', default='1', type=str,
                    help="Main tag that will be changed to +1")
    parser.add_argument('--change_sec', default=1, type=bool,
                        help="Boolean that decides if all the secondary tags will be chnaged to -1")
    args = parser.parse_args()

    return args


if __name__ == '__main__':
    args = arg_parse()
    new = []
    ext = 0
    f = open(args.data_file, "r")
    f1 = f.readlines()

    for x in f1:
        if x.split(' ')[0] == args.main_tag:
            x = x.split()
            x[0] = '+1'
            new.append(' '.join(x) + '\n')
            ext = 1
        else:
            if args.change_sec == 1:
                x = x.split()
                x[0] = '-1'
                new.append(' '.join(x) + '\n')
            else:
                new.append(x)
                
    if ext == 0:
        print('Main tag not found in the dataset, nothing was done')
    else:
        random.shuffle(new)

        print('Saving data in file')
        file = open(args.save_file, "w")
        for i in range(len(new)):
            file.write(str(new[i]))

        file.close()

