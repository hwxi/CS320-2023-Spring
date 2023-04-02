######################################################
import sys
sys.path.append('./../../MySolution/Python')
from assign07_03 import *
######################################################
# stream_iforall\
#     (doublet_stream_from('water'), \
#      lambda i, x: i < 1000 and not(print(i,":",x)))
######################################################
assert(doublet_bfs_test('never', 'again'))
assert(doublet_bfs_test('flour', 'bread'))
assert(not(doublet_bfs_test('hello', 'world')))
######################################################
print("Assign07-03-test passed!")
######################################################

#### end of [CS320-2023-Spring-assign07_03_test.py] ####
