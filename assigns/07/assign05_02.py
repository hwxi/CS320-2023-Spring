####################################################
#!/usr/bin/env python3
####################################################
import sys
sys.path.append('./../../../../mypylib')
from mypylib_cls import *
####################################################
def AB():
    return "abcdefghijklmnopqrstuvwxyz"
####################################################
#
# HX-2023-03-14: 20 points
# Please *translate* into Python the posted solution
# on Piazza for word_neighbors (which is writtend in SML)
#
def word_neighbors(word):
    """
    Note that this function should returns a fnlist
    (not a pylist)
    Your implementation should be combinator-based very
    much like the posted solution.
    """
    wlen = string_length(word)
    return \
        fnlist_concat(string_imap_fnlist\
                      (word, lambda i, c: fnlist_concat\
                       (string_imap_fnlist(AB(), lambda _, c1: fnlist_sing\
                                           (string_tabulate(wlen, lambda j: strsub(word, j) if i != j else c1)) if (c != c1) else fnlist_nil()))))

####################################################
#
def strsub(xs, i0): return xs[i0]
def string_length(xs): return len(xs)
def string_implode(xs): return "".join(xs)
def string_filter(xs):
    return foreach_to_filter_list(string_foreach)
def string_tabulate(n0, fopr_func):
    return string_implode(int1_map_fnlist(n0, fopr_func))
#
####################################################
