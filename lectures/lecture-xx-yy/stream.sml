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

val
theNats = stream_from(0)
val xs = theNats
val strcon_cons(x0, xs) = xs()
val () = print("x0 = " ^ Int.toString(x0) ^ "\n")
val strcon_cons(x0, xs) = xs()
val () = print("x0 = " ^ Int.toString(x0) ^ "\n")
val strcon_cons(x0, xs) = xs()
val () = print("x0 = " ^ Int.toString(x0) ^ "\n")
val strcon_cons(x0, xs) = xs()
val () = print("x0 = " ^ Int.toString(x0) ^ "\n")
val strcon_cons(x0, xs) = xs()
val () = print("x0 = " ^ Int.toString(x0) ^ "\n")
val strcon_cons(x0, xs) = xs()
val () = print("x0 = " ^ Int.toString(x0) ^ "\n")

(* ****** ****** *)

(* end of [CS320-2023-Spring-lectures-stream.sml] *)
