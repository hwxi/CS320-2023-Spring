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
    for i0 in range(n0):
        if not test_func(i0): return False
    return True # test_func(i0)==True for all 0 <= i0 < n0

def int1_foreach(n0, work_func):
    for i0 in range(n0): work_func(i0)
    return None # work_func(i0) is done for all 0 <= i0 < n0

#########################################################################

def forall_to_foreach(forall):
    def foreach(xs, work_func):
        def test_func(x0):
            work_func(x0)
            return True
        forall(xs, test_func)
        return None
    return foreach # forall-function is turned into a foreach-function

######################## end of [mypylib-cls.py] ########################
