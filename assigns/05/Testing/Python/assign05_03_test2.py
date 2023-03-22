######################################################
import sys
sys.path.append('./../../MySolution/Python')
from assign05_03 import *
######################################################
balloons = \
    load_color_image\
    ("./../../MySolution/Python/INPUT/balloons.png")
######################################################
balloons = imgvec.image_trans_090l(balloons)
######################################################
ncol = 1
balloons_1 = image_seam_carving_color(balloons, ncol)
######################################################
ptotal = 0
def work_func(clr):
    global ptotal
    ptotal = ptotal + sum(clr)
imgvec.image_foreach\
    (balloons_1, lambda clr: work_func(clr))
print("ptotal = ", ptotal)
assert (ptotal == 58712691)
# assert (ptotal == 58811238) # no transposition
######################################################
ncol = 2
balloons_2 = image_seam_carving_color(balloons, ncol)
######################################################
ptotal = 0
def work_func(clr):
    global ptotal
    ptotal = ptotal + sum(clr)
imgvec.image_foreach\
    (balloons_2, lambda clr: work_func(clr))
print("ptotal = ", ptotal)
assert (ptotal == 58494021)
# assert (ptotal == 58699911) # no transposition
######################################################
print("Assign05-03-test2 passed!")
######################################################

#### end of [CS320-2023-Spring-assign05_03_test.py] ####
