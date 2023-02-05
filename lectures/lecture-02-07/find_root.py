# (* ****** ****** *)

# fun
# find_root
# (f0: int -> int): int =
# let
# exception ZERO of int
# fun
# loop(i: int): int =
# if
# f0(i) != 0
# then loop(i+1) else raise ZERO(i) 
# in
#   loop(0) handle ZERO(i) => i
# end

################################################

def find_root(f0):
    class Zero(Exception):
        def __init__(self, arg1):
            self.arg1 = arg1
    def loop(i):
        if (f0(i) != 0):
            return loop(i+1)
        else:
            raise Zero(i)
    try:
        loop(0)
    except Zero as exn:
        return exn.arg1

print("root(x*x-x-10100) = ", find_root(lambda x: x*x - x - 10100));
################################################

## end of [BUCASCS320-2023-Spring-find_root.sml] ##
