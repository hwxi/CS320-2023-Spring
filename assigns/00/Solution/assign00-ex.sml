(* ****** ****** *)
(*
HX-2023-01-20:
Here is a sample of function
implementation.
*)
(* ****** ****** *)
(*
HX-2023-01-20:
Make use of the library functions
for Assign00.
*)
use "./../assign00-lib.sml";
(* ****** ****** *)

fun
strapp
(xs: string)
(ys: string): string =
let
val nx = strlen(xs)
fun helper(i0: int): string =
if i0 >= nx then ys else str(strsub(xs, i0)) ^ helper(i0+1)
in
  helper(0)
end (* end-of-[fun strapp] *)

(* ****** ****** *)

val abcde = strapp "ab" "cde"

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign00-ex.sml] *)