(* ****** ****** *)

open SMLofNJ.Cont

(* ****** ****** *)

fun
save_cont
( saved
: (unit cont) ref): unit =
callcc(fn ret => (saved := ret; ()))

(* ****** ****** *)

(*
HX:
k0 = *E0[]
Want *E0[f0[]]
E[compose_func_cont(f0, k0)] =>
E[throw(k0)
  (f0(callcc(fn k1 => throw(*E[])(k1))))] =>
E[throw(k0)(f0(throw(*E[])(*E[throw(k0)(f0([]))])))] =>
E[*E[throw(k0)(f0([]))]]
*)
fun
compose_func_cont
(f0: 'a -> 'b, k0: 'b cont): 'a cont =
callcc
(
fn ret =>
throw k0 (f0(callcc(fn k1 => throw ret k1))))

(* ****** ****** *)

fun
kfact
(n: int, k0: int cont): int =
if n <= 0
then throw k0 1 else
kfact
(n-1, compose_func_cont(fn res => n * res, k0))

(* ****** ****** *)

(* end of [CS320-2023-Spring-lectures-callcc.sml] *)
