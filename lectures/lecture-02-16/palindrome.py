####################################################
import sys
sys.path.append('./../../mypylib')
from mypylib_cls import *
####################################################

def palindrome_test(word):
    n0 = len(word)
    return int1_forall((n0+1)/2, lambda i: word[i] == word[n0-i-1])

def palindrome_test2(word):
    return \
        palindrome_test\
        (string_make_pylist\
         (pylist_map(pylist_filter(string_pylistize(word), lambda c: c.isalpha()), lambda c: c.upper())))

####################################################
