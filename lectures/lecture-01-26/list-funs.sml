(* ****** ****** *)
(*
List-values
*)
(* ****** ****** *)
(*
datatype
'a list =
nil | cons of 'a * 'a list
*)

(*
option is a type-constructor:
it is used to construct types

type intopt = int option
type stringopt = string option
*)

(* ****** ****** *)

val lst1 = nil
val lst2 = 1 :: nil
val lst3 = 1 :: 2 :: nil

(* ****** ****** *)

fun
listlen(xs: 'a list): int =
(
case xs of
nil => 0 | _ :: xs => 1 + listlen(xs)
)

(* ****** ****** *)

(* end of [BUCASCS320-2023-Spring-list-funs.sml] *)
