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
xs = mylist_quicksort(xs)
print("xs = ",end=''); mylist_print(xs); print();
####################################################
#
# end-of-[assign02_02_test.py]
#
####################################################
