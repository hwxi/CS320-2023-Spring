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

fun
list_reduce_right
( xs: 'a list
, r0: 'r, fopr: 'a * 'r -> 'r): 'r =
(
case xs of
  nil => r0
| x1 :: xs =>
  fopr(x1, list_reduce_right(xs, r0, fopr))
)
  
(* ****** ****** *)

val
list_length =
fn(xs: 'a list) =>
list_reduce_left(0, xs, fn(r, x) => r + 1)

(* ****** ****** *)

val
list_append =
fn(xs: 'a list, ys: 'a list) =>
list_reduce_right(xs, ys, fn(x, r) => x :: r)

(* ****** ****** *)

val
list_rappend =
fn(xs: 'a list, ys: 'a list) =>
list_reduce_left(xs, ys, fn(r, x) => x :: r)
val
list_reverse =
fn(xs: 'a list) =>
list_reduce_left(xs, nil, fn(r, x) => x :: r)

(* ****** ****** *)

val
list_map =
fn(xs: 'a list, f0: 'a -> 'b) =>
list_reduce_right(xs, nil, fn(x, r) => f0(x) :: r)

(* ****** ****** *)

(* end of [CS320-2023-Spring-lectures-list_reduce.sml] *)
