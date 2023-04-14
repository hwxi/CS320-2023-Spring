(* ****** ****** *)

open SMLofNJ.Cont

(* ****** ****** *)

fun fact(n) =
if n > 0 then n * fact(n-1) else 1

(* ****** ****** *)

(* Continuation-Passing-Style-style *)

(* ****** ****** *)

fun
fact1(n: int): int =
if n > 0 then
n *
callcc
(fn k => throw k (fact1(n-1))) else 1

(* ****** ****** *)

fun
fact2(n: int): int =
callcc(fn k => kfact(n, k))

and
kfact(n: int, k: int cont): int =
if n <= 0
then throw k 1
else n * callcc(fn k => kfact(n-1, k))

(* ****** ****** *)

(* end of [CS320-2023-Spring-lectures-kfact.sml] *)