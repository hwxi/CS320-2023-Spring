######################################################
import sys
sys.path.append('./../../MySolution/Python')
from assign07_03 import *
######################################################
# stream_iforall\
#     (doublet_stream_from('water'), \
#      lambda i, x: i < 1000 and not(print(i,":",x)))
######################################################
test1 = \
    doublet_bfs_test('never', 'again')
print("test1 = ", test1)
assert test1
test2 = \
    doublet_bfs_test('flour', 'bread')
print("test2 = ", test2)
assert test2
test3 = \
    doublet_bfs_test('hello', 'world')
print("test3 = ", test3)
assert test3
assert not(doublet_bfs_test('hello', 'xerox'))
######################################################
print("Assign07-03-test passed!")
######################################################

#### end of [CS320-2023-Spring-assign07_03_test.py] ####
