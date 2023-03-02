(* ****** ****** *)
(*
HX-2023-03-02: midterm-05: 20 points
//
No other library functions are allowed
for solving this problem. Not even those
in the library for this class are allowed.
//
*)
(* ****** ****** *)
datatype 'a bintr =
LEAF of 'a | NODE of 'a bintr * 'a bintr
(* ****** ****** *)

(*
HX-2023-03-01: 20 points
The following function is essentially
the same as mapt given on slide 16 in
SLIDE/Summary-SMLNJ.pdf
*)
val
bintr_fold =
fn
( t0: 'a bintr
, fleaf: 'a -> 'r
, fnode: 'r * 'r -> 'r) =>
let
(* ****** ****** *)
val
rec
fold =
fn(t0) =>
case t0 of
LEAF(x0) => fleaf(x0)
|
NODE(tl, tr) =>
fnode(fold(tl), fold(tr))
(* ****** ****** *)
in
  fold(t0)
end (* end of [bintr_fold(t0, fleaf, fnode)] *)

(* ****** ****** *)

val
int_max =
fn(x, y) => if x >= y then x else y

(* ****** ****** *)

(*
Here are some examples that are based
on the bintr_fold combinator
*)

val
bintr_size =
fn(t0) =>
bintr_fold
( t0
, fn _ => 1
, fn(tl, tr) => tl + tr)

val
bintr_height =
fn(t0) =>
bintr_fold
( t0
, fn _ => 1
, fn(tl, tr) => 1+int_max(tl,tr))

(* ****** ****** *)

(*
//
HX-2023-03-01:
//
The following recursive function
[bintr_balanced_rec] checks whether
a given bintr is perfectly balanced.
//
LEAF(x) is perfectly balanced.
NODE(tl, tr) is perfectly balanced if
(1) tl is perfectly balanced, and
(2) tr is perfectly balanced, and
(3) tl and tr are of the same size (or height)
*)

(* ****** ****** *)
(*
//
Here is a recursive implementation that
checks if a given bintr is perfectly balanced
//
fun
bintr_balanced_rec
(t0: 'a bintr): bool =
(
case t0 of
LEAF _ => true
|
NODE(tl, tr) =>
bintr_balanced_rec(tl)
andalso bintr_balanced_rec(tr)
andalso bintr_size(tl) = bintr_size(tr)
)
*)
(* ****** ****** *)

(*
val
bintr_balanced_nonrec = fn(t0: 'a bintr) => ...
*)

(* ****** ****** *)

(*
Some testing code:
val t0 = LEAF(0)
val t1 = NODE(t0, t0)
val t2 = NODE(t1, t1)
val t3 = NODE(t2, t2)
(* ans1 = true *)
val ans1 = bintr_balanced_nonrec(t3)
(* ans2 = false *)
val ans2 = bintr_balanced_nonrec(NODE(t2, t3))
*)

(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm1-balance_test_nonrec.sml] *)
