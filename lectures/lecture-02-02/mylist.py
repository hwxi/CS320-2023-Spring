# datatype 'a list =
# nil | cons of ('a * 'a list)

class mylist:
    def get_ctag(self):
        return self.ctag
# end-of-class(mylist)

class mylist_nil(mylist):
    def __init__(self):
        self.ctag = 0
        return None
# end-of-class(mylist_nil)

class mylist_cons(mylist):
    def __init__(self, cons1, cons2):
        self.ctag = 1
        self.cons1 = cons1
        self.cons2 = cons2
        return None
    def get_cons1(self):
        return self.cons1
    def get_cons2(self):
        return self.cons2
# end-of-class(mylist_cons)

################################################

def mylist_nilq(xs):
    return (xs.ctag == 0)
def mylist_consq(xs):
    return (xs.ctag == 1)

################################################

def mylist_print(xs):
    sep = ";"
    def auxlst(xs, n0):
        if (xs.ctag > 0):
            if (n0 > 0): print(sep, end='')
            print(xs.cons1,end=''); auxlst(xs.cons2, n0+1)
    print("(", end=''); auxlst(xs, 0); print(")", end='')
# end-of-[mylist_print]

################################################

# fun
# length(xs: 'a list): int =
# (
# case xs of
#   nil => 0
# | _ :: xs => length(xs) + 1
# )

def mylist_size(xs):
    if (xs.ctag == 0): # nil
        return 0
    else:              # cons
        return 1 + mylist_size(xs.cons2)

################################################
