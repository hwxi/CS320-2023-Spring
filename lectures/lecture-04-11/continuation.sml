(* ****** ****** *)

fun fact(n) =
if n > 0 then n * fact(n-1) else 1

(* ****** ****** *)

fun fibo(n) =
if n >= 2
then fibo(n-1) + fibo(n-2) else n

(* ****** ****** *)

(* Continuation-Passing-Style-style *)

fun
kfact(n: int, k: int -> 'a) =
if n > 0 then kfact(n-1, fn res => k(n * res)) else k(1)

(* ****** ****** *)

fun
kfibo(n: int, k: int -> 'a) =
if n >= 2
then
kfibo
(n-1,
fn res1 =>
kfibo(n-2, fn res2 => k(res1+res2))
else k(n)

(* ****** ****** *)

fun
kisevn(n: int, k: bool -> 'a): bool =
if n = 0 then k(true) else isodd(n-1, k)
and
kisodd(n: int, k: bool -> 'a): bool =
if n = 0 then k(false) else isevn(n-1, k)


(* ****** ****** *)

val
fact10 = kfact(10, fn res => res)

val () =
kfact
( 10
, fn res => print("fact(10) = " ^ Int.toString(res) ^ "\n"))

(* ****** ****** *)

(* end of [CS320-2023-Spring-lectures-continuation.sml] *)