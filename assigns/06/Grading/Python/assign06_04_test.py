######################################################
import sys
sys.path.append('./../../MySolution/Python')
from assign06_04 import *
######################################################
# stream_iforall\
#     (doublet_stream_from('water'), \
#      lambda i, x: i < 1000 and not(print(i,":",x)))
######################################################
assert\
    (len(stream_get_at(doublet_stream_from('water'), 324))==3)
assert\
    (len(stream_get_at(doublet_stream_from('water'), 325))==4)
######################################################
print("Assign06-04-test passed!")
######################################################

#### end of [CS320-2023-Spring-assign06_04_test.py] ####
