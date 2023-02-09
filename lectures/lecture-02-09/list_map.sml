(* ****** ****** *)

fun
list_map
(xs: 'a list, fopr: 'a -> 'b): 'b list =
(
case xs of
  nil => nil
| x1 :: xs => fopr(x1) :: list_map(xs, fopr)
)

(* ****** ****** *)

(* end of [CS320-2023-Spring-lectures-list_map.sml] *)
