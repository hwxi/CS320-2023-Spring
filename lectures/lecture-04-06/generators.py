################################################
import sys
sys.path.append('./../../mypylib')
from mypylib_cls import *
################################################
def int_from(start):
    while(True):
        yield start
        start += 1
    return None # deadcode
################################################
#
# HX-2023-04-06:
# And this one works.
#
def my_int_from(start):
    yield start
    yield from my_int_from(start+1)
#
################################################
def generator_tabulate(n0, fopr):
    if n0 >= 0:
        i0 = 0
        while i0 < n0:
            yield fopr(i0)
    else:
        i0 = 0
        while True:
            yield fopr(i0)
            i0 = i0 + 1
    return None # this line is deadcode
################################################
def generator_make_map(xs, fopr):
    for x1 in xs:
        yield fopr(x1)
    return None # deadcode
################################################
def generator_make_filter(xs, test):
    for x1 in xs:
        if test(x1):
            yield x1
    return None # deadcode
################################################
def generator_make_zip2(xs, ys):
    while True:
        x1 = next(xs)
        y1 = next(ys)
        yield (x1, y1)
    return None # deadcode
################################################
def generator_make_zip2(xs, ys):
    for (x1, y1) in zip(xs, ys):
        yield (x1, y1)
    return None # deadcode
################################################

def generator_of_stream(fxs):
    while True:
        cxs = fxs()
        if cxs.ctag == 0:
            break
        else:
            fxs = cxs.cons2
            yield cxs.cons1
    raise StopIteration

################################################

def stream_of_generator(xs):
    def strcon():
        try:
            x1 = next(xs)
            return strcon_cons(x1, strcon)
        except StopIteration:
            return strcon_nil()
    return lambda: strcon()
    
################################################

# def generator_sieve(xs):
#     while True:
#         x1 = next(xs)
#         yield x1
#         xs = generator_make_filter(xs, lambda x2: (x2 % x1 > 0))
#     return None # This line is deadcode

def generator_sieve(xs):
    def test(x1):
        return lambda x2: (x2 % x1 > 0)
    while True:
        x1 = next(xs)
        yield x1
        xs = generator_make_filter(xs, test(x1))
    return None # This line is deadcode

################################################
#
# HX-2023-04-06:
# This one works, too!
#
# def generator_sieve(gxs):
#     fxs = stream_of_generator(gxs)
#     return generator_of_stream(stream_sieve(fxs))
#
################################################

def stream_sieve(fxs):
    def test(cx1):
        return lambda cx2: cx2 % cx1 > 0
    cxs = fxs()
    cx1 = cxs.cons1
    return lambda: strcon_cons\
        (cx1, stream_sieve(stream_make_filter(cxs.cons2, test(cx1))))

################################################

thePrimes1 = generator_sieve(generator_tabulate(-1, lambda i: i+2))
thePrimes2 = generator_of_stream(stream_sieve(stream_tabulate(-1, lambda i: i+2)))

################################################
