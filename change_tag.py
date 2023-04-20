from __future__ import absolute_import
import random
import argparse

def arg_parse():
    parser = argparse.ArgumentParser(description='Chage tag in file so main is +1 and the rest -1')

    # Datasets parameters
    parser.add_argument('--data_file', type=str, default='cod-rna.t',
                    help="root path to data file")
    parser.add_argument('--save_file', type=str, default='cod-rna.t',
                    help="root path to new saved file")


    # extra parameters

    parser.add_argument('--main_tag', default='1', type=str,
                    help="Main tag that will be changed to +1")
    parser.add_argument('--change_sec', default=1, type=bool,
                        help="Boolean that decides if all the secondary tags will be chnaged to -1")
    args = parser.parse_args()

    return args

def changeTag(data_file, main_tag='1', change_sec=1, random_seed=1):
    new = []
    ext = 0
    f = open(data_file, "r")
    f1 = f.readlines()
    random.seed(random_seed)

    for x in f1:
        if x.split(' ')[0] == main_tag:
            x = x.split()
            x[0] = '+1'
            new.append(' '.join(x) + ' \n')
            ext = 1
        else:
            if change_sec == 1:
                x = x.split()
                x[0] = '-1'
                new.append(' '.join(x) + ' \n')
            else:
                new.append(x)
                
    if ext == 0:
        print('Main tag not found in the dataset, nothing was done')
    else:
        random.shuffle(new)

    return ext, new



if __name__ == '__main__':
    args = arg_parse()
    ext, new = changeTag(args.data_file, args.main_tag, args.change_sec)
                
    if ext != 0:
        random.shuffle(new)

        print('Saving data in file')
        file = open(args.save_file, "w")
        for i in range(len(new)):
            file.write(str(new[i]))

        file.close()

