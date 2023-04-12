######################################################
import sys
sys.setrecursionlimit(16000)
sys.path.append('./../../MySolution/Python')
######################################################
from assign06_03 import *
######################################################
def nqueen(bd):
    res = 0
    for j0 in bd:
        if j0 <= 0:
            break
        else:
            res = res + 1
    return res
def board_safety_all(bd):
    return \
        int1_forall\
        (nqueen(bd), \
         lambda i0: board_safety_one(bd, i0))
def board_safety_one(bd, i0):
    def helper(j0):
        pi = bd[i0]
        pj = bd[j0]
        return pi != pj and abs(i0-j0) != abs(pi-pj)
    return int1_forall(i0, helper)
####################################################
theNQueenSols_10 = solve_N_queen_puzzle(10)
######################################################
theNQueenSols_16 = solve_N_queen_puzzle(16)
######################################################
theNQueenSols_20 = solve_N_queen_puzzle(20)
######################################################
fxs = theNQueenSols_10
cxs = fxs()
fxs = cxs.cons2
print(cxs.cons1)
assert(board_safety_all(cxs.cons1))
cxs = fxs()
fxs = cxs.cons2
print(cxs.cons1)
assert(board_safety_all(cxs.cons1))
######################################################
fxs = theNQueenSols_16
cxs = fxs()
fxs = cxs.cons2
print(cxs.cons1)
assert(board_safety_all(cxs.cons1))
cxs = fxs()
fxs = cxs.cons2
print(cxs.cons1)
assert(board_safety_all(cxs.cons1))
######################################################
fxs = theNQueenSols_20
cxs = fxs()
fxs = cxs.cons2
print(cxs.cons1)
assert(board_safety_all(cxs.cons1))
cxs = fxs()
fxs = cxs.cons2
print(cxs.cons1)
assert(board_safety_all(cxs.cons1))
######################################################
theNQueenSols_8 = solve_N_queen_puzzle(8)
assert(stream_forall\
       (theNQueenSols_8, \
        lambda bd: nqueen(bd)==8 and board_safety_all(bd)))
# theNQueenSols_8 = solve_N_queen_puzzle(8)
# stream_iforeach\
#    (theNQueenSols_8, lambda i, bd: print("solution(",i+1,") =", bd))
######################################################
print("Assign06-03-test passed!")
######################################################

#### end of [CS320-2023-Spring-assign06_03_test.py] ####
