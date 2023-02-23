(* ****** ****** *)

fun
quiz02_02
(xs: int list, ys: int list) =
list_exists
(xs, fn(x) => list_exists(ys, y => abs(x-y) < 10

(* ****** ****** *)

fun
quiz02_03
(xs: int list, ys: int list) =
list_forall
(xs, fn(x) => list_forall(ys, y => abs(x-y) < 10

(* ****** ****** *)

(* end of [CS320-2023-Spring-lectures-list2_cross.sml] *)
