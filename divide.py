import random
import argparse

def arg_parse():
    parser = argparse.ArgumentParser(description='Data division so make 2 class into 1 class')

    # Datasets parameters
    parser.add_argument('--data_file', type=str, default='url.train',
                    help="root path to data file")
    parser.add_argument('--save_file', type=str, default='url.train',
                        help="root path to new created dataset file")

    # extra parameters
    parser.add_argument('--tag_main', default='+1', type=str,
                    help='Class that we want to keep as our main one')
    parser.add_argument('--total_size', default=10000, type=int,
                    help="Total size of the new dataset")
    parser.add_argument('--pctg_sec', default=10, type=int,
                        help="Percentage of data we want to have as the secondary one")

    args = parser.parse_args()

    return args

def divide(data_file, tag_main="+1", total_size=100000, pctg_sec=10, random_seed=1):
    mai = []
    sec = []
    f = open(data_file, "r")
    f1 = f.readlines()
    random.seed(random_seed)

    for x in f1:
        if x.split(' ')[0] == tag_main:
            mai.append(x)
        else:
            sec.append(x)
    length_main = int(total_size * (1-(pctg_sec/100)))
    length_sec = int(total_size - length_main)
    length_tot = total_size
    if len(mai) < length_main:
        random.shuffle(mai)
        length_main = len(mai)
        length_tot = int(length_main / (1-(pctg_sec / 100)))
        length_sec = length_tot - length_main
        print('Not enough data amount in main tag, changed total length to: ' + str(length_tot))
    else:
        mai = random.sample(mai, length_main)

    if len(sec) < length_sec:
        length_main = min(length_main, int(len(sec) * (1 - (pctg_sec / 100)) / (pctg_sec / 100)))
        length_sec = int(length_main * (pctg_sec / 100) / (1 - (pctg_sec / 100)))
        length_tot = length_main + length_sec
        mai = random.sample(mai, length_main)
        random.shuffle(sec)
        print('Not enough data from the non main tag, changed total length to: ' + str(length_tot))
    else:
        sec = random.sample(sec, length_sec)

    joined = mai + sec
    random.shuffle(joined)
    return joined

if __name__ == '__main__':
    args = arg_parse()

    joined = divide(args.data_file, args.tag_main, args.total_size, args.pctg_sec)

    print('Saving data in file')
    file = open(args.save_file, "w")
    for i in range(len(joined)):
        if i == len(joined) - 1:
            file.write(str(joined[i]))
        else:
            file.write(str(joined[i]))
    file.close()

