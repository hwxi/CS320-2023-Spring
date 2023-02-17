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

val abs_int =
fn(i0: int) =>
if i0 >= 0 then i0 else ~i0

(* ****** ****** *)

fun
pow_int_int
(x: int, y: int): int =
if y <= 0
then 1 else x * pow_int_int(x, y-1)

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
list_filter
(xs: 'a list, test: 'a -> bool): 'a list =
(
case xs of
  nil => nil
| x1 :: xs =>
  if test(x1)
  then x1 :: list_filter(xs, test) else list_filter(xs, test)
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

val
list_append = (* a.k.a. @ *)
fn(xs: 'a list, ys: 'a list) =>
list_reduce_right(xs, ys, op::)

val
list_concat = (* 'flatten' *)
fn(xss: 'a list list) =>
list_reduce_right(xss, [], op@)

(* ****** ****** *)
val
list_extend =
fn(xs, x0) => list_append(xs, [x0])
(* ****** ****** *)

val list_foldleft = list_reduce_left
val list_foldright = list_reduce_right

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

fun
int0_foreach
(n0: int, work: unit -> unit) =
let
fun
  loop(i0: int): unit =
  if i0 >= n0
  then ()
  else (work(); loop(i0+1)) in loop(0(*i0*))
end (* end of [int0_foreach(n0, work)]: let *)

(* ****** ****** *)

fun
int1_foreach
(n0: int, work: int -> unit) =
let
fun
  loop(i0: int): unit =
  if i0 >= n0
  then ()
  else (work(i0); loop(i0+1)) in loop(0(*i0*))
end (* end of [int1_foreach(n0, work)]: let *)

(* ****** ****** *)

val
string_foreach =
fn( cs, work ) =>
int1_foreach
(String.size(cs), fn(i) => work(String.sub(cs, i)))

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

fun
foreach_to_map_list
(
foreach:
('xs * ('x0->unit))->unit)
:
('xs * ('x0 -> 'y0)) -> 'y0 list
=
(
fn(xs, fopr) =>
list_reverse
(
foreach_to_foldleft
(foreach)(nil, xs, fn(r0, x0) => fopr(x0) :: r0)))

(* ****** ****** *)

fun
foreach_to_filter_list
(
foreach:
('xs * ('x0->unit))->unit)
:
('xs * ('x0 -> bool)) -> 'x0 list
=
(
fn(xs, test) =>
list_reverse
(
foreach_to_foldleft(foreach)
( nil, xs
, fn(r0, x0) => if test(x0) then x0 :: r0 else r0)))

(* ****** ****** *)

val
int1_forall =
fn(xs, test) =>
foreach_to_forall(int1_foreach)(xs, test)

(* ****** ****** *)

val
list_forall =
fn(xs, test) =>
foreach_to_forall(list_foreach)(xs, test)

(* ****** ****** *)

val
string_forall =
fn( cs, test ) =>
int1_forall
(String.size(cs), fn(i) => test(String.sub(cs, i)))

(* ****** ****** *)

val
list_get_at =
fn(xs, i0) =>
foreach_to_get_at(list_foreach)(xs, i0)

(* ****** ****** *)

val
int1_listize =
fn(xs) => foreach_to_listize(int1_foreach)(xs)
val
int1_rlistize =
fn(xs) => foreach_to_rlistize(int1_foreach)(xs)

(* ****** ****** *)

val
list_rlistize =
fn(xs) => foreach_to_rlistize(list_foreach)(xs)

(* ****** ****** *)

val
string_listize =
fn(xs) => foreach_to_listize(string_foreach)(xs)
val
string_rlistize =
fn(xs) => foreach_to_rlistize(string_foreach)(xs)

(* ****** ****** *)

val
int1_foldleft =
fn(r0,xs,fopr) =>
foreach_to_foldleft(int1_foreach)(r0,xs,fopr)
val
int1_foldright =
fn(xs,r0,fopr) =>
int1_foldleft(r0, xs, fn(r0, x0) => fopr(xs-1-x0, r0))

(* ****** ****** *)

val
list_foldleft =
fn(r0,xs,fopr) =>
foreach_to_foldleft(list_foreach)(r0,xs,fopr)
val
list_foldright =
fn(xs,r0,fopr) =>
foreach_to_foldleft(list_foreach)(list_reverse(xs), r0,fopr)

(* ****** ****** *)

val
string_foldleft =
fn( r0,cs,fopr ) =>
int1_foldleft
(r0, String.size(cs), fn(r0, i0) => fopr(r0, String.sub(cs, i0)))
val
string_foldright =
fn( cs,r0,fopr ) =>
int1_foldright
(r0, String.size(cs), fn(i0, r0) => fopr(String.sub(cs, i0), r0))

(* ****** ****** *)

(* end of [BUCASCS320-2023-Spring-mysmlib-cls.sml] *)
