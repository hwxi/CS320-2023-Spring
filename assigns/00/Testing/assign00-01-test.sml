use "./../MySolution/assign00-01.sml";

local
exception Error
in
(* ****** ****** *)
(*
// HX-2023-01-20:
// '13' may need to be changed to '20'
*)
(* ****** ****** *)
val () =
if (N <> 13) then raise Error else ()
(* ****** ****** *)
val () = print("Assign00-01-test passed!\n")
(* ****** ****** *)
end (* end-of-local *)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign00-01-test.sml] *)
