######################################################
def mylist_make(n):
    """
    This function is O(n^2)-time. It demonstrates
    the very need to avoid using the 'insert' method.
    """
    result = []
    for i in range(n):
        result.insert(0, i)
    return result
######################################################
N = 1000000
mylist_make(N) # It would take too long to return
######################################################
