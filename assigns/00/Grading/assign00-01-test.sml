use "./../MySolution/assign00-01.sml";

local
exception Error
in
(* ****** ****** *)
(*
// HX-2023-01-20:
// Note that '13' may need to be
// changed to another value.
*)
(* ****** ****** *)
fun fact(x: int): int =
if x > 0 then x * fact(x-1) else 1
(* ****** ****** *)
local
  fun loop(N: int): int =
  let
    val _ = fact(N) in loop(N+1)
  end
  handle Overflow => N
in (*local*)
val () =
if (N <> loop(0)) then raise Error else ()
end (* local *)
(* ****** ****** *)
val () = print("Assign00-01-test passed!\n")
(* ****** ****** *)
end (* end-of-local *)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign00-01-test.sml] *)
