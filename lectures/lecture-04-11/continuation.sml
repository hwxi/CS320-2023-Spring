(* ****** ****** *)

fun fact(n) =
if n > 0 then n * fact(n-1) else 1

(* ****** ****** *)

(* Continuation-Passing-Style-style *)

fun
kfact(n: int, k: int -> unit) =
if n > 0 then kfact(n-1, fn res => k(n * res)) else k(1)

(* ****** ****** *)

(* end of [CS320-2023-Spring-lectures-continuation.sml] *)