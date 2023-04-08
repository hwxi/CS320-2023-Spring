####################################################
#!/usr/bin/env python3
####################################################
import sys
####################################################
sys.setrecursionlimit(16000)
####################################################
sys.path.append('./../../../../mypylib')
####################################################
from mypylib_cls import *
####################################################
sys.path.append('./../../MySolution/Python')
from assign08_02 import *
######################################################
def cube_sum(ij):
    i = ij[0]
    j = ij[1]
    return i*i*i + j*j*j
####################################################
def cube_sum_lte(ij1, ij2):
    return (cube_sum(ij1) <= cube_sum(ij2))
####################################################
def theNatPairs_cubesum():
    def helper(i0):
        yield (i0, i0)
        yield from generator_merge2(generator_tabulate(-1, lambda j0: (i0, i0+1+j0)), helper(i0+1), cube_sum_lte)
    return helper(1)
####################################################
def theRamanujan_cubesum_pairs():
    def dupfind(ijs, csumij0):
        ij1 = next(ijs)
        csum1 = cube_sum(ij1)
        if csumij0[0] == csum1:
            yield csumij0
            yield (csum1, ij1)
            yield from dupfind(ijs, (csum1, ij1))
        else:
            yield from dupfind(ijs, (csum1, ij1))
    return dupfind(theNatPairs_cubesum(), (0, (0, 0)))
####################################################
cijs = theRamanujan_cubesum_pairs()
####################################################
assert next(cijs) == (1729, (1, 12))
assert next(cijs) == (1729, (9, 10))
assert next(cijs) == (4104, (2, 16))
assert next(cijs) == (4104, (9, 15))
assert next(cijs) == (13832, (2, 24))
assert next(cijs) == (13832, (18, 20))
assert next(cijs) == (20683, (10, 27))
assert next(cijs) == (20683, (19, 24))
assert next(cijs) == (32832, (4, 32))
assert next(cijs) == (32832, (18, 30))
assert next(cijs) == (39312, (2, 34))
assert next(cijs) == (39312, (15, 33))
assert next(cijs) == (40033, (9, 34))
assert next(cijs) == (40033, (16, 33))
####################################################
print("Assign08-02-test passed!")
####################################################
