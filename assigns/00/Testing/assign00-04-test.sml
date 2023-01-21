use "./../MySolution/assign00-04.sml";

local

exception Error
fun
assert(btf: bool): unit =
if not(btf) then raise Error else ()

in (* in-of-local *)

val () = assert(str2int("0") = 0)
val () = assert(str2int("10") = 10)
val () = assert(str2int("100") = 100)
val () = assert(str2int("1234") = 1234)

(* ****** ****** *)
val () = print("Assign00-04-test passed!\n")
(* ****** ****** *)

end (* end-of-local *)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign00-04-test.sml] *)
