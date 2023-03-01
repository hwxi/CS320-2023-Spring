########################################################################
from mypylib_cls import * 
########################################################################

pxs = [0,1,2,3,4]
fxs = fnlist_make_pylist(pxs)
print("pxs = ", pxs, end='', sep=''); print()
print("fxs = ", end=''); fnlist_print(fxs); print();

########################################################################

print(pylist_imap_pylist([1,2,3,4,5], lambda i, x: x + i*i))
pylist_iforeach([1,2,3,4,5], lambda i, x: print("[",i,"]:", x))
print\
(string_imap_pylist("123456789", lambda i, x: ord(x) + i*i))
string_iforeach("123456789", lambda i, x: print("[",i,"]:", x))

########################################################################
