class mylist(object):
    def get_ctag(self):
        return self.ctag
    def __iter__(self):
        return mylist_iter(self)
# end-of-class(mylist)

class mylist_iter:
    def __init__(self, xs):
        self.xs = xs
    def __iter__(self):
        return self
    def __next__(self):
        if (self.xs.ctag==0):
            raise StopIteration
        else:
            head = self.xs.head
            self.xs = self.xs.tail
            return head
    # end-of-[__next__]

class mylist_nil(mylist):
    def __init__(self):
        self.ctag = 0
        return None
# end-of-class(mylist_nil)

class mylist_cons(mylist):
    def __init__(self, head, tail):
        self.ctag = 1
        self.head = head
        self.tail = tail
        return None
    def get_head(self):
        return self.head
    def get_tail(self):
        return self.tail
# end-of-class(mylist_cons)

def mylist_nilq(xs):
    return (xs.ctag == 0)
def mylist_consq(xs):
    return (xs.ctag != 0)

def mylist_print(xs):
    sep = ";"
    def auxlst(xs, n0):
        if (xs.ctag > 0):
            if (n0 > 0): print(sep, end='')
            print(xs.head,end=''); auxlst(xs.tail, n0+1)
    print("(", end=''); auxlst(xs, 0); print(")", end='')
# end-of-[mylist_print]

def mylist_make_list(xs):
    res = mylist_nil()
    for x1 in xs:
        res = mylist_cons(x1, res)
    return mylist_reverse(res)

def mylist_length(xs):
    return (0 if(xs.ctag==0) else 1 + mylist_length(xs.tail))
# end-of-[mylist_length]

def mylist_append(xs, ys):
    return (ys if(xs.ctag==0) else mylist_cons(xs.head, mylist_append(xs.tail, ys)))
# end-of-[mylist_append]

def mylist_reverse(xs):
    return mylist_rappend(xs, mylist_nil())
# end-of-[mylist_reverse]

def mylist_rappend(xs, ys):
    return (ys if(xs.ctag==0) else mylist_rappend(xs.tail, mylist_cons(xs.head, ys)))
# end-of-[mylist_rappend]

def mylist_forall(xs, test):
    return True if (xs.ctag == 0) else (mylist_forall(xs.tail, test) if test(xs.head) else False)

def mylist_foreach(xs, work):
    def sqn2(skipped, result): return result
    mylist_forall(xs, lambda x: sqn2(work(x), True)); return None

#
# Here is some testing code:
#

xs = mylist_make_list([0,1,2,3,4])
ys = mylist_make_list([5,6,7,8,9])
xsys = mylist_append(xs, ys)
print("xsys = ", end=''); mylist_print(xsys); print()
sysx = mylist_reverse(xsys)
print("sysx = ", end=''); mylist_print(sysx); print()

i0 = 0
for x0 in xs:
    print("xs[",i0,"] = ",sep='',end=''); print(x0)
    i0 = i0 + 1
mylist_foreach(xs, lambda x: print(x))
