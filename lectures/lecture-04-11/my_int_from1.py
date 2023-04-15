################################################
import sys
################################################
def my_int_from1(start):
    # print("my_int_from1: while-bef")
    while True:
        # print("my_int_from1: yield-bef")
        yield start
        # print("my_int_from1: yield-aft")
        start = start + 1
################################################    
for i in my_int_from1(0):
    if i >= 10000:
        break
    else:
        print("i =", i)
################################################


