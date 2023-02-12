(* ****** ****** *)
use
"./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

fun
forall_to_foreach
( forall
: ('xs * ('x0 -> bool)) -> bool
)
: ('xs * ('x0 -> unit)) -> unit =
fn(xs: 'xs, work: 'x0 -> unit) =>
let
val _ =
forall
(xs, fn(x0: 'x0) => (work(x0); true))
in
  ( (*void*) )
end (* end of [forall_to_foreach]: let *)

(* ****** ****** *)

fun
foreach_to_forall
( foreach
: ('xs * ('x0 -> unit)) -> unit
)
: ('xs * ('x0 -> bool)) -> bool =
fn(xs: 'xs, test: 'x0 -> bool) =>
let
  exception False
in(*let*)
(* ****** ****** *)
let
val () =
foreach
(
xs
,
fn(x0: 'x0) =>
if
test(x0) then () else raise False)
in
  ( true )
end handle False(*void*) => (false)
(* ****** ****** *)
end (* end of [foreach_to_forall]: let *)

(* ****** ****** *)

val
list_forall =
fn(xs, test) =>
foreach_to_forall(list_foreach)(xs, test)

(* ****** ****** *)

fun
foreach_to_foldleft
( foreach
: ('xs * ('x0 -> unit)) -> unit
)
: ('r0 * 'xs * ('r0*'x0 -> 'r0)) -> 'r0 =
fn(r0, xs, fopr) =>
let
val res = ref(r0)
in
foreach
( xs
, fn(x0) => res := fopr(!res, x0)); !res
end (* end of [foreach_to_foldleft]: let *)

(* ****** ****** *)

val
list_foldleft =
fn(r0,xs,fopr) =>
foreach_to_foldleft(list_foreach)(r0,xs,fopr)

(* ****** ****** *)

fun
foreach_to_length
(
foreach:
('xs*('x0->unit))->unit): 'xs -> int =
fn(xs) =>
(foreach_to_foldleft
 (foreach)(0, xs, fn(r0, x0) => r0 + 1))

(* ****** ****** *)

fun
foreach_to_get_at
(
foreach:
('xs*('x0->unit))->unit): 'xs*int -> 'x0 =
fn(xs, i0) =>
let
exception Found of ('x0)
val foldleft = foreach_to_foldleft(foreach)
in (*let*)
(* ****** ****** *)
let
val r0 =
foldleft
( 0, xs
, fn(r0, x0) =>
  if i0 = r0 then
  raise Found(x0) else r0+1) in raise Subscript
end handle Found(x0) => x0
(* ****** ****** *)
end (* end-of-[foreach_to_get_at]: let *) 

(* ****** ****** *)

fun
foreach_to_listize
(
foreach:
('xs*('x0->unit))->unit): 'xs -> 'x0 list =
(
fn(xs) =>
list_reverse
(
foreach_to_foldleft
(foreach)(nil, xs, fn(r0, x0) => x0 :: r0)))

(* ****** ****** *)

fun
foreach_to_rlistize
(
foreach:
('xs*('x0->unit))->unit): 'xs -> 'x0 list =
fn(xs) =>
(foreach_to_foldleft
 (foreach)(nil, xs, fn(r0, x0) => x0 :: r0))

(* ****** ****** *)

val
list_rlistize =
fn(xs) => foreach_to_rlistize(list_foreach)(xs)

(* ****** ****** *)

(* end of [CS320-2023-Spring-lectures-third-order.sml] *)
