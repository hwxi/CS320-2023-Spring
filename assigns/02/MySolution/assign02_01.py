####################################################
import sys
sys.path.append('..')
from assign02 import *
####################################################
print("[import ./../assign02.py] is done!")
####################################################
#
# Please implement (20 points)
# mylist_append (see list_append)
# mylist_rappend (see list_rappend)
# mylist_reverse (see list_reverse)
#
####################################################

def mylist_append(xs, ys):
    if (xs.ctag==0):
        return ys
    else:
        return mylist_cons(xs.cons1, mylist_append(xs.cons2, ys))
    # end-of-[if-then-else]

####################################################

def mylist_reverse(xs):
    return mylist_rappend(xs, mylist_nil())

def mylist_rappend(xs, ys):
    if (xs.ctag==0):
        return ys
    else:
        return mylist_rappend(xs.cons2, mylist_cons(xs.cons1, ys))
    # end-of-[if-then-else]

####################################################
