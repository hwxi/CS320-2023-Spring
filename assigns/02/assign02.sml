(* ****** ****** *)
(*
Assign01: Onward!
*)
(* ****** ****** *)
use "./assign02-lib.sml";
(* ****** ****** *)

(*
Assign02-01: 10 points
fun add3(x: int): int = x+3
Note that 'add3' is a partial function:
it overflows when x becomes very large. Please
find the least integer N such that add3 overflows,
that is, 'add3_overflow' should return the least integer
N such that add3(N) raises Overflow.
fun add3_overflow(): int
Your implementation should be based on a form of binary search
it must be efficient; it cannot take more that one-tenth of one
second to finish on your own machine.
*)

(* ****** ****** *)

(*
//
Assign02-02: 10 points
//
Please implement a function that checks DIRECTLY
if a given int xlist is sorted/ordered ascendingly:
//
fun xlist_sortedq(xs: int xlist): bool
//
You should NOT convert xlist into list
and then check whether the converted list is sorted.
//
*)

(* ****** ****** *)

(*
//
Assign02-05: 20 points
//
// The permutations of 0,1,2 can be ordered
// according to the lexicographic ordering as follows:
//
// (0,1,2) < (0,2,1) < (1,0,2) < (1,2,0) < (2,0,1) < (2,1,0)
//
// This ordering can be readily generalized to the permutations
// of n numbers, which n is positive. Given a permutation xs of
// the first n natural numbers, next_permuation(xs) returns the next
// permutation following xs if it exists, and None0() otherwise.
//
// examples:
//
// permute_next_exn( [1,0,2] ) = [1,2,0]
// permute_next_exn( [2,1,0] ) = raise(LastPermExn)
// permute_next_exn( [2,10,3,8,4,1,0,6,9,7,5] ) = [2,10,3,8,4,1,0,7,5,6,9]
//
// permute_next_opt( [1,0,2] ) = Some0( [1,2,0] )
// permute_next_opt( [2,1,0] ) = None0()
// permute_next_opt( [2,10,3,8,4,1,0,6,9,7,5] ) = Some0( [2,10,3,8,4,1,0,7,5,6,9] )
//
*)
(*
//
exception LastPermExn
//
fun
permute_next_exn(xs: int list): int list
//
fun
permute_next_opt(xs: int list): (int list) optn
//
*)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign02.sml] *)
