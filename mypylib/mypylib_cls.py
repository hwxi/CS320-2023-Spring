###########################################################################
# (* ****** ****** *)
# (*
# HX-2023-02-17:
# Library functions
# for BUCASCS320-2023-Spring
# This is a class-wide library,
# that is, it is shared by the class.
# *)
# (* ****** ****** *)
###########################################################################

def int1_forall(n0, test_func):
    i0 = 0
    while(i0 < n0):
        if not test_func(i0):
            return False
        i0 = (i0 + 1)
    return True # test_func(i0)==True for all 0 <= i0 < n0

def int1_foreach(n0, work_func):
    i0 = 0
    while(i0 < n0):
        work_func(i0)
        i0 = (i0 + 1)
    return None # work_func(i0) is done for all 0 <= i0 < n0

def int1_rforeach(n0, work_func):
    i0 = 0
    while(i0 < n0):
        work_func(n0-1-i0)
        i0 = (i0 + 1)
    return None # work_func(i0) is done for all n0 > i0 >= 0

def int1_map_fnlist(xs, fopr_func):
    return foreach_to_map_fnlist(int1_foreach)(xs, fopr_func)
def int1_map_pylist(xs, fopr_func):
    return foreach_to_map_pylist(int1_foreach)(xs, fopr_func)

def int1_foldleft(xs, r0, fopr_func):
    return foreach_to_foldleft(int1_foreach)(xs, r0, fopr_func)
def int1_foldright(xs, r0, fopr_func):
    return rforeach_to_foldright(int1_rforeach)(xs, r0, fopr_func)

###########################################################################

# datatype 'a list =
# nil | cons of ('a * 'a list)

class fnlist:
    ctag = -1
    def get_ctag(self):
        return self.ctag
    def __iter__(self):
        return fnlist_iter(self)
    def __reversed__(self):
        return fnlist_reverse(self)
# end-of-class(fnlist)

###########################################################################

class fnlist_iter:
    def __iter__(self):
        return self
    def __init__(self, itms):
        self.itms = itms
    def __next__(self):
        if (self.itms.ctag==0):
            raise StopIteration
        else:
            itm1 = self.itms.cons1
            self.itms = self.itms.cons2
            return itm1
    # end-of-[__next__]

###########################################################################

class fnlist_nil(fnlist):
    def __init__(self):
        self.ctag = 0
        return None
# end-of-class(fnlist_nil)

class fnlist_cons(fnlist):
    def __init__(self, cons1, cons2):
        self.ctag = 1
        self.cons1 = cons1
        self.cons2 = cons2
        return None
    def get_cons1(self):
        return self.cons1
    def get_cons2(self):
        return self.cons2
# end-of-class(fnlist_cons)

####################################################
def fnlist_sing(x0):
    return fnlist_cons(x0, fnlist_nil())
####################################################

def fnlist_print(xs):
    nx = 0
    sep = "; "
    print("[",end='')
    while(xs.ctag > 0):
        if (nx > 0):
            print(sep,end='')        
        print(xs.cons1,end='')
        nx = nx + 1; xs = xs.cons2
    print("]", end='')
# end-of-[fnlist_print]

####################################################

def fnlist_foreach(xs, work_func):
    while(xs.ctag > 0):
        x0 = xs.cons1
        xs = xs.cons2
        work_func(x0)
    return None

####################################################
def fnlist_append(xs, ys):
    return fnlist_foldright(xs, ys, fnlist_cons)
def fnlist_concat(xss):
    return fnlist_foldright(xss, fnlist_nil(), fnlist_append)
####################################################
def fnlist_rappend(xs, ys):
    while(xs.ctag > 0):
        x1 = xs.cons1
        xs = xs.cons2
        ys = fnlist_cons(x1, ys)
    return ys
def fnlist_reverse(xs):
    return fnlist_rappend(xs, fnlist_nil())
####################################################
def fnlist_foldleft(xs, ini, fopr_func):
    return \
        foreach_to_foldleft(fnlist_foreach)(xs, ini, fopr_func)
def fnlist_foldright(xs, ini, fopr_func):
    if xs.ctag == 0:
        return ini
    else:
        return fopr_func\
            (xs.cons1, fnlist_foldright(xs.cons2, ini, fopr_func))
    # end-of-(if-then-else)
# end-of-(fnlist_foldright(xs, ini, fopr_func))
####################################################
def fnlist_pylistize(xs):
    return foreach_to_pylistize(fnlist_foreach)(xs)
def fnlist_rpylistize(xs):
    return foreach_to_rpylistize(fnlist_foreach)(xs)
