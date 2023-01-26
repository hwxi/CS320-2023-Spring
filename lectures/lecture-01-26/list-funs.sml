(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
List-values
*)
(* ****** ****** *)
(*
datatype
'a list =
nil | cons of 'a * 'a list
*)

(*
option is a type-constructor:
it is used to construct types

type intopt = int option
type stringopt = string option
*)

(* ****** ****** *)

val lst1 = nil
val lst2 = 1 :: nil
val lst3 = 1 :: 2 :: nil

(* ****** ****** *)

fun
list_sing
( x0: 'a ): 'a list = x0 :: nil

(* ****** ****** *)

(*
  recursive but
  not tail-recursive
*)
fun
list_size(xs: 'a list): int =
(
case xs of
nil => 0 | _ :: xs => 1 + list_size(xs)
) (* end of [list_size] *)

(* ****** ****** *)

(*
  tail-recursive
*)
fun
list_size(xs: 'a list): int =
let
  fun
  loop(xs: 'a list, res: int): int =
  (
  case xs of
  nil => res | _ :: xs => loop(xs, res+1)
  )
in
  loop(xs, 0)
end (* end of [list_size] *)

(* ****** ****** *)

(*
  recursive but not tail-recursive
*)
fun
list_append
(xs: 'a list, ys: 'a list): 'a list =
(
case xs of
  nil => ys
| x1 :: xs => x1 :: list_append(xs, ys)
)

(* ****** ****** *)

(*
  tail-recursive implementation
*)
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
list_flatten
(xss: 'a list list): 'a list =
(
case xss of
  nil => nil
| xs1 :: xss => xs1 @ (list_flatten xss)
)

(* ****** ****** *)

(*
fun
list_get_at
(xs: 'a list, i0: int): 'a =
(
  case xs of
    nil => raise ListSubscript320
  | x1 :: xs =>
    if i0 > 0
    then list_get_at(xs, i0-1) else x1
)
*)

(* ****** ****** *)

(*
This function is often called [list_nth]
*)
fun
list_get_at
(xs: 'a list, i0: int): 'a =
let
  fun loop(xs, i0) =
  (
  case xs of
    nil => raise ListSubscript320
  | x1 :: xs =>
    if i0 > 0 then loop(xs, i0-1) else x1
  )
in
let
  val () =
  assert320_some
  (i0 >= 0, "list_get_at: negative index")
in
  loop(xs, i0)
end
end

(* ****** ****** *)

(* end of [BUCASCS320-2023-Spring-list-funs.sml] *)
