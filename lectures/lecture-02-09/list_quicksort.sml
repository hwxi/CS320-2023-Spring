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

val xs = [2, 5, 4, 3, 0, 1, 6, 7, 9, 8]
val ys = list_quicksort(xs)

(* ****** ****** *)

fun
list_quicksort
( xs: 'a list
, cmp: 'a * 'a -> int): 'a list =
let
(* ****** ****** *)
fun
qsort(xs: 'a list): 'a list =
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
(xs: 'a list, p0: 'a): 'a list * 'a list =
(
case xs of
nil => (nil, nil)
|
x1 :: xs =>
let
val (ys, zs) = qpart(xs, p0)
in
  if
  (cmp(x1, p0) <= 0)
  then (x1 :: ys, zs) else (ys, x1 :: zs)
end
)
(* ****** ****** *)
in
  qsort(xs)
end (* end-of-[list_quicksort]: let *)

(* ****** ****** *)

fun
int_cmp
(x: int, y: int): int = (x - y)
fun
string_cmp
(x: string, y: string): int =
if x <= y then (if x = y then 0 else ~1) else 1

(* ****** ****** *)

val xs1 = [2, 5, 4, 3, 0, 1, 6, 7, 9, 8]
val ys1 = list_quicksort(xs1, int_cmp)

(* ****** ****** *)

val xs2 =
["2", "5", "4", "3", "0", "1", "6", "7", "9", "8"]
val ys2 = list_quicksort(xs2, string_cmp)

(* ****** ****** *)

(* end of [CS320-2023-Spring-lectures-list_quicksort.sml] *)