####################################################

def fnlist_make_pylist(xs): return pylist_fnlistize(xs)

def fnlist_filter_pylist(xs, test_func):
    return foreach_to_filter_pylist(fnlist_foreach)(xs, test_func)

###########################################################################

def pylist_foreach(xs, work_func):
    for x0 in xs:
        work_func(x0)
    return None # work_func(x0) is done for all x0 in xs

def pylist_rforeach(xs, work_func):
    for x0 in reversed(xs):
        work_func(x0)
    return None # work_func(i0) is done for all x0 in reversed(xs)

def pylist_make_map(xs, fopr_func):
    return foreach_to_map_pylist(pylist_foreach)(xs, fopr_func)
def pylist_map_pylist(xs, fopr_func):
    return foreach_to_map_pylist(pylist_foreach)(xs, fopr_func)

def pylist_make_filter(xs, test_func):
    return foreach_to_filter_pylist(pylist_foreach)(xs, test_func)
def pylist_filter_pylist(xs, test_func):
    return foreach_to_filter_pylist(pylist_foreach)(xs, test_func)

def pylist_fnlistize(xs):
    return foreach_to_rfnlistize(pylist_rforeach)(xs)

def pylist_foldleft(xs, r0, fopr_func):
    return foreach_to_foldleft(pylist_foreach)(xs, r0, fopr_func)
def pylist_foldright(xs, r0, fopr_func):
    return rforeach_to_foldright(pylist_rforeach)(xs, r0, fopr_func)

def pylist_make_fnlist(xs):
    ys = fnlist_rpylistize(xs); ys.reverse(); return ys

###########################################################################

def pylist_concat(xss):
    res = []
    pylist_foreach(xss, lambda xs: res.extend(xs))
    return res
def pylist_append(xs, ys):
    return pylist_concat([xs, ys])

###########################################################################

def pylist_iforeach(xs, iwork_func):
    return foreach_to_iforeach(pylist_foreach)(xs, iwork_func)

def pylist_make_imap(xs, ifopr_func):
    return iforeach_to_imap_pylist(pylist_iforeach)(xs, ifopr_func)
def pylist_imap_pylist(xs, ifopr_func):
    return iforeach_to_imap_pylist(pylist_iforeach)(xs, ifopr_func)

def pylist_make_ifilter(xs, itest_func):
    return iforeach_to_ifilter_pylist(pylist_iforeach)(xs, itest_func)
def pylist_ifilter_pylist(xs, itest_func):
    return iforeach_to_ifilter_pylist(pylist_iforeach)(xs, itest_func)

###########################################################################

def pylist_iminimum(xs):
    if not xs:
        return (-1, None)    
    imin = 0
    xmin = xs[0]
    for (i0, x1) in enumerate(xs[1:]):
        if x1 < xmin:
            xmin = x1
            imin = i0 + 1
    return (imin, xmin)

def pylist_imaximum(xs):
    if not xs:
        return (-1, None)    
    imax = 0
    xmax = xs[0]
    for (i0, x1) in enumerate(xs[1:]):
        if x1 > xmax:
            xmax = x1
            imax = i0 + 1
    return (imax, xmax)

###########################################################################

def string_foreach(xs, work_func):
    for x0 in xs:
        work_func(x0)
    return None # work_func(x0) is done for all x0 in xs
def string_rforeach(xs, work_func):
    for x0 in reversed(xs):
        work_func(x0)
    return None # work_func(i0) is done for all x0 in reversed(xs)

def string_foldleft(xs, r0, fopr_func):
    return foreach_to_foldleft(string_foreach)(xs, r0, fopr_func)
def string_foldright(xs, r0, fopr_func):
    return rforeach_to_foldright(string_rforeach)(xs, r0, fopr_func)

def string_pylistize(xs):
    return foreach_to_pylistize(string_foreach)(xs)
def string_rpylistize(xs):
    return foreach_to_rpylistize(string_foreach)(xs)

def string_make_pylist(xs): return "".join(xs)
def string_make_fnlist(xs): return "".join(fnlist_pylistize(xs))

###########################################################################

def string_iforeach(xs, iwork_func):
    return foreach_to_iforeach(string_foreach)(xs, iwork_func)

def string_imap_fnlist(xs, ifopr_func):
    return iforeach_to_imap_fnlist(string_iforeach)(xs, ifopr_func)
def string_imap_pylist(xs, ifopr_func):
    return iforeach_to_imap_pylist(string_iforeach)(xs, ifopr_func)

