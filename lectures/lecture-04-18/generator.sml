(* ****** ****** *)

open SMLofNJ.Cont

(* ****** ****** *)

exception StopIteration

(* ****** ****** *)

type
'a generator =
'a cont ref * unit cont ref

(* ****** ****** *)

fun
generator_next
(gen0: 'a generator): 'a =
let
val
(ret0, cret) = gen0
in
callcc
(fn cc =>
 (ret0 := cc; throw (!cret) ()))
end

(* ****** ****** *)

fun
generator_yield
(cres, ret0, cret): unit =
callcc
(fn cc =>
 (cret := cc; throw (!ret0) cres))

(* ****** ****** *)

fun
generator_make_fun
(
gfun:
('a
  cont ref
* unit
  cont ref) -> 'a): 'a generator =
let
  val ret0 = ref(Unsafe.cast(NONE))
  val cret = ref(Unsafe.cast(NONE))
in
  callcc
  (fn cc0 =>
   (callcc(fn cc1 =>
    (cret := cc1; throw cc0 ())); gfun(ret0, cret); ()));
  (ret0, cret)
end

(* ****** ****** *)

fun
generator_make_map
( gxs: 'a generator
, fopr: ('a -> 'b)): 'b generator =
let
fun
genfun
(ret0, cret) =
let
  val () =
  generator_yield
  (fopr(generator_next(gxs)), ret0, cret)
in
    genfun(ret0, cret)
end
in
  generator_make_fun(genfun)
end

(* ****** ****** *)

fun
generator_make_filter
( gxs: 'a generator
, test: ('a -> bool)): 'a generator =
let
fun
genfun
(ret0, cret) =
let
  val x1 =
  generator_next(gxs)
  val () =
  if test(x1) then generator_yield(x1, ret0, cret) else ()
in
  genfun( ret0, cret )
end
in
  generator_make_fun(genfun)
end

(* ****** ****** *)

fun
my_int_from2
(start, ret0, cret) =
let
val () =
generator_yield(start, ret0, cret)
in
  my_int_from2(start+1, ret0, cret)
end

(* ****** ****** *)

fun
my_int_from(start) =
generator_make_fun
(
fn
(ret0, cret) =>
my_int_from2(start, ret0, cret)
)

(* ****** ****** *)

fun
sieve
( gxs
: int generator
)
: int generator =
let
fun
genfun(gxs, ret0, cret) =
let
(* ****** ****** *)
val p1 = generator_next(gxs)
val () = generator_yield(p1, ret0, cret)
(* ****** ****** *)
val gxs =
generator_make_filter(gxs, fn x1 => x1 mod p1 > 0)
(* ****** ****** *)
in
  genfun(gxs, ret0, cret)
end
in
  generator_make_fun(fn(ret0, cret) => genfun(gxs, ret0, cret))
end

(* ****** ****** *)

val
mygen = sieve(my_int_from(2))

(* ****** ****** *)

val x0 = generator_next(mygen)
val x1 = generator_next(mygen)
val x2 = generator_next(mygen)
val x3 = generator_next(mygen)
val x4 = generator_next(mygen)
val x5 = generator_next(mygen)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assigns-generator.sml] *)
