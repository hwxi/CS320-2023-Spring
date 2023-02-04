####################################################
import sys
sys.path.append('../MySolution')
from assign02_02 import *
####################################################
print("[import ./../MySolution/assign02_02.py] is done!")
####################################################
xs = mylist_nil()
xs = mylist_cons(2, xs)
xs = mylist_cons(4, xs)
xs = mylist_cons(3, xs)
xs = mylist_cons(1, xs)
xs = mylist_cons(3, xs)
xs = mylist_cons(4, xs)
xs = mylist_cons(2, xs)
xs = mylist_cons(1, xs)
xs = mylist_append(xs, xs)
xs = mylist_append(xs, xs)
####################################################
print("xs = ",end=''); mylist_print(xs); print();
####################################################
def mylist_sortedq(xs):
    def helper(xs, x0):
        if (xs.ctag==0):
            return True
        else:
            x1 = xs.cons1
            xs = xs.cons2
            return (x0 <= x1 and helper(xs, x1))
        # end-of-[if-then-else]
    if (xs.ctag==0):
        return True
    else:
        return helper(xs.cons2, xs.cons1)
    # end-of-[if-then-else]
# end-of-[def mylist_sortedq(xs)]
####################################################
ys = mylist_quicksort(xs)
assert(mylist_sortedq(ys))
print("ys = ",end=''); mylist_print(ys); print();
####################################################
print("Assign02-02-test passed!\n")
####################################################
#
# end-of-[assign02_02_test.py]
#
####################################################
