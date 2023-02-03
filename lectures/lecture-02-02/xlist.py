# datatype 'a xlist =
# xlist_nil
# |
# xlist_cons of ('a * 'a xlist)
# |
# xlist_snoc of ('a xlist * 'a)
# |
# xlist_append of ('a xlist * 'a xlist)
# |
# xlist_reverse of ('a xlist)

class xlist:
    def get_ctag():
        return self.ctag
# end-of-class(myxlist)

class xlist_nil(xlist):
    def __init__(self):
        self.ctag = 0
        return None

class xlist_cons(xlist):
    def __init__(self, cons1, cons2):
        self.ctag = 1
        self.cons1 = cons1
        self.cons2 = cons2
        return None

class xlist_snoc(xlist):
    def __init__(self, snoc1, snoc2):
        self.ctag = 2
        self.snoc1 = snoc1
        self.snoc2 = snoc2
        return None

class xlist_append(xlist):
    def __init__(self, append1, append2):
        self.ctag = 3
        self.append1 = append1
        self.append2 = append2
        return None

class xlist_reverse(xlist):
    def __init__(self, reverse1):
        self.ctag = 4
        self.reverse1 = reverse1
        return None
