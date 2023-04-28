########################################################################
import functools
########################################################################
@functools.cache
def fibo(n: int) -> int:
    return fibo(n-2) + fibo(n-1) if n >= 2 else n
########################################################################

N = 10
print("fibo(",N,") =", fibo(N))
N = 100
print("fibo(",N,") =", fibo(N))

########################################################################
#
# An example of doing manual memoization
#
# def myfibo(n):
#     return myfibo(n-2) + myfibo(n-1) if n >= 2 else n
#
myfibo_mtable = {}
#
def myfibo(n):
    if n in myfibo_mtable:
        return myfibo_mtable[n]
    else:
        result = myfibo_rec(n)
        myfibo_mtable[n] = result
        return result
#
def myfibo_rec(n):
    return myfibo(n-2) + myfibo(n-1) if n >= 2 else n
#
########################################################################
#
N = 10
print("myfibo(",N,") =", myfibo(N))
N = 100
print("myfibo(",N,") =", myfibo(N))
#
########################################################################
