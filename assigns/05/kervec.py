##########################################################
import sys
sys.path.append('./../../mypylib')
from mypylib_cls import *
##########################################################

class kernel:
    def __init__(self, ksz, tuple):
        self.size = ksz
        self.values = tuple
        return None
# end-of-[class kernel]

##########################################################

def kernel_get_value(kernel, i, j):
    return kernel.values[i*kernel.size+j]

##########################################################

def kernel_make_pylist(ksz, tuple):
    assert(ksz*ksz == len(tuple))
    return kernel(ksz, tuple)

##########################################################

def kernel_foreach(kernel, work_func):
    for val in kernel.values:
        work_func(val)
    return None

##########################################################

def kernel_ifoldleft(kernel, ini, ifopr_func):
    return foreach_to_ifoldleft\
        (kernel_foreach)(kernel, ini, ifopr_func)

##########################################################

def kernel_i2foldleft(kernel, ini, i2fopr_func):
    ksz = kernel.size
    return kernel_ifoldleft\
        (kernel, ini, \
         lambda res, ij, v0: i2fopr_func(res, ij//ksz, ij % ksz, v0))

##########################################################

def kernel_fimage_apply(kernel, fimage):
    ini = 0
    hsz = kernel.size // 2
    return kernel_i2foldleft\
        (kernel, ini, lambda res, i0, j0, v0: res + fimage(i0-hsz,j0-hsz) * v0)

##########################################################

################## end-of-[kernel.py] ####################
