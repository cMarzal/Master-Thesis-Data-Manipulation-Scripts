from __future__ import absolute_import
import random
import argparse
from divide import divide
from tt import data_divide
from change_tag import changeTag

def arg_parse():
    parser = argparse.ArgumentParser(description='Chage tag in file so main is +1 and the rest -1')

    # Datasets parameters
    parser.add_argument('--data_name', type=str, default='poker',
                    help="root path to data file")
    parser.add_argument('--create_test', type=bool, default=0,
                    help="Wether to create test set or it already exists.")

    # extra parameters

    parser.add_argument('--main_tag', default='1', type=str,
                    help="Main tag that will be changed to +1")
    parser.add_argument('--random_seed', default=1, type=int, help="seed to be used in random function")
    args = parser.parse_args()

    return args


if __name__ == '__main__':
    args = arg_parse()
    trainFile = "data/" + args.data_name
    testFile = "data/" + args.data_name + ".t"
    
    trainFinalFile = "final/" + args.data_name + ".train"
    testFinalFile = "final/" + args.data_name + ".test"

    seed = args.random_seed

    if args.create_test:
        trainD, testD = data_divide(trainFile, random_seed=seed)
        #rewrite train file
        file = open(trainFinalFile, "w")
        for i in range(len(trainD)):
            file.write(str(trainD[i]))
        file.close()
        #write test file
        file2 = open(testFinalFile, "w")
        for e in range(len(testD)):
            file2.write(str(testD[e]))
        file2.close()
        # Change main tag to +1 and -1 to the rest
        print("change Tag train")
        ext1, trainTagged = changeTag(trainFinalFile, main_tag = args.main_tag, random_seed=seed)
        print("change Tag test")
        ext2, testTagged = changeTag(testFinalFile, main_tag = args.main_tag, random_seed=seed)
    else:
        # Change main tag to +1 and -1 to the rest
        print("change Tag train")
        ext1, trainTagged = changeTag(trainFile, main_tag = args.main_tag, random_seed=seed)
        print("change Tag test")
        ext2, testTagged = changeTag(testFile, main_tag = args.main_tag, random_seed=seed)

    if ext1 != 0 and ext2 != 0:
        #rewrite train file
        file = open(trainFinalFile, "w")
        for i in range(len(trainTagged)):
            file.write(str(trainTagged[i]))
        file.close()
        #write test file
        file2 = open(testFinalFile, "w")
        for e in range(len(testTagged)):
            file2.write(str(testTagged[e]))
        file2.close()

    print("divide train")
    trainData = divide(trainFinalFile, total_size=20000,  pctg_sec=10, random_seed=seed)
    print("divide test")
    testData = divide(testFinalFile, total_size=50000, pctg_sec=50, random_seed=seed)

    # Save final files
    file = open(trainFinalFile, "w")
    for i in range(len(trainData)):
        file.write(str(trainData[i]))
    file.close()
    #write test file
    file2 = open(testFinalFile, "w")
    for e in range(len(testData)):
        file2.write(str(testData[e]))
    file2.close()
