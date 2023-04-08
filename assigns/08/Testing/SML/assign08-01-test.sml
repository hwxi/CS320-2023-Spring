(* ****** ****** *)
use "./../../MySolution/SML/assign08-01.sml";
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

val () =
assert320
(
stream_length
(stream_permute_list[1,2,3,4,5]) = 5*4*3*2*1)

(* ****** ****** *)

val () =
assert320
(
length
(
stream_get_at
(stream_permute_list
 (list_tabulate(20, fn _ => 0)), 1000000)) = 20)

(* ****** ****** *)
val () = print( "Assign08-01-test passed!\n" )
(* ****** ****** *)

end (* end-of-local *)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign08-01-test.sml] *)
