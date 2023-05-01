######################################################
import sys
######################################################
sys.path.append('../../../07')
######################################################
sys.path.append('./../../MySolution/Python')
from assign09_03 import *
from assign09_04 import *
######################################################
myhint0 = \
    [(1, 'a'), (1, 'p'), (0, 'q'), (0, 'x'), (0, 'y')]
myhint1 = \
    [(0, 'b'), (0, 'y'), (1, 'p'), (1, 'l'), (1, 'e')]
myhints = [myhint0, myhint1]
assert "apple" == wordle_guess(myhints)
######################################################
myhint0 = \
    [(0, 'l'), (2, 'i'), (0, 's'), (0, 't'), (2, 'e'), (2, 'n')]
myhint1 = \
    [(0, 's'), (2, 'i'), (0, 'l'), (1, 'e'), (1, 'n'), (0, 't')]
myhint2 = \
    [(0, 'b'), (1, 'r'), (2, 'e'), (0, 'a'), (0, 'c'), (0, 'h')]
myhint3 = \
    [(0, 'p'), (0, 'l'), (2, 'e'), (2, 'n'), (0, 't'), (0, 'y')]
myhint4 = \
    [(0, 'm'), (0, 'o'), (0, 'u'), (0, 't'), (0, 'h'), (0, 'y')]
myhint5 = \
    [(1, 'f'), (0, 'l'), (0, 'a'), (0, 's'), (0, 'h'), (0, 'y')]
myhint6 = \
    [(1, 'f'), (1, 'r'), (1, 'i'), (1, 'e'), (1, 'n'), (1, 'd')]
myhints = \
    [myhint0, myhint1, myhint2, myhint3, myhint4, myhint5, myhint6]
assert "friend" == wordle_guess(myhints)
######################################################
myhints = \
    [[(2, 'l'), (2, 'i'), (2, 's'), (2, 't'), (2, 'e'), (2, 'n')]]
myguess = \
    wordle_guess(myhints)
print("myguess = ", myguess)
assert sorted("listen") == sorted(myguess)
######################################################
myhints =  \
    [[(0, 'a'), (0, 'a'), (0, 'a'), (0, 'a'), (2, 's'), (2, 'r')],
     [(0, 'k'), (2, 'i'), (2, 'g'), (0, 'c'), (0, 'j'), (0, 'd')],
     [(2, 'i'), (2, 'g'), (0, 'm'), (0, 'g'), (0, 'q'), (0, 'x')],
     [(2, 'n'), (1, 'p'), (0, 'u'), (1, 'i'), (0, 'h'), (1, 'g')],]
myguess = \
    wordle_guess(myhints)
print("myguess = ", myguess)
assert sorted("spring") == sorted(myguess)
######################################################
myhints = \
    [[(0, 'a'), (0, 'a'), (0, 'a'), (0, 'a'), (0, 'a'), (1, 'a'), (0, 'a'), (0, 'a'), (0, 'a'), (0, 'a'), (0, 'a'), (0, 'a'), (0, 'a')],
     [(0, 'g'), (0, 'v'), (0, 'w'), (2, 'u'), (0, 'g'), (1, 'a'), (0, 'k'), (2, 'y'), (0, 'y'), (2, 'r'), (2, 'c'), (2, 'n'), (0, 'd')],
     [(2, 'm'), (2, 'u'), (2, 'c'), (0, 'z'), (2, 'y'), (1, 'a'), (0, 'z'), (0, 'q'), (0, 'x'), (0, 'q'), (2, 'r'), (0, 'z'), (2, 'n')],
     [(2, 's'), (2, 'y'), (2, 'm'), (0, 's'), (2, 'r'), (1, 'a'), (2, 'u'), (2, 'n'), (0, 'r'), (0, 'i'), (0, 'l'), (2, 'c'), (0, 'u')],
     [(2, 'h'), (0, 'p'), (2, 'u'), (2, 'r'), (1, 's'), (1, 'a'), (2, 'y'), (0, 'o'), (2, 'm'), (1, 'e'), (2, 'n'), (0, 'e'), (2, 'c')],
     [(1, 'c'), (0, 'f'), (1, 'r'), (2, 'h'), (1, 's'), (1, 'a'), (0, 'f'), (2, 'u'), (2, 'n'), (1, 'e'), (2, 'y'), (2, 'm'), (0, 'f')],
     [(1, 'c'), (2, 'm'), (1, 'r'), (2, 'n'), (1, 's'), (1, 'a'), (2, 'h'), (0, 'm'), (2, 'u'), (1, 'e'), (2, 'h'), (2, 'y'), (1, 'm')],
     [(1, 'c'), (1, 'h'), (1, 'r'), (2, 'm'), (1, 's'), (1, 'a'), (2, 't'), (2, 'h'), (2, 'y'), (1, 'e'), (2, 'u'), (2, 'n'), (1, 'm')],]
myguess = \
    wordle_guess(myhints)
print("myguess = ", myguess)
assert myguess == "chrysanthemum"
######################################################
def wordle_rehint(myhint1, myword2):
    myguess = []
    for (k, c) in myhint1:
        myguess.append(c)
    myhint2 = \
        wordle_hint(myword2, ''.join(myguess))
    print ("myhint1 = ", myhint1)
    print ("myhint2 = ", myhint2)
    return (sorted(myhint1) == sorted(myhint2))
######################################################
def wordle_rehints(myhints, myword2):
    for myhint1 in myhints:
        if not wordle_rehint(myhint1, myword2):
            return False
    return True
######################################################
def wordle_tester(myword1):
    def myhint_is_full(myhint):
        for (k, c) in myhint:
            if k != 1:
                return False
        return True
    myhints = []
    myword2 = len(myword1) * 'x'
    myhints.append(wordle_hint(myword1, myword2))
    while not myhint_is_full(myhints[-1]):
        myword2 = wordle_guess(myhints)
        if not wordle_rehints(myhints, myword2):
            return False
        myhints.append(wordle_hint(myword1, myword2))
    return True
######################################################
assert wordle_tester("intriguing")
assert wordle_tester("compensation")
assert wordle_tester("chrysanthemum")
######################################################
print("Assign09-04-test passed!")
######################################################

#### end of [CS320-2023-Spring-assign09_04_test.py] ####
