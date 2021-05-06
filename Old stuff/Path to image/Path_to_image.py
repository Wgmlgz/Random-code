from PIL import Image, ImageDraw 
import csv
import time
def tof(str):
    f = float(str)
    f = f * 50
    f = f + 500
    return f
def ton(str):
    f = float(str)
    f = -f
    f = f * 50
    f = f + 500
    return f
def createLines(filename):
    lines = []
    with open(filename) as csv_file:
        csv_reader = csv.reader(csv_file, delimiter=',')
        line_count = 0
        for row in csv_reader:
            lines.append(((tof(row[0]), ton(row[1])), (tof(row[2]), ton(row[3]))))
        csv_file.close()
    return lines

def createPathImage(img, lines, color):
    img1 = ImageDraw.Draw(img)   
    for i in lines:
        img1.line(i, fill = color, width = 0) 
    
 
#import subprocess
#subprocess.call(["C:\\C\\Random-code\\ObjectBounce\\Debug\\ObjectBounce.exe"])
for i in range(10):
    continue
    img = Image.new('RGB', (1000, 1000))
    createPathImage(img, createLines('C:\C\Random-code\ObjectBounce\lines' + str(i) + '.csv'), 'red')
    createPathImage(img, createLines('C:\C\Random-code\ObjectBounce\path' + str(i) + '.csv'), 'green')
    img.save(str(i) + 'da.png')

while(True):
    try:
        img = Image.new('RGB', (1000, 1000))
        createPathImage(img, createLines('C:\C\Random-code\Lens\path' + '.csv'), 'red')
        img.save('da.png')
        time.sleep(1)
    except:
        pass
print('hi bro')