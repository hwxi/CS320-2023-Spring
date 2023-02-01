(* ****** ****** *)

(*
(*
HX-2023-01-30:
This one is recursive
but not tail-recursive
*)
fun
list_last
(xs: 'a list): 'a option =
(
case xs of
  nil => NONE
| x1 :: xs =>
  let
    val res = list_last(xs)
  in
    case res of
    NONE => SOME(x1) | SOME _ => res
  end
)
*)

(* ****** ****** *)

(*
HX-2023-01-31:
This one is tail-recursive
*)
fun
list_last
(xs: 'a list): 'a option =
let
  fun
  loop(xs: 'a list, x0: 'a): 'a =
  (
  case xs of
  nil => x0 | x1 :: xs => loop(xs, x1)
  )
in
  case xs of
  nil => NONE | x1 :: xs => SOME(loop(xs, x1))
end

(* ****** ****** *)

(* end of [list_last.sml] *)
