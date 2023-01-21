(* ****** ****** *)
use "./../../mysmlib/mysmlib.sml";
(* ****** ****** *)

fun fact(x: int): int option =
let
  fun
  loop(i: int, r: int): int =
  if i <= x then loop(i+1, i*r) else r
in
  SOME(loop(1, 1)) handle Overflow => NONE
end

(* ****** ****** *)

val fact10 = fact(10)

(* ****** ****** *)

(* end of [BUCASCS320-2023-Spring-fact_part.sml] *)
