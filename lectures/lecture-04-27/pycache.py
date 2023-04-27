########################################################################
import functools
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
# For redoing the imaging processing problem:
# @functools.cache
# def cenergy(i, j):
#     if i == 0:
#         energy(i, j)
#     else:
#         return max(cenergy(i-1, j-1), cenergy(i-1, j), cenergy(i, j+1))
#
########################################################################
#
# An example of doing manual memoization
#
# def myfibo(n):
#     return myfibo(n-2) + myfibo(n-1) if n >= 2 else n
#
mtable = {}
def myfibo(n):
    return myfibo_opt(n-2) + myfibo_opt(n-1) if n >= 2 else n
#
def myfibo_opt(n):
    if n in mtable:
        return mtable[n]
    else:
        res = myfibo(n)
        mtable[n] = res
        return res
#
########################################################################
#
N = 10
print("myfibo(",N,") =", myfibo(N))
N = 100
print("myfibo(",N,") =", myfibo(N))
#
########################################################################
