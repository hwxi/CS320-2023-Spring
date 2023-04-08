####################################################
#!/usr/bin/env python3
####################################################
import sys
####################################################
sys.path.append('./../../../../mypylib')
####################################################
from mypylib_cls import *
####################################################
def cube_sum(ij):
    i = ij[0]
    j = ij[1]
    return i*i*i + j*j*j
####################################################
def cube_sum_lte(ij1, ij2):
    return (cube_sum(ij1) <= cube_sum(ij2))
####################################################
def strcon_merge2(cxs1, cxs2, lte3):
    cx1 = cxs1.cons1
    cx2 = cxs2.cons1
    if lte3(cx1, cx2):
        return strcon_cons(cx1, lambda: strcon_merge2((cxs1.cons2)(), cxs2, lte3))
    else:
        return strcon_cons(cx2, lambda: strcon_merge2(cxs1, (cxs2.cons2)(), lte3))
    # end-of-(if lte3(cx1, cx2))
def stream_merge2(fxs1, fxs2, lte3):
    return lambda: strcon_merge2(fxs1(), fxs2(), lte3)
####################################################

def theNatPairs_cubesum():
    def helper(i0):
        return strcon_cons((i0, i0), stream_merge2(stream_tabulate(-1, lambda j0: (i0, i0+1+j0)), lambda: helper(i0+1), cube_sum_lte))
    return generator_of_stream(lambda: helper(0))

####################################################
