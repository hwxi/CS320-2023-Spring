(* ****** ****** *)
(*
Assign02: FP in Python
*)
(* ****** ****** *)
(*
use "./assign02-lib.sml";
*)
(* ****** ****** *)

fun
list_append
(xs: 'a list, ys: 'a list): 'a list =
(
case xs of
  nil => ys
| x1 :: xs => x1 :: list_append(xs, ys)
)

(* ****** ****** *)

fun
list_rappend
(xs: 'a list, ys: 'a list): 'a list =
(
case xs of
  nil => ys
| x1 :: xs => list_rappend(xs, x1 :: ys)
)

(* ****** ****** *)
fun
list_reverse
(xs: 'a list): 'a list = list_rappend(xs, [])
(* ****** ****** *)

fun
list_quicksort
(xs: int list): int list =
let
(* ****** ****** *)
fun
qsort(xs: int list): int list =
(
case xs of
nil => nil
|
x1 :: xs =>
let
val (ys, zs) = qpart(xs, x1)
val ys = qsort(ys) and zs = qsort(zs)
in
  ys @ [x1] @ zs
end
)
(* ****** ****** *)
and
qpart
(xs: int list, p0: int): int list * int list =
(
case xs of
nil => (nil, nil)
|
x1 :: xs =>
let
val (ys, zs) = qpart(xs, p0)
in
  if x1 <= p0 then (x1 :: ys, zs) else (ys, x1 :: zs)
end
)
(* ****** ****** *)
in
  qsort(xs)
end (* end-of-[list_quicksort]: let *)

(* ****** ****** *)

fun
list_mergesort
(xs: int list): int list =
let

fun
split
(xs: int list): int list * int list =
(
case xs of
  nil => ([], [])
| x1 :: xs =>
(
  case xs of
    nil => ([x1], [])
  | x2 :: xs =>
    let
      val
      (ys, zs) = split(xs)
    in
      (x1 :: ys, x2 :: zs)
    end
)
)

fun merge
( ys: int list
, zs: int list): int list =
(
case ys of
  nil => zs
| y1 :: ys =>
(
  case zs of
    nil => y1 :: ys
  | z1 :: zs =>
    if y1 <= z1
    then y1 :: merge(ys, z1 :: zs)
    else z1 :: merge(y1 :: ys, zs)
)
)

in

case xs of
  nil => []
| x1 :: xs =>
(
  case xs of
    nil => [x1]
  | x2 :: xs =>
    let
      val (ys, zs) = split(xs)
    in
      merge(list_mergesort(x1 :: ys), list_mergesort(x2 :: zs))
    end
)

end (* end-of-[list_mergesort]: let *)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign02.sml] *)
