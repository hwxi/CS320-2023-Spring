(* ****** ****** *)
use "./../../mysmlib/mysmlib.sml";
(* ****** ****** *)

fun
find_root
(f0: int -> int): int =
let
exception ZERO of int
fun
loop(i: int): int =
if
f0(i) != 0
then loop(i+1) else raise ZERO(i) 
in
  loop(0) handle ZERO(i) => i
end

(* ****** ****** *)

val () =
print
("find_root(fn x => x * x - x - 100*101)" = ")
val () =
print_int(find_root(fn x => x * x - x - 100*101))
val () = print("\n")

(* ****** ****** *)

(* end of [BUCASCS320-2023-Spring-find_root.sml] *)
