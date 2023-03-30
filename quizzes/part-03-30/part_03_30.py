####################################################
#!/usr/bin/env python3
####################################################
import sys
sys.path.append('./../../mypylib')
sys.path.append('../../assigns/05')
from mypylib_cls import *
####################################################
import math
####################################################
import kervec
import imgvec
####################################################
from PIL import Image
####################################################

def load_color_image(filename):
    """
    Loads a color image from the given file and returns a dictionary
    representing that image.

    Invoked as, for example:
       i = load_color_image("test_images/cat.png")
    """
    with open(filename, "rb") as img_handle:
        img = Image.open(img_handle)
        img = img.convert("RGB")  # in case we were given a greyscale image
        img_data = img.getdata()
        pixels = list(img_data)
        width, height = img.size
        return imgvec.image(height, width, pixels)
    # return None

def save_color_image(image, filename, mode="PNG"):
    """
    Saves the given color image to disk or to a file-like object.  If filename
    is given as a string, the file type will be inferred from the given name.
    If filename is given as a file-like object, the file type will be
    determined by the "mode" parameter.
    """
    out = Image.new(mode="RGB", size=(image.width, image.height))
    out.putdata(image.pixlst)
    if isinstance(filename, str):
        out.save(filename)
    else:
        out.save(filename, mode)
    out.close()
    # return None

####################################################
def image_vreflect(image):
    ww = image.width
    hh = image.height
    return \
        imgvec.image_make_i2map\
        (image, \
         lambda i0, j0, v0: imgvec.image_get_pixel(image, ??????, ??????))
####################################################
# balloons = \
#     load_color_image\
#     ("./../../assigns/05/MySolution/Python/INPUT/balloons.png")
# save_color_image(image_copy(balloons), "balloons_copy.png")
# save_color_image(image_hreflect(balloons), "balloons_hrefl.png")
# save_color_image(image_vreflect(balloons), "balloons_vrefl.png")
# save_color_image(image_transpose(balloons), "balloons_trans.png")
# save_color_image(image_rotate_090l(balloons), "balloons_090l.png")
# save_color_image(image_rotate_090r(balloons), "balloons_090r.png")
# save_color_image(image_rotate_180r(balloons), "balloons_180r.png")
####################################################
