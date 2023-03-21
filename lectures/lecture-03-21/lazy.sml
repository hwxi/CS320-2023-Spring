(* ****** ****** *)
(*
Memoisation
Lasiness based on memoisation
*)
(* ****** ****** *)
  
datatype 'a memo =
  memo_val of 'a
| memo_fun of unit -> 'a

(* ****** ****** *)

type 'a lazy = 'a memo ref

(* ****** ****** *)

fun
lazy_get(r0: 'a lazy): 'a =
case !r0 of
memo_val(x0) => x0
|
memo_fun(f0) =>
let val x0 = f0() in r0 := memo_val(x0); x0 end

(* ****** ****** *)

fun lazy_val(x0: 'a) = ref(memo_val(x0))
fun lazy_fun(f0: unit -> 'a) = ref(memo_fun(f0))

(* ****** ****** *)

(* end of [CS320-2023-Spring-lectures-lazy.sml] *)
