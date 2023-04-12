(* ****** ****** *)
use "./../../MySolution/SML/assign06-02.sml";
(* ****** ****** *)

local

exception Error

in (* in-of-local *)

(* ****** ****** *)

fun
check1
( ij: int
, fxs: (int*int) stream): int =
let
val
strcon_cons((i, j), fxs) = fxs()
in
  if i + j < ij
  then (i+j) + check1(ij, fxs) else 0
end

(* ****** ****** *)
val () =
(
print("check1(1) = ");
print(Int.toString(check1(1, theNatPairs))); print("\n"))
val () =
(
print("check1(2) = ");
print(Int.toString(check1(2, theNatPairs))); print("\n"))
val () =
(
print("check1(3) = ");
print(Int.toString(check1(3, theNatPairs))); print("\n"))
(* ****** ****** *)
val () =
(
print("check1(9) = ");
print(Int.toString(check1(9, theNatPairs))); print("\n"))
(* ****** ****** *)
val () =
(
print("check1(10) = ");
print(Int.toString(check1(10, theNatPairs))); print("\n"))
val () =
(
print("check1(11) = ");
print(Int.toString(check1(11, theNatPairs))); print("\n"))
(* ****** ****** *)
val () =
assert320(check1(9, theNatPairs) = 240)
(* ****** ****** *)
val () =
assert320(check1(10, theNatPairs) = 330)
(* ****** ****** *)
val () =
assert320(check1(11, theNatPairs) = 440)
(* ****** ****** *)
val () = print("Assign06-02-test passed!\n")
(* ****** ****** *)

end (* end-of-local *)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign06-02-test.sml] *)
