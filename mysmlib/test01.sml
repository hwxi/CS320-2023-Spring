(*##############################################################*)
use "./mysmlib-cls.sml";
(*##############################################################*)

val xs =
[0,1,2,3,4]
val ys =
foreach_to_map_list
(list_foreach)(xs, fn x => x + 1)

val
list_iforeach =
fn(xs, work) =>
foreach_to_iforeach(list_foreach)(xs, work)

val xs = [0,1,2,3,4]
val ys =
foreach_to_map_list(list_iforeach)(xs, fn (i, x) => (i, x*x))

(*##############################################################*)

(* end of [CS320-2023-Spring-mysmlib-test01.sml] *)

(*##############################################################*)