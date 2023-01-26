(*
Option-values
*)

(*
datatype
'a option =
NONE | SOME of (a)
*)

(*
option is a type-constructor:
it is used to construct types

type intopt = int option
type stringopt = string option
*)

(* ****** ****** *)

type 'a optn = 'a option

(* ****** ****** *)

val opt1 = NONE
val opt2 = SOME(1)

(* ****** ****** *)

fun
mydiv
(x: int, y: int): int optn =
if y <> 0 then SOME(x div y) else NONE

(* ****** ****** *)

(* end of [BUCASCS320-2023-Spring-optn-funs.sml] *)
