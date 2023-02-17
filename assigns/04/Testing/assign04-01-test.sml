use "./../MySolution/assign04-01.sml";

local

exception Error

in (* in-of-local *)

(* ****** ****** *)
val () =
if (isPrime(0)) then raise Error else ()
val () =
if (isPrime(1)) then raise Error else ()
val () =
if not(isPrime(2)) then raise Error else ()
(* ****** ****** *)
val () =
if (isPrime(5) <> true) then raise Error else ()
val () =
if (isPrime(7) <> true) then raise Error else ()
val () =
if (isPrime(57) <> false) then raise Error else ()
val () =
if (isPrime(101) <> true) then raise Error else ()
val () =
if (isPrime(1001) <> false) then raise Error else ()
val () =
if (isPrime(10001) <> false) then raise Error else ()

(* ****** ****** *)
val () = print("Assign04-01-test passed!\n")
(* ****** ****** *)

end (* end-of-local *)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign04-01-test.sml] *)
