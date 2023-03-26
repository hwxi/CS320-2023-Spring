########################################################################
from mypylib_cls import * 
########################################################################

def fnlist_foreach(xs, work_func):
    for x1 in xs:
        work_func(x1)
    return None

def fnlist_rforeach(xs, work_func):
    for x1 in reversed(xs):
        work_func(x1)
    return None

def fnlist_map_pylist(xs, ys, fopr):
    return [fopr(x1) for x1 in xs]
        
def fnlist_z2foreach(xs, ys, work_func):
    for (x1, y2) in zip(xs, ys):
        work_func(x1, y2)
    return None

def fnlist_z2rforeach(xs, ys, work_func):
    for (x1, y2) in zip(reversed(xs), reversed(ys)):
        work_func(x1, y2)
    return None

########################################################################

pxs = [0,1,2,3,4]
fxs = fnlist_make_pylist(pxs)
print("pxs = ", pxs, end='', sep=''); print()
fnlist_rforeach\
    (fxs, lambda x1: print("(", x1, ")"))
fnlist_z2foreach\
    (fxs, fxs, lambda x1, x2: print("(", x1, ",", x2, ")"))

########################################################################

print(pylist_imap_pylist([1,2,3,4,5], lambda i, x: x + i*i))
pylist_iforeach([1,2,3,4,5], lambda i, x: print("[",i,"]:", x))
print\
(string_imap_pylist("123456789", lambda i, x: ord(x) + i*i))
string_iforeach("123456789", lambda i, x: print("[",i,"]:", x))

########################################################################

def pylist_forall(xs, test):
    return foreach_to_forall(pylist_foreach)(xs, test)

########################################################################

def string_length(xs):
    return string_foldleft(xs, 0, lambda r0, x0: 1 + r0)

########################################################################

