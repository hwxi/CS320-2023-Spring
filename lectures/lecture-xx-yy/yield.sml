(* ****** ****** *)

open SMLofNJ.Cont

(* ****** ****** *)

(*
fun
my_int_from(start) =
  yield start
  yield_from my_int_from(start + 1)
*)

(* ****** ****** *)

fun
my_next0
(ret0, cret, gfun) =
callcc
(fn cc => (ret0 := cc; gfun()))

fun
my_next1(ret0, cret) =
callcc
(fn cc =>
 (ret0 := cc; throw (!cret) ()))

(* ****** ****** *)

fun
my_yield
(start, ret0, cret): unit =
callcc
(fn cc =>
 (cret := cc; throw (!ret0) start))

(* ****** ****** *)

fun
my_int_from2
(start, ret0, cret) =
let
val () =
my_yield(start, ret0, cret)
in
  my_int_from2(start+1, ret0, cret)
end

(* ****** ****** *)

fun
my_int_from(start) =
let
val ret0 = ref(Unsafe.cast(NONE))
val cret = ref(Unsafe.cast(NONE))
in
( ret0, cret
, fn() => my_int_from2(start, ret0, cret))
end

(* ****** ****** *)

val
( ret0
, cret
, gfun) = my_int_from(1000)

(* ****** ****** *)

val x0 =
my_next0
( ret0, cret
, Unsafe.cast(gfun))

(* ****** ****** *)

val x1 = my_next1(ret0, cret)
val x2 = my_next1(ret0, cret)
val x3 = my_next1(ret0, cret)

(* ****** ****** *)

(* end of [CS320-2023-Spring-lectures-yield.sml] *)
