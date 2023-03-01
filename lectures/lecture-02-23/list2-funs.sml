(* ****** ****** *)

use
"./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)
(*
Some combinators for handling two lists
*)
(* ****** ****** *)

fun
list2_zip
( xs: 'a list
, ys: 'b list): ('a*'b) list =
(
case xs of
  nil => nil
| x1 :: xs =>
  (
  case ys of
    nil => nil
  | y1 :: ys =>
    (x1, y1) :: list2_zip(xs, ys))
) (* end of [list2_zip(xs, ys)]: case *)

(* ****** ****** *)

fun
list2_feq
( xs: 'a list
, ys: 'a list
, feq: 'a * 'a -> bool): bool =
list_forall
(list2_zip(xs, ys), fn(x, y) => feq(x, y))

(* ****** ****** *)

fun
list_enumerate
(xs: 'a list): (int * 'a) list =
list2_zip(int1_listize(list_length(xs)), xs)

(* ****** ****** *)

(*
HX: Row-major
*)
fun
list2_cross_row
( xs: 'a list
, ys: 'b list): ('a*'b) list =
list_concat
(list_map(xs, fn(x0) => list_map(ys, fn(y0) => (x0, y0))))

(* ****** ****** *)

(*
HX: Column-major
*)
fun
list2_cross_col
( xs: 'a list
, ys: 'b list): ('a*'b) list =
list_concat
(list_map(ys, fn(y0) => list_map(xs, fn(x0) => (x0, y0))))

(* ****** ****** *)

(* end of [CS320-2023-Spring-lectures-list2-funs.sml] *)
