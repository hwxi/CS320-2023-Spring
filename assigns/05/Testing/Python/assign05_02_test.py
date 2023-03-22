######################################################
import sys
sys.path.append('./../../MySolution/Python')
from assign05_02 import *
######################################################
nword = 0
for word in word_neighbors("a"):
    nword = nword + 1
assert nword == 25
######################################################
nword = 0
for word in word_neighbors("ab"):
    nword = nword + 1
assert nword == 50
######################################################
nword = 0
for word in word_neighbors("abc"):
    nword = nword + 1
assert nword == 75
######################################################
nword = 0
words = word_neighbors("abcd")
for word in words:
    nword = nword + 1
assert nword == 100
words = set(fnlist_pylistize(words))
assert "abcy" in words
assert "abcz" in words
assert not "abcd" in words
assert not "acbd" in words
assert not "dcba" in words
######################################################
print("Assign05-02-test passed!")
######################################################

#### end of [CS320-2023-Spring-assign05_02_test.py] ####
