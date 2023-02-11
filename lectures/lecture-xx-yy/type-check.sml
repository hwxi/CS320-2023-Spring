(* ****** ****** *)
use
"./../../mysmlib/mysmlib.sml";
(* ****** ****** *)

datatype
mytype =
TPbas of string

(* ****** ****** *)

val TPint = TPbas("int")
val TPbool = TPbas("bool")
val TPchar = TPbas("char")
val TPstring = TPbas("string")

(* ****** ****** *)

fun
tp2str
(tp: mytype) =
case tp of TPbas(nm) => "<" ^ nm ^ ">"

(* ****** ****** *)

(*
fun
mytype_eq
( tp1: mytype
, tp2: mytype): bool =
(
case (tp1, tp2) of
(TPbas(nm1), TPbas(nm2)) => (nm1 = nm2)
*)

(* ****** ****** *)

fun
mytype_asserteq
( tp1: mytype
, tp2: mytype) =
assert320_some
( tp1 = tp2
, tp2str(tp1) ^ "<>" ^ tp2str(tp2))

(* ****** ****** *)

fun IF
( tp_test: mytype
, tp_then: mytype
, tp_else: mytype): mytype =
let
  val () =
  mytype_asserteq(tp_test, TPbool)
  val () =
  mytype_asserteq(tp_then, tp_else) in tp_then
end

(* ****** ****** *)

exception TPopr2Exn of string

fun
TPopr2
(nm: string):
(mytype * mytype) -> mytype =
(
case nm of
"+" =>
(
fn(tp1, tp2) =>
let
val () = mytype_asserteq(tp1, TPint)
val () = mytype_asserteq(tp2, TPint) in TPint end)
|
"-" =>
(
fn(tp1, tp2) =>
let
val () = mytype_asserteq(tp1, TPint)
val () = mytype_asserteq(tp2, TPint) in TPint end)
|
"*" =>
(
fn(tp1, tp2) =>
let
val () = mytype_asserteq(tp1, TPint)
val () = mytype_asserteq(tp2, TPint) in TPint end)
|
"<" =>
(
fn(tp1, tp2) =>
let
val () = mytype_asserteq(tp1, TPint)
val () = mytype_asserteq(tp2, TPint) in TPbool end)
|
">" =>
(
fn(tp1, tp2) =>
let
val () = mytype_asserteq(tp1, TPint)
val () = mytype_asserteq(tp2, TPint) in TPbool end)
|
nm (*otherwise*) => raise TPopr2Exn(nm)
)

(* ****** ****** *)

(*
fun fact(x: int): int =
  if x > 0 then x * fact(x-1) else 1
*)
fun FACT(x: mytype): mytype =
  IF
  ( TPopr2(">")(x, TPint)
  , TPopr2("*")(x, FACT_tmp(TPopr2("-")(x, TPint)))
  , TPint)
and FACT_tmp(x: mytype): mytype =
  let val () = mytype_asserteq(x, TPint) in TPint end

(* ****** ****** *)

(* end of [BUCASCS320-2023-Spring-lectures-type-check.sml] *)
