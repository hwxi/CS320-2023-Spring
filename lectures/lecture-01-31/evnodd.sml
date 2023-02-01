(* ****** ****** *)
(*
HX-2023-01-31:
Mutual recursion
*)
(* ****** ****** *)
(*
fun
isevn(x: int): bool =
if x <= 0
then true else isodd(x-1)
and
isodd(x: int): bool =
if x <= 0
then false else isevn(x-1)
*)
(* ****** ****** *)

fun
isevn(x: int): bool =
let
fun
isodd(x: int): bool =
if x <= 0 then false else isevn(x-1)
in(*in-of-let*)
  if x <= 0 then true else isodd(x-1)
end (*end-of-let*)

(* ****** ****** *)

(* end of [envodd.sml] *)
