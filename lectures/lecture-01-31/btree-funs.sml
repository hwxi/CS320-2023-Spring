(* ****** ****** *)

datatype 'a btree =
btree_nil
|
btree_cons of
('a btree * 'a * 'a btree)

(* ****** ****** *)

fun
max
(a: int, b: int): int =
(if a >= b then a else b)
fun
min
(a: int, b: int): int =
(if a <= b then a else b)

(* ****** ****** *)

fun
btree_size(xs: 'a btree): int =
(
case xs of
btree_nil => 0
|
btree_cons(tl, x0, tr) =>
btree_size(tl) + 1 + btree_size(tr)
)

(* ****** ****** *)

fun
btree_height(xs: 'a btree): int =
(
case xs of
btree_nil => 0
|
btree_cons(tl, x0, tr) =>
1 + max(btree_height(tl), btree_height(tr))
)

(* ****** ****** *)

(* end of [CS320-2023-Spring-lecture-btree-funs.sml] *)
