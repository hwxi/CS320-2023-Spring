(* ****** ****** *)
open SMLofNJ.Cont
(* ****** ****** *)

fun
foreach_to_forall
( foreach
: ('xs * ('x0 -> unit)) -> unit
)
: ('xs * ('x0 -> bool)) -> bool =
fn(xs: 'xs, test: 'x0 -> bool) =>
callcc
(
fn ret =>
(
foreach
(
xs
,
fn(x0: 'x0) =>
if
test(x0)
then () else throw ret false); true)
) (*callcc*) (*end of [foreach_to_forall] *)

(* ****** ****** *)

(* End of [CS320-2023-Spring-lectures-foreach_to_forall.sml] *)
