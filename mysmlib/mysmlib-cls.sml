(* ****** ****** *)
(*
HX-2023-01-21:
Library functions
for BUCASCS320-2023-Spring
This is a class-wide library,
that is, it is shared by the class.
*)
(* ****** ****** *)

type 'a optn = 'a option

(* ****** ****** *)

exception
ERROR320 of string optn

(* ****** ****** *)

exception ConsMatch320
exception OptnSubscript320
exception ListSubscript320

(* ****** ****** *)

fun
assert320
(claim: bool): unit =
if claim
  then () else raise ERROR320(NONE)
(* end of [assert320] *)

fun
assert320_some
(claim: bool, errmsg: string): unit =
if claim
  then () else raise ERROR320(SOME(errmsg))
(* end of [assert320_some] *)

(* ****** ****** *)

fun
char_of_digit
(digit: int): char =
let
  val () =
  assert320_some
  (digit >= 0, "int2char")
  val () =
  assert320_some
  (digit <= 9, "int2char")
in
  chr(ord(#"0") + digit)
end (* end of [char_of_digit] *)

(* ****** ****** *)

fun
print_int(x: int) = print(Int.toString(x))
fun
print_char(c: char) = print(String.str(c))

(* ****** ****** *)

fun
list_is_nil(xs: 'a list): bool =
(
case xs of nil => true | _ :: _ => false)
fun
list_is_cons(xs: 'a list): bool =
(
case xs of nil => false | _ :: _ => true)

(* ****** ****** *)

fun
list_unnil(xs: 'a list): unit =
(
case xs of nil => () | _ => raise ConsMatch320)
fun
list_uncons(xs: 'a list): 'a * 'a list =
(
case xs of
x1 :: xs => (x1, xs) | _ => raise ConsMatch320)

(* ****** ****** *)

fun
optn_is_none(xs: 'a optn): bool =
(
case xs of NONE => true | SOME _ => false)
fun
optn_is_some(xs: 'a optn): bool =
(
case xs of NONE => false | SOME _ => true)

(* ****** ****** *)

fun
optn_unnone(xs: 'a optn): unit =
(
case xs of NONE => () | _ => raise ConsMatch320)
fun
optn_unsome(xs: 'a optn): 'a =
(
case xs of SOME x0 => x0 | _ => raise ConsMatch320)

(* ****** ****** *)

fun
list_length
(xs: 'a list): int =
let
  fun
  loop
  (xs: 'a list, res: int): int =
  case xs of
    nil => res
  | _ :: xs => loop(xs, res+1)
in
  loop(xs, 0)
end (* end of [list_length(xs)]: let *)

(* ****** ****** *)

fun
list_map
(xs: 'a list, fopr: 'a -> 'b): 'b list =
(
case xs of
  nil => nil
| x1 :: xs => fopr(x1) :: list_map(xs, fopr)
)

(* ****** ****** *)

fun
list_reduce_left
( r0: 'r, xs: 'a list
, fopr: 'r * 'a -> 'r): 'r =
(
case xs of
  nil => r0
| x1 :: xs =>
  list_reduce_left(fopr(r0, x1), xs, fopr)
)

(* ****** ****** *)

fun
list_reduce_right
( xs: 'a list
, r0: 'r, fopr: 'a * 'r -> 'r): 'r =
(
case xs of
  nil => r0
| x1 :: xs =>
  fopr(x1, list_reduce_right(xs, r0, fopr))
)
  
(* ****** ****** *)

(*
val list_foldleft = list_reduce_left
val list_foldright = list_reduce_right
*)

(* ****** ****** *)

val
list_append = (* a.k.a. '@' *)
fn(xs: 'a list, ys: 'a list) =>
list_reduce_right(xs, ys, fn(x, r) => x :: r)

(* ****** ****** *)

val
list_reverse = (* a.k.a. List.rev *)
fn(xs: 'a list) =>
list_reduce_left([], xs, fn(r, x) => x :: r)
val
list_rappend =
fn(xs: 'a list, ys: 'a list) =>
list_reduce_left(ys, xs, fn(r, x) => x :: r)

(* ****** ****** *)

val
list_foreach = (* a.k.a. 'list_app' *)
fn
( xs: 'a list
, work: 'a -> unit) =>
list_reduce_left((), xs, fn(r, x) => work(x))

(* ****** ****** *)

(* end of [BUCASCS320-2023-Spring-mysmlib-cls.sml] *)
