(*
use "list.sml"
datatype 'a list =
nil of () | cons of ('a, 'a list)
*)

type ints = int list

fun
append(xs: ints)(ys: ints): ints =
case xs of
  nil => ys
| (x1 :: xs) => x1 :: append xs ys

fun
reverse(xs) = rappend(xs)(nil)
and
rappend(xs: ints)(ys: ints): ints =
case xs of
  nil => ys
| (x1 :: xs) => rappend xs (x1 :: ys)

fun
forall(xs: ints, test: int -> bool): bool =
case xs of
  nil => true
| (x1 :: xs) =>
  if test(x1) then forall(xs, test) else false

fun
foreach(xs: ints, work: int -> unit): unit =
let
val _(*true*) =
forall(xs, fn(x1) => let val () = work(x1) in true end) in ()
end
