from __future__ import absolute_import
import random
import argparse
from csv import writer

def arg_parse():
    parser = argparse.ArgumentParser(description='adds values to csv from generated logs')

    # Datasets parameters
    parser.add_argument('--logFile', type=str, default='log1',
                    help="root path to data file")
    parser.add_argument('--csvFile', type=str, default='dataAccuracy.csv',
                    help="root path to data file")

    # extra parameters
    args = parser.parse_args()

    return args

# Gets the data from a log file and adds the corresponding accuracies to the csv file
def getInfo(dataFile, csvFile):
    f = open(dataFile, "r")
    f1 = f.readlines()
    dataset = ""
    features = ""
    g1 = ""
    g2 = ""
    g3 = ""
    g4 = ""
    g5 = ""
    accAvg = []
    accMain = []
    accSec = []
 
    for i, x in enumerate(f1):
        if i == 0:
            dataset = x.split("Dataset: ")[1].split("\n")[0]
        elif i == 1:
            features = x.split("Features: ")[1].split("\n")[0]
        elif i == 2:
            g1 = x.split("g1: ")[1].split("\n")[0]
        elif i == 3:
            g2 = x.split("g2: ")[1].split("\n")[0]
        elif i == 4:
            g3 = x.split("g3: ")[1].split("\n")[0]
        elif i == 5:
            g4 = x.split("g4: ")[1].split("\n")[0]
        elif i == 6:
            g5 = x.split("g5: ")[1].split("\n")[0]
        else:
            if x.startswith('Accuracy ='):
                accAvg.append(x.split(" ")[2].split("%")[0])
            elif x.startswith('Accuracy main ='):
                accMain.append(x.split(" ")[3].split("%")[0])
            elif x.startswith('Accuracy outlier ='):
                accSec.append(x.split(" ")[3].split("%")[0])
    # Create rows that will be added to csv
    r1 = [dataset, features, "-", accMain[0], accSec[0], accAvg[0]]
    r2 = [dataset, features, g1, accMain[1], accSec[1], accAvg[1]]
    r3 = [dataset, features, g2, accMain[2], accSec[2], accAvg[2]]
    r4 = [dataset, features, g3, accMain[3], accSec[3], accAvg[3]]
    r5 = [dataset, features, g4, accMain[4], accSec[4], accAvg[4]]
    r6 = [dataset, features, g5, accMain[5], accSec[5], accAvg[5]]
      
    # Open our existing CSV file in append mode
    # Create a file object for this file
    with open(csvFile, 'a') as f_object:
      
        # Pass this file object to csv.writer()
        # and get a writer object
        writer_object = writer(f_object)
      
        # Pass the list as an argument into
        # the writerow()
        writer_object.writerow(r1)
        writer_object.writerow(r2)
        writer_object.writerow(r3)
        writer_object.writerow(r4)
        writer_object.writerow(r5)
        writer_object.writerow(r6)
        #Close the file object
        f_object.close()


if __name__ == '__main__':
    args = arg_parse()
    getInfo(args.logFile, args.csvFile)

