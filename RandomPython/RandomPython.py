from PIL import Image, ImageDraw
import math
def readIntegers(pathToFile):
    f = open(pathToFile)
    a = [int(x) for x in f.read().split()]
    return a

ints = readIntegers('C:\C\Random-code\MOSH\e1.txt')

pos = 0
def arrowedLine(im, ptA, ptB, width=1, color=(0,0,0)):
    draw = ImageDraw.Draw(im)
    draw.line((ptA,ptB), width=width, fill=color)
    x0, y0 = ptA
    x1, y1 = ptB
    xb = 0.95*(x1-x0)+x0
    yb = 0.95*(y1-y0)+y0
    if x0==x1:
       vtx0 = (xb-5, yb)
       vtx1 = (xb+5, yb)
    elif y0==y1:
       vtx0 = (xb, yb+5)
       vtx1 = (xb, yb-5)
    else:
       alpha = math.atan2(y1-y0,x1-x0)-90*math.pi/180
       a = 8*math.cos(alpha)
       b = 8*math.sin(alpha)
       vtx0 = (xb+a, yb+b)
       vtx1 = (xb-a, yb-b)
    draw.polygon([vtx0, vtx1, ptB], fill=color)
    return im
def read():
    global pos
    pos += 1
    return ints[pos - 1]
t = read()
for gg in range(t):
    n = read() - 1
    m = read() - 1
    read()
    g = read()
    im = Image.new('RGBA', (n * 100,  m * 100), (255, 255, 255)) 
    draw = ImageDraw.Draw(im) 
    
 
    for i in range(g):
        a = (read() -1) * 100
        b = (read() -1) * 100
        c = (read() -1) * 100
        d = (read() -1) * 100
        arrowedLine(im, (b, a), (d, c))
        #draw.line((b, a, d, c), fill=(0, 0, 0))
    im.show()