def string_ifilter_pylist(xs, itest_func):
    return iforeach_to_ifilter_pylist(string_iforeach)(xs, itest_func)

###########################################################################

def forall_to_foreach(forall):
    def foreach(xs, work_func):
        def test_func(x0):
            work_func(x0)
            return True
        forall(xs, test_func)
        return None
    return foreach # forall-function is turned into foreach-function

###########################################################################

def foreach_to_forall(foreach):
    class FalseExn(Exception):
        def __init_(self):
            return None
    def forall(xs, test_func):
        def work_func(x0):
            if test_func(x0):
                return None
            else:
                raise FalseExn
        try:
            foreach(xs, work_func)
            return True
        except FalseExn:
            return False
    return forall # foreach-function is turned into forall-function

###########################################################################

def foreach_to_foldleft(foreach):
    def foldleft(xs, r0, fopr_func):
        res = r0
        def work_func(x0):
            nonlocal res
            res = fopr_func(res, x0)
            return None
        foreach(xs, work_func)
        return res
    return foldleft # foreach-function is turned into foldleft-function

def rforeach_to_foldright(rforeach):
    def foldright(xs, r0, fopr_func):
        res = r0
        def work_func(x0):
            nonlocal res
            res = fopr_func(x0, res)
            return None
        rforeach(xs, work_func)
        return res
    return foldright # foreach-function is turned into foldleft-function

###########################################################################

def foreach_to_iforeach(foreach):
    def iforeach(xs, iwork_func):
        i0 = 0
        def work_func(x0):
            nonlocal i0
            iwork_func(i0, x0)
            i0 = i0 + 1
            return None
        foreach(xs, work_func)
        return None
    return iforeach # foreach-function is turned into iforeach-function

###########################################################################

def foreach_to_iforall(foreach):
    class FalseExn(Exception):
        def __init_(self):
            return None
    def iforall(xs, itest_func):
        i0 = 0
        def work_func(x0):
            nonlocal i0
            if itest_func(i0, x0):
                i0 = i0 + 1
                return None
            else:
                raise FalseExn
        try:
            foreach(xs, work_func)
            return True
        except FalseExn:
            return False
    return iforall # foreach-function is turned into forall-function

###########################################################################

def foreach_to_ifoldleft(foreach):
    def ifoldleft(xs, r0, ifopr_func):
        i0 = 0
        res = r0
        def work_func(x0):
            nonlocal i0
            nonlocal res
            res = ifopr_func(res, i0, x0)
            i0 = i0 + 1
            return None
        foreach(xs, work_func)
        return res
    return ifoldleft # foreach-function is turned into foldleft-function

###########################################################################

def foreach_to_pylistize(foreach):
    def pylistize(xs):
        res = []
        def work_func(x0):
            nonlocal res
            res.append(x0)
            return None
        foreach(xs, work_func)
        return res
    return pylistize # foreach-function is turned into pylistize-function

def foreach_to_rpylistize(foreach):
    def rpylistize(xs):
        res = []
        def work_func(x0):
            nonlocal res
            res.append(x0)
            return None
        foreach(xs, work_func)
        res.reverse()
        return res
    return rpylistize # foreach-function is turned into rpylistize-function

###########################################################################

def foreach_to_rfnlistize(foreach):
    def rfnlistize(xs):
        res = fnlist_nil()
        def work_func(x0):
            nonlocal res
            res = fnlist_cons(x0, res)
            return None
        foreach(xs, work_func)
        return res
    return rfnlistize # foreach-function is turned into rfnlistize-function

###########################################################################

def foreach_to_map_pylist(foreach):
    def map_pylist(xs, fopr_func):
        res = []
        def work_func(x0):
            nonlocal res
            res.append(fopr_func(x0))
            return None
        foreach(xs, work_func)
        return res
    return map_pylist # foreach-function is turned into map_pylist-function

def foreach_to_map_fnlist(foreach):
    return \
        lambda xs, fopr_func: \
        fnlist_make_pylist(foreach_to_map_pylist(foreach)(xs, fopr_func))

def foreach_to_map_rfnlist(foreach):
    def map_rfnlist(xs, fopr_func):
        res = fnlist_nil()
        def work_func(x0):
            nonlocal res
            res = fnlist_cons(fopr_func(x0), res)
            return None
        foreach(xs, work_func)
        return res
    return map_rfnlist # foreach-function is turned into map_rfnlist-function

###########################################################################

