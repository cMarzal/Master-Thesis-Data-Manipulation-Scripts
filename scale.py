from __future__ import absolute_import
import argparse
import numpy as np


def arg_parse():
    parser = argparse.ArgumentParser(description='Divide one file into two, test and train')

    # Datasets parameters
    parser.add_argument('--data_file', type=str, default='a9a.test',
                    help="root path to data file")
    parser.add_argument('--ext', type=str, default='.scale',
                    help="extention to add to file")

    # extra parameters

    parser.add_argument('--range_min', default=-1, type=int,
                    help="min of range")
    parser.add_argument('--range_max', default=1, type=int,
                        help="max of range")
    parser.add_argument('--random_seed', default=1, type=int,
                        help="Random seed")
    args = parser.parse_args()

    return args

def data_scale(data_file, min_scale=-1, max_scale=1):
    f = open(data_file, "r")
    f1 = f.readlines()

    newData = []

    for x in f1:
        nums = []
        values = []
        new_str = ""
        index = x.split(' ')[0]
        for i, val in enumerate(x.split(' ')):
            if i != 0:
                if ":" in val:
                    nums.append(val.split(':')[0])
                    values.append(float(val.split(':')[1]))
        if len(values) != 0:
            a = np.array(values)
            a2 = a / np.linalg.norm(a)
            values = a2.tolist()
            new_str += index + " "
            for i in range(len(nums)):
                new_str += nums[i] + ":" + str(values[i]) + " "
        else:
            new_str += index
        newData.append(new_str + "\n")

    return newData

if __name__ == '__main__':
    args = arg_parse()

    print("Obtaining new scaled data")

    dfile = args.data_file
    route = "final/" + dfile
    newName = dfile.split(".")[0] + args.ext + "." + dfile.split(".")[1]
    newRoute = "final/" + newName

    newData = data_scale(route, min_scale=args.range_min, max_scale=args.range_max)

    print('Saving data in file')
    file = open(newRoute, "w")
    for i in range(len(newData)):
        file.write(str(newData[i]))
    file.close()

    print('Done')
