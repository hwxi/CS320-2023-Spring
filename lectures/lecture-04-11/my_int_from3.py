################################################
import sys
################################################
sys.setrecursionlimit(100)
################################################
sys.path.append('./../../mypylib')
################################################
from mypylib_cls import *
################################################
# def my_int_from3(start):
#     return \
#         generator_of_stream\
#         (stream_tabulate(-1, lambda i: i))
################################################
def my_int_from3(start):
    def helper(start):
        return \
            strcon_cons(start, lambda: helper(start+1))
    return generator_of_stream(lambda: helper(start))
################################################
for i in my_int_from3(0):
    if i >= 10000:
        break
    else:
        print("i =", i)
################################################

