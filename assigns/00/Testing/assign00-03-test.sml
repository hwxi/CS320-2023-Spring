use "./../MySolution/assign00-03.sml";

local

exception Error
fun
assert(btf: bool): unit =
if not(btf) then raise Error else ()

in (* in-of-local *)

val () = assert(int2str(0) = "0")
val () = assert(int2str(10) = "10")
val () = assert(int2str(100) = "100")
val () = assert(int2str(1000) = "1000")
val () = assert(int2str(12345) = "12345")

(* ****** ****** *)
val () = print("Assign00-03-test passed!\n")
(* ****** ****** *)

end (* end-of-local *)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign00-03-test.sml] *)
