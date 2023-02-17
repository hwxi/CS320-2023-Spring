use "./../MySolution/assign04-04.sml";

local

exception Error

in (* in-of-local *)

(* ****** ****** *)
val
board_foreach =
fn
( bd: board_t
, work: int -> unit) =>
let
val (x0, x1, x2, x3, x4, x5, x6, x7) = bd
in
  work(x0); work(x1); work(x2); work(x3);
  work(x4); work(x5); work(x6); work(x7); ()
end
(* ****** ****** *)

val
theSolutions =
queen8_puzzle_solve()

val
queen8_puzzle_solve_show =
fn() =>
let
val
print_row =
fn(i) =>
(
int1_foreach
(N, fn(j) => if i = j+1 then print"Q " else print". "); print"\n")
val
print_board = (fn(bd) => board_foreach(bd, fn(i) => print_row(i)))
in
list_foldleft
( 0, theSolutions
, fn(r, sol) =>
  (print("Solution #"^Int.toString(r+1)^"\n"); print_board(sol); print("\n"); r+1))
end (* end of [queen8_puzzle_solve_show]: let *)

(* ****** ****** *)

val nsol = queen8_puzzle_solve_show()

(* ****** ****** *)

val ( ) =
assert320_some(nsol = 92, "assign04-04-test:1")

(* ****** ****** *)
val () = print("Assign04-04-test passed: Congradulations!\n")
(* ****** ****** *)

end (* end-of-local *)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign04-04-test.sml] *)
