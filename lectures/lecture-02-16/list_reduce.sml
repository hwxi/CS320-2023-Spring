(* ****** ****** *)

fun
list_reduce_left
( xs: 'a list, r0: 'r
, fopr: 'r * 'a -> 'r): 'r =
(
case xs of
  nil => r0
| x1 :: xs =>
  list_reduce_left(xs, fopr(r0, x1), fopr)
)

(* ****** ****** *)
val
list_reverse =
fn(xs: 'a list) =>
list_reduce_left(xs, nil, fn(r, x) => x :: r)
(* ****** ****** *)
val
list_reduce_right =
fn(xs, r0, fopr) =>
list_reduce_left
(list_reverse(xs), r0, fn(r, x) => fopr(x, r))
(* ****** ****** *)

(* end of [CS320-2023-Spring-lectures-list_reduce.sml] *)
