(* ****** ****** *)

datatype 'a strcon =
  strcon_nil
| strcon_cons of
  ('a * (unit -> 'a strcon))

(* ****** ****** *)

type 'a stream = (unit -> 'a strcon)

(* ****** ****** *)

fun
stream_from(n: int): int stream =
fn () => strcon_cons(n, stream_from(n+1))

(* ****** ****** *)

fun
list_streamize
(xs: 'a list): 'a stream = fn () =>
(
case xs of
  nil => strcon_nil
| x1 :: xs => strcon_cons(x1, list_streamize(xs))
)

(* ****** ****** *)

(*
fun
int1_streamize(n) = list_streamize(int1_listize(n))
*)
fun
int1_rstreamize(n): int stream = fn () =>
if n > 0 then
strcon_cons(n-1, int1_rstreamize(n-1)) else strcon_nil
  

(* ****** ****** *)

(* end of [CS320-2023-Spring-lectures-stream-funs.sml] *)
