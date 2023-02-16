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

(* end of [CS320-2023-Spring-lectures-list2-funs.sml] *)
