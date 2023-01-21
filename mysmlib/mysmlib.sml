(* ****** ****** *)
(*
Library functions for BUCASCS320-2023-Spring
*)
(* ****** ****** *)

exception
ERROR320 of string option

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

fun print_int(x: int) = print(Int.toString(x))
fun print_char(c: char) = print(String.str(c))

(* ****** ****** *)

(* end of [BUCASCS320-2023-Spring-mysmlib.sml] *)
