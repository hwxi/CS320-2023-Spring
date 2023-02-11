(* ****** ****** *)

fun
forall_to_foreach
( forall
: ('xs * ('x0 -> bool)) -> bool
)
: ('xs * ('x0 -> unit)) -> unit =
fn(xs: 'xs, work: 'x0 -> unit) =>
let
val _ =
forall(xs, fn(x0: 'x0) => (work(x0); true)) in ()
end

(* ****** ****** *)

fun
foreach_to_forall
( foreach
: ('xs * ('x0 -> unit)) -> unit
)
: ('xs * ('x0 -> bool)) -> bool =
fn(xs: 'xs, test: 'x0 -> bool) =>
let
  exception Done
in(*let*)
(* ****** ****** *)
let
val () =
foreach
(xs, fn(x0: 'x0) =>
if
test(x0)
then raise Done else ())
in
  false
end handle Done(*void*) => true
(* ****** ****** *)
end (* end of [foreach_to_forall]: let *)

(* ****** ****** *)

(* end of [CS320-2023-Spring-lectures-thrid-order.sml] *)