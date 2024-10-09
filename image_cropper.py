import os 
from PIL import Image, ImageDraw
import time 
import sys
import traceback 

# Top Left: 56 x 105
# Size: 312 x 319
# Outer: +33
# Width: 433
# Height: 599 

def regular(img):
    print('regular')
    boarder = 33/599*img.height
    frame_size = 315/433*img.width
    x = 60/433*img.width-boarder
    y = 107/599*img.height-boarder
    w = x+frame_size+boarder*2
    h = y+frame_size+boarder*2
    area = (x, y, w, h)
    cropped_img = img.crop(area)
    return cropped_img 
    
def ultimate(img):
    print('ultimate')
    boarder = int(33/599*img.height)
    frame_size = 315/433*img.width
    x = 60/433*img.width-boarder
    y = 107/599*img.height-boarder
    w = x+frame_size+boarder*2
    h = y+frame_size+boarder*2
    
    area = (x, y, w, h)
    cropped_img = img.crop(area)
    
    size_plus = (cropped_img.size[0]+boarder*2, cropped_img.size[1]+boarder*2)
    new_final = Image.new(mode='RGBA',size=size_plus,color=(255,255,255,0))
    new_final.paste(cropped_img, (boarder, boarder))
    
    img_draw = ImageDraw.Draw(new_final)  
    img_draw.rectangle((boarder, boarder, new_final.size[0]-boarder, new_final.size[1]-boarder), outline="#000000", width=3)
    
    return new_final



def main():
    print("start")
    #try:
    #    img = Image.open(sys.argv[1])
    #    img = regular(img)
        # img = ultimate(img)
    #    img.save("_newimage.png")
    #    print("done")
    #except Exception as e:
    #    traceback.print_exc()
    #    time.sleep(5)

    try:
        pth = ".\\slike\\obicne\\"
        for path, dirs, files in os.walk(pth):
            for f in files:
                fp = os.path.join(path, f)
                img = Image.open(fp)
                img = regular(img)
                img.save(pth + f)

        pth = ".\\slike\\ultimate\\"
        for path, dirs, files in os.walk(pth):
            for f in files:
                fp = os.path.join(path, f)
                img = Image.open(fp)
                img = ultimate(img)
                img.save(pth + f)
                
    except Exception as e:
        traceback.print_exc
        time.sleep(5)

main()