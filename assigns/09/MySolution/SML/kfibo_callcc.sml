(* ****** ****** *)

open SMLofNJ.Cont

(* ****** ****** *)

fun
compose_function_continuation
(f0: 'a -> 'b, k0: 'b cont): 'a cont =
callcc
(
fn ret =>
throw k0 (f0(callcc(fn k1 => throw ret k1))))

(* ****** ****** *)

fun
kfibo(n: int, k0: int -> 'a): 'a =
if n >= 2
then
kfibo
(n-1,
fn res1 =>
kfibo
(n-2, fn res2 => k0(res1+res2))) else k0(n)

(* ****** ****** *)

fun
kfibo_callcc(n: int): int =
callcc
(fn ret => kfibo(n, fn res => throw ret res))

(* ****** ****** *)

(* end of [CS320-2023-Spring-assigns-kfibo_callcc.sml] *)
