#########################################################################
# (* ****** ****** *)
# (*
# HX-2023-02-17:
# Library functions
# for BUCASCS320-2023-Spring
# This is a class-wide library,
# that is, it is shared by the class.
# *)
# (* ****** ****** *)
#########################################################################

def int1_forall(n0, test_func):
    i0 = 0
    while(i0 < n0):
        if not test_func(i0):
            return False
        i0 = (i0 + 1)
    return True # test_func(i0)==True for all 0 <= i0 < n0

def int1_foreach(n0, work_func):
    i0 = 0
    while(i0 < n0):
        work_func(i0)
        i0 = (i0 + 1)
    return None # work_func(i0) is done for all 0 <= i0 < n0

def int1_rforeach(n0, work_func):
    i0 = 0
    while(i0 < n0):
        work_func(n0-1-i0)
        i0 = (i0 + 1)
    return None # work_func(i0) is done for all n0 > i0 >= 0

#########################################################################

def forall_to_foreach(forall):
    def foreach(xs, work_func):
        def test_func(x0):
            work_func(x0)
            return True
        forall(xs, test_func)
        return None
    return foreach # forall-function is turned into foreach-function

#########################################################################

def foreach_to_forall(foreach):
    class FalseExn(Exception):
        def __init_(self):
            return None
    def forall(xs, test_func):
        def work_func(x0):
            if test_func(x0):
                return None
            else:
                raise FalseExn
        try:
            foreach(xs, work_func)
            return True
        except FalseExn:
            return False
    return forall # foreach-function is turned into forall-function

#########################################################################

def foreach_to_foldleft(foreach):
    def foldleft(r0, xs, fopr_func):
        res = r0
        def work_func(x0):
            nonlocal res
            res = fopr_func(res, x0)
            return None
        foreach(xs, work_func)
        return res
    return foldleft # foreach-function is turned into foldleft-function

#########################################################################

######################## end of [mypylib-cls.py] ########################
