####################################
#
# Python does not do tail-call
# optimization
#
####################################

def foo(x):
    return foo(x+1)

####################################
#
# Python uses GMP for integers
#
####################################

def fact(x):
    if (x > 0):
        return x * fact(x-1)
    else:
        return 1
# N = 100
# print("fact(", N, ") = ", fact(N))

####################################
