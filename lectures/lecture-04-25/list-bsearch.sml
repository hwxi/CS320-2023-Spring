(* ****** ****** *)

(*
T(n) = T(n/2) + O(n)
Solution: T(n) = O(n)
*)

(* ****** ****** *)

fun
list_bsearch
( xs
: int list
, n0: int
, x0: int ) : bool =
if
n0 <= 0
then false else
let

val i0 = n0 div 2

fun
helper
(ys: int list, j0: int): bool =
let
  val y1 :: ys = ys
in
  if j0 < i0
  then helper(ys, j0+1) else
  (
  if (x0 = y1) then true else
  (
    if x0 < y1
    then list_bsearch(xs, i0, x0)
    else list_bsearch(ys, n0 - i0 - 1, x0)
  )
  )
end

in
  helper(xs, 0)
end (* end-of-let[list-bsearch(xs, n0, x0)] *)

(* ****** ****** *)

(* End of [CS320-2023-Spring-lectures-list-bsearch.sml] *)
