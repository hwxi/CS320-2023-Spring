(* ****** ****** *)
use
"./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
fun
find_root
(f0: int -> int): int =
let
exception ZERO of int
fun
loop(i: int): int =
if
f0(i) <> 0
then loop(i+1) else raise ZERO(i) 
in
  loop(0) handle ZERO(i) => i
end
*)

(* ****** ****** *)

val
find_root =
fn
(f0: int -> int) =>
let
exception ZERO of int
val
rec
loop =
fn(i: int) =>
if
f0(i) <> 0
then loop(i+1) else raise ZERO(i) 
in
  loop(0) handle ZERO(i) => i
end : int

(* ****** ****** *)

val () =
print
("find_root(fn x => x * x - x - 20*21) = ")
val () =
print_int(find_root(fn x => x * x - x - 20*21))
val () = print("\n")

(* ****** ****** *)

val () =
print
("find_root(fn x => x * x - x - 100*101) = ")
val () =
print_int(find_root(fn x => x * x - x - 100*101))
val () = print("\n")

(* ****** ****** *)

(* end of [BUCASCS320-2023-Spring-find_root.sml] *)
