(* ****** ****** *)
use "./../../MySolution/SML/assign06-01.sml";
(* ****** ****** *)

local

exception Error

in (* in-of-local *)

(* ****** ****** *)
val eps = 0.001
(* ****** ****** *)  
val fxs = the_ln2_stream
(* ****** ****** *)

val strcon_cons(x1, fxs) = fxs()
val () =
print("x1 = "^Real.toString(x1)^"\n")
val () = assert320(abs(x1 - 1.0) < eps)

val strcon_cons(x1, fxs) = fxs()
val () =
print("x1 = "^Real.toString(x1)^"\n")
val () = assert320(abs(x1 - 0.5) < eps)

val strcon_cons(x1, fxs) = fxs()
val () =
print("x1 = "^Real.toString(x1)^"\n")
val () = assert320(abs(x1 - 0.833333) < eps)

val strcon_cons(x1, fxs) = fxs()
val () =
print("x1 = "^Real.toString(x1)^"\n")
val () = assert320(abs(x1 - 0.5833333) < eps)

val strcon_cons(x1, fxs) = fxs()
val () =
print("x1 = "^Real.toString(x1)^"\n")
val () = assert320(abs(x1 - 0.7833333) < eps)

(* ****** ****** *)
val () = print( "Assign06-01-test passed!\n" )
(* ****** ****** *)

end (* end-of-local *)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign06-01-test.sml] *)
