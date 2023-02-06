use "./../MySolution/assign01-04.sml";

local

exception Error
fun
assert(btf: bool): unit =
if not(btf) then raise Error else ()

in (* in-of-local *)

val () = assert(str2int_opt("") = NONE)
val () = assert(str2int_opt("0+1") = NONE)
val () = assert(str2int_opt("10z") = NONE)
val () = assert(str2int_opt("100;") = NONE)
val () = assert(str2int_opt("x1234") = NONE)
val () = assert(str2int_opt("-1234") = NONE)
val () = assert(str2int_opt("12-345") = NONE)

val () = assert(str2int_opt("0") = SOME 0)
val () = assert(str2int_opt("10") = SOME 10)
val () = assert(str2int_opt("0123") = SOME 123)
val () = assert(str2int_opt("1230") = SOME 1230)

(* ****** ****** *)
val () = print("Assign01-04-test passed!\n")
(* ****** ****** *)

end (* end-of-local *)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign01-04-test.sml] *)
