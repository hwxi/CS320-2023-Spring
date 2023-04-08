######################################################
import sys
sys.path.append('./../../MySolution/Python')
from assign07_03 import *
######################################################
# stream_iforall\
#     (doublet_stream_from('water'), \
#      lambda i, x: i < 1000 and not(print(i,":",x)))
######################################################
test0 = \
    doublet_bfs_test('never', 'never')
print("doublet_bfs_test('never', 'never') = ", test0)
test1 = \
    doublet_bfs_test('never', 'again')
print("doublet_bfs_test('never', 'again') = ", test1)
assert test1
test2 = \
    doublet_bfs_test('flour', 'bread')
print("doublet_bfs_test('flour', 'bread') = ", test2)
assert test2
test3 = \
    doublet_bfs_test('hello', 'world')
print("doublet_bfs_test('hello', 'world') = ", test3)
assert test3
######################################################
test4 = \
    doublet_bfs_test('hello', 'xerox')
print("doublet_bfs_test('hello', 'xerox') = ", test4)
assert not test4
test5 = \
    doublet_bfs_test('xerox', 'hello')
print("doublet_bfs_test('xerox', 'hello') = ", test5)
assert not test5
######################################################
print("Assign07-03-test passed!")
######################################################

#### end of [CS320-2023-Spring-assign07_03_test.py] ####
