(* ****** ****** *)
use "./../../MySolution/SML/assign07-02.sml";
(* ****** ****** *)

local

exception Error

in (* in-of-local *)

(* ****** ****** *)
val N3 = 1000
val N4 = 10000
val N5 = 100000
(* ****** ****** *)

fun
mycheck1
( fxys
: (int*int) stream
, csum0: int, i0: int): bool =
(
if
(i0 >= N5)
then true else
case fxys() of
strcon_nil => false
|
strcon_cons(xy1, fxys) =>
let
  val (x1, y1) = xy1
  val csum1 = x1*x1*x1 + y1*y1*y1
(*
val ((*nil*)) =
  print
  ("("^Int.toString(x1)
   ^","^
   Int.toString(y1)^")\n")
  val ((*nil*)) =
  print
  ("cubesum = "
  ^Int.toString(x1*x1*x1+y1*y1*y1)^"\n")
*)
in
  if
  (x1<=y1)andalso(csum0<=csum1)
  then mycheck1(fxys, csum1, i0+1) else false
end
)

(* ****** ****** *)

val () =
assert320(mycheck1(theNatPairs_cubesum, 0, 0))

(* ****** ****** *)
val () = print
("Assign07-02-test: the ordering test done!\n" )
(* ****** ****** *)

val () =
assert320
(stream_get_at(theNatPairs_cubesum, 999) = (30,42))
val () =
assert320
(stream_get_at(theNatPairs_cubesum, 9999) = (84,140))

(* ****** ****** *)
val () = print( "Assign07-02-test: All passed! Congrats!\n" )
(* ****** ****** *)

end (* end-of-local *)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign07-02-test.sml] *)
