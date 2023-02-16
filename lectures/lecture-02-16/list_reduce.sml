(* ****** ****** *)

fun
list_reduce_left
( r0: 'r, xs: 'a list
, fopr: 'r * 'a -> 'r): 'r =
(
case xs of
  nil => r0
| x1 :: xs =>
  list_reduce_left(fopr(r0, x1), xs, fopr)
)

(* ****** ****** *)
val
list_reverse =
fn(xs: 'a list) =>
list_reduce_left(nil, xs, fn(r, x) => x :: r)
(* ****** ****** *)
val
list_reduce_right =
fn(xs, r0, fopr) =>
list_reduce_left
(r0, list_reverse(xs), fn(r, x) => fopr(x, r))
(* ****** ****** *)

(* end of [CS320-2023-Spring-lectures-list_reduce.sml] *)
