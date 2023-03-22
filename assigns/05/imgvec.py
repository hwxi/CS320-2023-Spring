####################################################
import sys
sys.path.append('./../../mypylib')
from mypylib_cls import *
####################################################
import kervec
####################################################

class image:
    def __init__(self, hh, ww, pixlst):
        self.width = ww
        self.height = hh
        self.pixlst = pixlst
        # print("pixlst = ", pixlst)
        return None
# end-of-[class image]

####################################################

def image_get_pixel(image, i, j):
    return image.pixlst[i*image.width+j]

####################################################

def image_make_tuple(hh, ww, pixlst):
    assert(hh * ww == len(pixlst))
    return image(hh, ww, pixlst)

def image_make_pylist(hh, ww, pixlst):
    assert(hh * ww == len(pixlst))
    return image(hh, ww, tuple(pixlst))

####################################################

def image_foreach(image, work_func):
    for pix in image.pixlst: work_func(pix)
    return None # end-of(image_foreach(image, work_func))

####################################################

def image_make_map(image, fopr_func):
    ww = image.width
    hh = image.height
    return image_make_pylist\
        (hh, ww, image_map_pylist(image, fopr_func))
def image_map_pylist(image, fopr_func):
    return foreach_to_map_pylist(image_foreach)(image, fopr_func)

####################################################

def image_iforeach(image, iwork_func):
    for (i0, pix) in enumerate(image.pixlst):
        iwork_func(i0, pix)
    return None

####################################################

def image_make_imap(image, ifopr_func):
    ww = image.width
    hh = image.height
    return image_make_pylist\
        (hh, ww, image_imap_pylist(image, ifopr_func))
def image_imap_pylist(image, ifopr_func):
    return iforeach_to_imap_pylist(image_iforeach)(image, ifopr_func)

####################################################

def image_make_z2map(ximg1, yimg2, fopr_func):
    ww1 = ximg1.width
    ww2 = yimg2.width
    hh1 = ximg1.height
    hh2 = yimg2.height
    assert ww1 == ww2 and hh1 == hh2
    return image_make_pylist\
        (hh1, ww1, \
         [fopr_func(x1, y2) for (x1, y2) in zip(ximg1.pixlst, yimg2.pixlst)])
def image_z2map_pylist(ximg1, yimg2, fopr_func):
    return [fopr_func(x1, y2) for (x1, y2) in zip(ximg1.pixlst, yimg2.pixlst)]

####################################################

def image_make_i2map(image, i2fopr_func):
    ww = image.width
    hh = image.height
    return image_make_pylist\
        (hh, ww, image_i2map_pylist(image, i2fopr_func))
def image_i2map_pylist(image, i2fopr_func):
    ww = image.width
    hh = image.height
    return image_imap_pylist\
         (image, lambda ij, pix: i2fopr_func(ij//ww, ij % ww, pix))

####################################################

def image_i2filter_pylist(image, i2test_func):
    ww = image.width
    hh = image.height
    res = []
    for (ij, pix) in enumerate(image.pixlst):
        if i2test_func(ij//ww, ij % ww, pix): res.append(pix)
    return res # return

####################################################

def image_round_and_clip(image):
    return image_make_map(image, lambda pix: max(0, min(round(pix), 255)))

####################################################

def image_kernel_correlate(image, kernel, bbehav):
    hsz = kernel.size // 2
    if bbehav == 'zero':
        fimage = lambda x, y: func_image_pixel_zero(image, x, y)
        return image_make_i2map\
            (image, \
             lambda x, y, _: kervec.kernel_fimage_apply(kernel, fimage(x, y)))
    if bbehav == 'wrap':
        fimage = lambda x, y: func_image_pixel_wrap(image, x, y)
        return image_make_i2map\
            (image, \
             lambda x, y, _: kervec.kernel_fimage_apply(kernel, fimage(x, y)))
    if bbehav == 'extend':
        fimage = lambda x, y: func_image_pixel_extend(image, x, y)
        return image_make_i2map\
            (image, \
             lambda x, y, _: kervec.kernel_fimage_apply(kernel, fimage(x, y)))
    raise NotImplementedError

####################################################

def func_image_pixel_zero(image, x, y):
    """
    Given an image and integers x and y, returns a function that takes
    two integers i and j and returns the value of the pixel at position
    (x+i, y+j). Handles boundary cases according to boundary behavior 'zero'.
    """
    ww = image.width
    hh = image.height
    
    def func(i, j):
        xi = x + i
        yj = y + j
        if xi < 0 or xi >= hh:
            return 0
        if yj < 0 or yj >= ww:
            return 0
        return image_get_pixel(image, xi, yj)

    return lambda i, j: func(i, j)

####################################################

def func_image_pixel_wrap(image, x, y):
    """
    Given an image and integers x and y, returns a function that takes
    two integers i and j and returns the value of the pixel at position
    (x+i, y+j). Handles boundary cases according to boundary behavior 'wrap'.
    """
    ww = image.width
    hh = image.height
    
    def func(i, j):
        xi = (x+i) % hh
        yi = (y+j) % ww
        return image_get_pixel(image, xi, yj)

    return lambda i, j: func(i, j)

####################################################

def func_image_pixel_extend(image, x, y):
    """
    Given an image and integers x and y, returns a function that takes
    two integers i and j and returns the value of the pixel at position
    (x+i, y+j). Handles boundary cases according to boundary behavior 'extend'.
    """
    ww = image.width
    hh = image.height
    
    def func(i, j):
        xi = x + i
        yj = y + j
        xi = max(xi, 0)
        yj = max(yj, 0)
        if xi >= hh:
            xi = hh - 1
        if yj >= ww:
            yj = ww - 1
        # print("xi = ", xi)
        # print("yj = ", yj)
        return image_get_pixel(image, xi, yj)

    return lambda i, j: func(i, j)

####################################################

def image_trans_090l(image):
    ww = image.width
    hh = image.height
    pixlst = image.pixlst
    pixres = []
    for j in range(ww):
        for i in range(hh):
            pixres.append(pixlst[i*ww+ww-1-j])
    return image_make_pylist(ww, hh, pixres)

def image_trans_090r(image):
    ww = image.width
    hh = image.height
    pixlst = image.pixlst
    pixres = []
    for j in range(ww):
        for i in range(hh):
            pixres.append(pixlst[(hh-1-i)*ww+j])
    return image_make_pylist(ww, hh, pixres)

####################################################

############### end-of-[imgvec.py] #################
