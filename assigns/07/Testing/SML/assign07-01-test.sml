(* ****** ****** *)
use "./../../MySolution/SML/assign07-01.sml";
(* ****** ****** *)

local

exception Error

in (* in-of-local *)

(* ****** ****** *)
(*
val
stream_length = fn fxss =>
foreach_to_length(stream_foreach)(fxss)
*)
(* ****** ****** *)

val xs1 =
list_streamize[1]
val xs2 =
list_streamize[2,2,2]
val xs3 =
list_streamize[3,3]
val fxss =
stream_ziplst([xs1, xs2, xs3])
val (  ) =
assert320(1 = stream_length(fxss))
val (  ) =
assert320([1,2,3] = stream_get_at(fxss,0))

(* ****** ****** *)

val xs1 =
list_streamize[1,2,3]
val xs2 =
list_streamize[1,2,3]
val xs3 =
list_streamize[1,2,3]
val fxss =
stream_ziplst([xs1, xs2, xs3])
val (  ) =
assert320([1,1,1] = stream_get_at(fxss,0))
val (  ) =
assert320([2,2,2] = stream_get_at(fxss,1))
val (  ) =
assert320([3,3,3] = stream_get_at(fxss,2))

(* ****** ****** *)
val () = print( "Assign07-01-test passed!\n" )
(* ****** ****** *)

end (* end-of-local *)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign07-01-test.sml] *)
