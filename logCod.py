from __future__ import absolute_import
import random
import argparse
from csv import writer

def arg_parse():
    parser = argparse.ArgumentParser(description='adds values to csv from generated logs')

    # Datasets parameters
    parser.add_argument('--logFile', type=str, default='logCod',
                    help="root path to data file")
    parser.add_argument('--csvFile', type=str, default='dataAccuracyCod.csv',
                    help="root path to data file")

    # extra parameters
    args = parser.parse_args()

    return args

# Gets the data from a log file and adds the corresponding accuracies to the csv file
def getInfo(dataFile, csvFile):
    f = open(dataFile, "r")
    f1 = f.readlines()
    n = ""
    gthis = ""
    gbest = ""
    bestAcc = 0
    bestAccPos = 0
    bestAccNeg = 0
    newBest = 0
 
    for i, x in enumerate(f1):
        if i == 0:
            n = x.split("N= ")[1].split("\n")[0]
        else:
            if x.startswith('RB WITH G ='):
                gthis = x.split('RB WITH G =')[1].split("\n")[0]
            elif x.startswith('Accuracy = '):
                acc = float(x.split(" ")[2].split("%")[0])
                if acc > bestAcc:
                    bestAcc = acc
                    newBest = 1
                    gbest = gthis
            elif newBest == 1:            
                if x.startswith('Accuracy main ='):
                    bestAccPos = x.split(" ")[3].split("%")[0]
                elif x.startswith('Accuracy outlier ='):
                    bestAccNeg = x.split(" ")[3].split("%")[0]
                    newBest = 0
    # Create rows that will be added to csv
    r1 = [n, gbest, bestAcc, bestAccPos, bestAccNeg]
      
    # Open our existing CSV file in append mode
    # Create a file object for this file
    with open(csvFile, 'a') as f_object:
      
        # Pass this file object to csv.writer()
        # and get a writer object
        writer_object = writer(f_object)
      
        # Pass the list as an argument into
        # the writerow()
        writer_object.writerow(r1)
        #Close the file object
        f_object.close()


if __name__ == '__main__':
    args = arg_parse()
    getInfo(args.logFile, args.csvFile)
