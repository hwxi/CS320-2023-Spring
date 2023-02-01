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

(* end of [CS320-2023-Spring-lecture-list_qsort.sml] *)