def foreach_to_filter_pylist(foreach):
    def filter_pylist(xs, test_func):
        res = []
        def work_func(x0):
            nonlocal res
            if test_func(x0):
                res.append(x0)
            return None
        foreach(xs, work_func)
        return res
    return filter_pylist # foreach-function is turned into map_pylist-function

def foreach_to_filter_fnlist(foreach):
    return \
        lambda xs, test_func: \
        fnlist_make_pylist(foreach_to_filter_pylist(foreach)(xs, test_func))

###########################################################################

def iforeach_to_imap_pylist(iforeach):
    def imap_pylist(xs, ifopr_func):
        res = []
        def iwork_func(i0, x0):
            nonlocal res
            res.append(ifopr_func(i0, x0))
            return None
        iforeach(xs, iwork_func)
        return res
    return imap_pylist # foreach-function is turned into imap_pylist-function

def iforeach_to_imap_fnlist(iforeach):
    return \
        lambda xs, ifopr_func: \
        fnlist_make_pylist(iforeach_to_imap_pylist(iforeach)(xs, ifopr_func))

def iforeach_to_imap_rfnlist(iforeach):
    def imap_rfnlist(xs, ifopr_func):
        res = fnlist_nil()
        def iwork_func(i0, x0):
            nonlocal res
            res = fnlist_cons(ifopr_func(i0, x0), res)
            return None
        iforeach(xs, iwork_func)
        return res
    return imap_rfnlist # foreach-function is turned into imap_rfnlist-function

###########################################################################

def iforeach_to_ifilter_pylist(iforeach):
    def ifilter_pylist(xs, itest_func):
        res = []
        def iwork_func(i0, x0):
            nonlocal res
            if itest_func(i0, x0):
                res.append(x0)
            return None
        iforeach(xs, iwork_func)
        return res
    return ifilter_pylist # foreach-function is turned into map_pylist-function

def iforeach_to_ifilter_fnlist(iforeach):
    return \
        lambda xs, itest_func: \
        fnlist_make_pylist(iforeach_to_ifilter_pylist(iforeach)(xs, itest_func))

###########################################################################
#
# HX-2023-03-21: Lazy-evaluation and streams
#
###########################################################################

class strcon:
    ctag = -1
    def get_ctag(self):
        return self.ctag
# end-of-class(strcon)

class strcon_nil(strcon):
    def __init__(self):
        self.ctag = 0
        return None
# end-of-class(strcon_nil)

class strcon_cons(strcon):
    def __init__(self, cons1, cons2):
        self.ctag = 1
        self.cons1 = cons1
        self.cons2 = cons2
        return None
    def get_cons1(self):
        return self.cons1
    def get_cons2(self):
        return self.cons2
# end-of-class(strcon_cons)

###########################################################################

def stream_foreach(fxs, work):
    while(True):
        cxs = fxs()
        if (cxs.ctag == 0):
            break
        else:
            work(cxs.cons1)
            fxs = cxs.cons2
        # end-of-(if(cxs.ctag==0)-then-else)
    return None # end-of-(stream_foreach)

def stream_get_at(fxs, i0):
    while(True):
        cxs = fxs()
        if (cxs.ctag == 0):
            raise IndexError
        else:
            if i0 <= 0:
                return cxs.cons1
            else:
                i0 = i0 - 1
                fxs = cxs.cons2
    return None # This is deadcode

###########################################################################

def stream_forall(fxs, test):
    return foreach_to_forall(stream_foreach)(fxs, test)

def stream_iforall(fxs, itest):
    return foreach_to_iforall(stream_foreach)(fxs, itest)

def stream_iforeach(fxs, iwork):
    return foreach_to_iforeach(stream_foreach)(fxs, iwork)

###########################################################################

def fnlist_streamize(xs):
    def helper(xs):
        if xs.ctag == 0:
            return strcon_nil()
        else:
            return \
                strcon_cons(xs.cons1, lambda: helper(xs.cons2))
        # end-of-(if(xs.ctag==0)-then-else)
    return lambda: helper(xs)

###########################################################################

def stream_tabulate(n0, fopr):
    def helper1(i0):
        return strcon_cons(fopr(i0), lambda: helper1(i0+1))
    def helper2(i0):
        if i0 >= n0:
            return strcon_nil()
        else:
            return strcon_cons(fopr(i0), lambda: helper2(i0+1))
        # end-of-(if(i0 >= n0)-then-else)
    if n0 < 0:
        return lambda: helper1(0)
    else:
        return lambda: helper2(0)
    # end-of-(if(n0 < 0)-then-else)
    
###########################################################################

