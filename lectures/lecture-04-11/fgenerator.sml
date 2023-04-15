(* ****** ****** *)

use "./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

exception StopIteration

(* ****** ****** *)

fun
fgenerator
(fxs: 'a stream): (unit -> 'a) =
let
  val r0 = ref(fxs)
in
fn() =>
(
  case (!r0)() of
    strcon_nil => raise StopIteration
  | strcon_cons(x1, fxs) => (r0 := fxs; x1)
)
end

(* ****** ****** *)

val gxs = (* generating squares *)
fgenerator(stream_tabulate(2, fn i => i * i))

(* ****** ****** *)

(* end of [CS320-2023-Spring-lectures-fgenerator.sml] *)
