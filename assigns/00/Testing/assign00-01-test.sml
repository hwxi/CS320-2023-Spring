use "./../MySolution/assign00-01.sml";

local
exception Error
in
val () =
if (N <> 13) then raise Error else ()
val () = print("Assign00-01 passed!\n")
end (* end-of-local *)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign00-01-test.sml] *)
