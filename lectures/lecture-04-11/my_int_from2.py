################################################
import sys
# sys.setrecursionlimit(12000)
################################################
def my_int_from2(start):
    yield start
    yield from my_int_from2(start+1)
################################################
for i in my_int_from2(0):
    if i >= 10000:
        break
    else:
        print("i =", i)
################################################

