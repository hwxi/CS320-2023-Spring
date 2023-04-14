(* ****** ****** *)

open SMLofNJ.Cont

(* ****** ****** *)
(*
HX-2023-04-13:
This example shows a way to
use callcc to do what is typically
done via exceptions.
*)
(* ****** ****** *)

fun
kmult(xs: int list): int =
let
fun
helper
(xs, ret) =
(
case xs of
nil => 1
|
x1 :: xs =>
if x1 = 0
then throw ret 0
else x1 * helper(xs, ret)
)
in
callcc(fn ret => helper(xs, ret))
end

(* ****** ****** *)

(* end of [CS320-2023-Spring-lectures-kmult.sml] *)