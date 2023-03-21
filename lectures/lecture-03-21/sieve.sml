(* ****** ****** *)
use "./stream.sml";
(* ****** ****** *)

fun
sieve
( fxs
: int stream): int stream = fn () =>
(
case fxs() of
  strcon_nil => strcon_nil
| strcon_cons(x1, fxs) =>
  strcon_cons(x1, sieve(filter(fxs, x1)))
)

and
filter
( fxs
: int stream, x0: int): int stream = fn () =>
(
case fxs() of
  strcon_nil => strcon_nil
| strcon_cons(x1, fxs) =>
  if x1 mod x0 <> 0
  then strcon_cons(x1, filter(fxs, x0)) else filter(fxs, x0)()
)

(* ****** ****** *)

val thePrimes = sieve(stream_from(2))

(* ****** ****** *)

(* end of [CS320-2023-Spring-lectures-sieve.sml] *)