def string_streamize(xs):
    return stream_tabulate(len(xs), lambda i0: xs[i0])
def pylist_streamize(xs):
    return stream_tabulate(len(xs), lambda i0: xs[i0])
def pytuple_streamize(xs):
    return stream_tabulate(len(xs), lambda i0: xs[i0])

###########################################################################

def stream_make_map(fxs, fopr):
    def helper(fxs):
        cxs = fxs()
        if cxs.ctag == 0:
            return strcon_nil()
        else:
            return strcon_cons\
                (fopr(cxs.cons1), lambda: helper(cxs.cons2))
        # end-of-(if(cxs.ctag==0)-then-else)
    return lambda: helper(fxs)

###########################################################################

def stream_make_filter(fxs, test):
    def helper(fxs):
        while(True):
            cxs = fxs()
            if cxs.ctag == 0:
                return strcon_nil()
            else:
                cx1 = cxs.cons1
                fxs = cxs.cons2
                if test(cx1):
                    return strcon_cons(cx1, lambda: helper(fxs))
            # end-of-(if(cxs.ctag==0)-then-else)
    return lambda: helper(fxs)

###########################################################################

import queue

###########################################################################

def gtree_bfs(nxs, fchlds):
    def helper(qnxs):
        if qnxs.empty():
            return strcon_nil()
        else:
            nx1 = qnxs.get()
            # print("gtree_bfs: helper: nx1 = ", nx1)
            for nx2 in fchlds(nx1):
                qnxs.put(nx2)
            return strcon_cons(nx1, lambda: helper(qnxs))
        # end-of-(if(qnxs.empty())-then-else)
    qnxs = queue.Queue()
    for nx1 in nxs:
        qnxs.put(nx1)
    return lambda: helper(qnxs)

###########################################################################

def gtree_dfs(nxs, fchlds):
    def helper(qnxs):
        if qnxs.empty():
            return strcon_nil()
        else:
            nx1 = qnxs.get()
            # print("gtree_dfs: helper: nx1 = ", nx1)
            for nx2 in reversed(fchlds(nx1)):
                qnxs.put(nx2)
            return strcon_cons(nx1, lambda: helper(qnxs))
        # end-of-(if(qnxs.empty())-then-else)
    qnxs = queue.LifoQueue()
    for nx1 in nxs:
        qnxs.put(nx1)
    return lambda: helper(qnxs)

###########################################################################

def graph_bfs(nxs, fnexts):
    visited = set()
    def helper(qnxs):
        if qnxs.empty():
            return strcon_nil()
        else:
            nx1 = qnxs.get()
            # print("gtree_bfs: helper: nx1 = ", nx1)
            for nx2 in fnexts(nx1):
                if not nx2 in visited:
                    qnxs.put(nx2)
                    visited.add(nx2)
            return strcon_cons(nx1, lambda: helper(qnxs))
        # end-of-(if(qnxs.empty())-then-else)
    qnxs = queue.Queue()
    for nx0 in nxs:
        qnxs.put(nx0)
        visited.add(nx1)
    return lambda: helper(qnxs)

###########################################################################

def graph_dfs(nxs, fnexts):
    visited = set()
    def helper(qnxs):
        if qnxs.empty():
            return strcon_nil()
        else:
            nx1 = qnxs.get()
            # print("gtree_dfs: helper: nx1 = ", nx1)
            for nx2 in reversed(fnexts(nx1)):
                if not nx2 in visited:
                    qnxs.put(nx2)
                    visited.add(nx2)
            return strcon_cons(nx1, lambda: helper(qnxs))
        # end-of-(if(qnxs.empty())-then-else)
    qnxs = queue.LifoQueue()
    for nx0 in nxs:
        qnxs.put(nx0)
        visited.add(nx1)
    return lambda: helper(qnxs)

###########################################################################

def gpath_bfs(nxs, fnexts):
    visited = set()
    def helper(qpths):
        if qpths.empty():
            return strcon_nil()
        else:
            pth1 = qpths.get()
            # print("gtree_bfs: helper: nx1 = ", nx1)
            for nx2 in fnexts(pth1[-1]):
                if not nx2 in visited:
                    visited.add(nx2)
                    qpths.put(pth1 + (nx2,))
            return strcon_cons(pth1, lambda: helper(qpths))
        # end-of-(if(qnxs.empty())-then-else)
    qpths = queue.Queue()
    for nx0 in nxs:
        visited.add(nx0)
        qpths.put(tuple([nx0]))
    return lambda: helper(qpths)

###########################################################################

######################### end of [mypylib-cls.py] #########################
