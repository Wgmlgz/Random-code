with open('e2.txt') as f:
    w, h = [int(x) for x in next(f).split()] # read first line
    array = []
    for line in f: # read rest of lines
        array.append([int(x) for x in line.split()])