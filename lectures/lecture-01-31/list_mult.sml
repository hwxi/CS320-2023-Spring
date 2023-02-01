(* ****** ****** *)

fun
list_mult(xs: int list): int =
case xs of
  nil => 1
| x1 :: xs => x1 * list_mult(xs)

(* ****** ****** *)

fun
list_mult_opt(xs: int list): int =
(
case xs of
  nil => 1
| x1 :: xs =>
  if x1 = 0
  then 0 else x1 * list_mult_opt(xs)
)

(* ****** ****** *)

fun
list_mult_exn(xs: int list): int =
let

exception Zero

fun
helper(xs: int list): int =
(
case xs of
  nil => 1
| x1 :: xs =>
  if x1 = 0
  then raise Zero else x1 * helper(xs)
)

in
  helper(xs) handle Zero => 0
end

(* end of [list_mult.sml] *)