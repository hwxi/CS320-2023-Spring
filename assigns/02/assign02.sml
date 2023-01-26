(* ****** ****** *)
(*
Assign01: Onward!
*)
(* ****** ****** *)
use "./assign02-lib.sml";
(* ****** ****** *)

(*
//
Assign01-05: 20 points
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
