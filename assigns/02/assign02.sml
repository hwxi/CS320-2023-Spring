(* ****** ****** *)
(*
Assign01: Onward!
*)
(* ****** ****** *)
use "./assign02-lib.sml";
(* ****** ****** *)

datatype 'a btree =
btree_nil
|
btree_cons of ('a btree * 'a * 'a btree)

(* ****** ****** *)

(*
fun btree_size(xs: 'a btree): int
fun btree_height(xs: 'a btree): int
*)

(* ****** ****** *)
(*
fun
btree_flatten(xs: 'a btree): 'a list
*)
(* ****** ****** *)

(*
fun btree_is_AVL(xs: 'a btree): bool
fun btree_is_Braun(xs: 'a btree): bool
*)

(* ****** ****** *)

(*
fun btree_is_search(xs: int btree): bool
*)

(* ****** ****** *)

(*
fun list_to_btree(xs: 'a list): 'a btree
*)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign02.sml] *)
