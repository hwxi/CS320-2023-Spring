(* ****** ****** *)
(*
Assign01: Onward!
*)
(* ****** ****** *)
use "./assign01-lib.sml";
(* ****** ****** *)

datatype 'a xlist =
xlist_nil
|
xlist_cons of ('a * 'a xlist)
|
xlist_snoc of ('a xlist * 'a)
|
xlist_append of ('a xlist * 'a xlist)
|
xlist_reverse of ('a xlist)

(* ****** ****** *)

fun
list_of_xlist(xs: 'a xlist): 'a list =
(
case xs of
xlist_nil => []
|
xlist_cons(x1, xs) => x1 :: list_of_xlist(xs)
|
xlist_snoc(xs, x1) => list_of_xlist(xs) @ [x1]
|
xlist_append(xs, ys) => list_of_xlist(xs) @ list_of_xlist(ys)
|
xlist_reverse(xs) => list_reverse(list_of_xlist(xs))
)

(* ****** ****** *)

(*
//
Assign01-01: 10 points
//
Please implement a function
that computes the length of an xlist DIRECTLY:
//
fun xlist_len(xs: 'a xlist): int
//
That is, you should NOT converts xlist into list
and then compute the length of the converted list
//
*)

(* ****** ****** *)

(*
//
Assign01-02: 10 points
//
Please implement a function
that does subscripting on xlist DIRECTLY:
//
fun xlist_sub(xs: 'a xlist, i0: int): 'a
//
If 'i0' is an illegal index, then xlist_sub
should raise the Subscript exception.
//
You should NOT converts xlist into list
and then compute the length of the converted list
//
*)

(* ****** ****** *)

(*
//
Assign01-03: 10 points
//
Please implement a function that converts a given
xlist 'xs' into another xlist 'ys' by removing the
constructor 'mylist_reverse':
//
fun xlist_remove_reverse(xs: 'a xlist): 'a xlist
//
In particular, your implementation should guarantee:
1. 'xs' and 'ys' represent the same list
2. 'ys' does NOT make any use of 'mylist_reverse'
3. 'xs' and 'ys' use the same number of 'mylist_append'
//
*)
  
(* ****** ****** *)

(*
//
Assign01-04: 20 points
//
Please implement a function that checks DIRECTLY
if a given int xlist is sorted/ordered ascendingly:
//
fun xlist_sortedq(xs: int xlist): bool
//
You should NOT converts xlist into list
and then check whether the converted list is sorted.
//
*)
  
(* ****** ****** *)

(* end of [CS320-2023-Spring-assign01.sml] *)
