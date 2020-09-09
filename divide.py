from parser_2 import arg_parse
import random

if __name__ == '__main__':
    args = arg_parse()
    mai = []
    sec = []
    f = open(args.data_file, "r")
    f1 = f.readlines()

    for x in f1:
        if x.split(' ')[0] == args.tag_main:
            mai.append(x)
        else:
            sec.append(x)

    length_main = int(args.total_size * (1-(args.pctg_sec/100)))
    length_sec = int(args.total_size - length_main)
    length_tot = args.total_size
    if len(mai) < length_main:
        random.shuffle(mai)
        length_main = len(mai)
        length_tot = int(length_main / (1-args.pctg_sec / 100))
        length_sec = length_tot - length_main
        print('Not enough data amount in main tag, changed total length to: ' + str(length_tot))
    else:
        mai = random.sample(mai, length_main)

    if len(sec) < length_sec:
        length_main = min(length_main, int(len(sec) * (1 - (args.pctg_sec / 100)) / (args.pctg_sec / 100)))
        length_sec = int(length_main * (args.pctg_sec / 100) / (1 - (args.pctg_sec / 100)))
        length_tot = length_main + length_sec
        mai = random.sample(mai, length_main)
        random.shuffle(sec)
        print('Not enough data from the non main tag, changed total length to: ' + str(length_tot))
    else:
        sec = random.sample(sec, length_sec)

    joined = mai + sec
    random.shuffle(joined)

    print('Saving data in file')
    file = open(args.save_file, "w")
    for i in range(len(joined)):
        if i == len(joined) - 1:
            file.write(str(joined[i]))
        else:
            file.write(str(joined[i]))
    file.close()

