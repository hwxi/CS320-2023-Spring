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
val res = xlist_head(ys)
in
  case res of
  NONE => xlist_head(xs) | SOME _ => res
end
|
xlist_reverse(xs) => xlist_head(xs)
)

(* ****** ****** *)

(* end of [CS320-2023-Spring-lectures-xlist.sml] *)
