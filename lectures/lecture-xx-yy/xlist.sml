(* ****** ****** *)
use "./third-order.sml";
(* ****** ****** *)

datatype 'a xlist =
xlist_nil
|
xlist_cons of ('a * 'a xlist)
|
xlist_snoc of ('a xlist * 'a)
|
xlist_append of ('a xlist * 'a xlist)
|
xlist_reverse of ('a xlist)

(* ****** ****** *)

fun
xlist_foreach
(xs: 'a xlist, work: 'a -> unit): unit =
(
case xs of
  xlist_nil => ()
| xlist_cons(x1, xs) =>
  (work(x1); xlist_foreach(xs, work))
| xlist_snoc(xs, x1) =>
  (xlist_foreach(xs, work); work(x1))
| xlist_append(ys, zs) =>
  (xlist_foreach(ys, work);
   xlist_foreach(zs, work))
| xlist_reverse(ys) => xlist_rforeach(ys, work)
)

and
xlist_rforeach
(xs: 'a xlist, work: 'a -> unit): unit =
case xs of
  xlist_nil => ()
| xlist_cons(x1, xs) =>
  (xlist_rforeach(xs, work); work(x1))
| xlist_snoc(xs, x1) =>
  (work(x1); xlist_rforeach(xs, work))
| xlist_append(ys, zs) =>
  (xlist_rforeach(zs, work);
   xlist_rforeach(ys, work))
| xlist_reverse(ys) => xlist_foreach(ys, work)

(* ****** ****** *)

val
xlist_forall =
fn(xs,test) =>
foreach_to_forall(xlist_foreach)(xs,test)

(* ****** ****** *)

val
xlist_length =
fn(xs) => foreach_to_length(xlist_foreach)(xs)

(* ****** ****** *)

val
xlist_listize =
fn(xs) =>
  foreach_to_rlistize(xlist_rforeach)(xs)
val
xlist_rlistize =
fn(xs) => foreach_to_rlistize(xlist_foreach)(xs)

(* ****** ****** *)
val xlist_get_at =
fn(xs, i0) =>
  foreach_to_get_at(xlist_foreach)(xs,i0)
val xlist_rget_at =
fn(xs, i0) =>
  foreach_to_get_at(xlist_rforeach)(xs,i0)
(* ****** ****** *)
val
xlist_foldleft =
fn(r0,xs,fopr) =>
  foreach_to_foldleft(xlist_foreach)(r0,xs,fopr)
val
xlist_foldright =
fn(xs,r0,fopr) =>
  foreach_to_foldleft(xlist_rforeach)(r0,xs,fopr)
(* ****** ****** *)

val xs = xlist_nil
val xs = xlist_cons(1, xs)
val xs = xlist_cons(2, xs)
val xs = xlist_snoc(xs, 3)
val xs = xlist_snoc(xs, 4)
val xs = xlist_reverse(xs)
val xs = xlist_append(xs, xs)
val xs_list = xlist_listize(xs)
val xs_rlist = xlist_rlistize(xs)

(* ****** ****** *)

val x0 = xlist_get_at(xs, 0)
val x1 = xlist_get_at(xs, 1)
val x2 = xlist_get_at(xs, 2)
val x3 = xlist_get_at(xs, 3)
val x4 = xlist_get_at(xs, 4)
val x5 = xlist_get_at(xs, 5)

val x0_r = xlist_rget_at(xs, 0)
val x1_r = xlist_rget_at(xs, 1)

(* ****** ****** *)
val x10 =
SOME(xlist_get_at(xs, 10)) handle Subscript => NONE
(* ****** ****** *)

val len0 = xlist_length(xs)
val all1 = xlist_forall(xs, fn(x:int) => x < 5)
val all2 = xlist_forall(xs, fn(x:int) => x >= 1)
val all3 = xlist_forall(xs, fn(x:int) => x >= 2)

(* ****** ****** *)

(* end of [CS320-2023-Spring-lectures-xlist.sml] *)
