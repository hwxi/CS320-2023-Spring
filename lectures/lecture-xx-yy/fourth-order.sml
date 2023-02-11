(* ****** ****** *)
use
"./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

type
('xs, 'x0)
foreach_to_forall_t =
( ('xs * ('x0 -> unit)) -> unit )
->
( ('xs * ('x0 -> bool)) -> bool )

(* ****** ****** *)

(* end of [CS320-2023-Spring-lectures-fourth-order.sml] *)
