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
(*
HX-2023-01-31: Mutual recursion
*)
(* ****** ****** *)

(*
HX-2023-01-31:
Finding the first element
(that is, head) of a given xlist
*)
fun
xlist_head
(xs: 'a xlist): 'a option =
(
case xs of
xlist_nil => NONE
|
xlist_cons(x1, xs) => SOME(x1)
|
xlist_snoc(xs, x1) =>
let
val res = xlist_head(xs)
in
  case res of NONE => SOME(x1) | _ => res
end
|
xlist_append(xs, ys) =>
let
val res = xlist_head(xs)
in
  case res of NONE => xlist_head(ys) | _ => res
end
|
xlist_reverse(xs) => xlist_last(xs)
)

(*
HX-2023-01-31:
Finding the last element
of a given xlist
*)
and
xlist_last
(xs: 'a xlist): 'a option =
(
case xs of
xlist_nil => NONE
|
xlist_cons(x1, xs) =>
let
val res = xlist_last(xs)
in
  case res of NONE => SOME(x1) | _ => res
end
|
xlist_snoc(xs, x1) => SOME(x1)
|
xlist_append(xs, ys) =>
let
val res = xlist_last(ys)
in
  case res of
  NONE => xlist_last(xs) | SOME _ => res
end
|
xlist_reverse(xs) => xlist_head(xs)
)

(* ****** ****** *)

fun
xlist_do_reverse
(xs: 'a xlist): 'a xlist =
(
case xs of
xlist_nil => xlist_nil
|
xlist_reverse(xs) => xs
|
xlist_cons(x1, xs) =>
xlist_snoc(xlist_do_reverse(xs), x1)
|
xlist_snoc(xs, x1) =>
xlist_cons(x1, xlist_do_reverse(xs))
|
xlist_append(xs, ys) =>
xlist_append(xlist_do_reverse(ys), xlist_do_reverse(xs))
)

(* ****** ****** *)

(* end of [CS320-2023-Spring-lectures-xlist.sml] *)
