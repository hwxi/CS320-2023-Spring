######################################################
import sys
######################################################
sys.path.append('../../../07')
####################################################
from dictwords import *
from assign05_02 import *
####################################################
sys.path.append('./../../MySolution/Python')
from assign08_03 import *
######################################################
def doublet_bfs_test(w1, w2):
    words = \
    generator_graph_bfs\
    ([w1], word_neighbors_legal)
    for wx in words:
        if w2 == wx:
           return True 
    return False
####################################################
def word_neighbors_legal(word):
    return fnlist_filter_pylist\
        (word_neighbors(word), word_is_legal)
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
print("Assign08-03-test passed!")
######################################################

#### end of [CS320-2023-Spring-assign08_03_test.py] ####
