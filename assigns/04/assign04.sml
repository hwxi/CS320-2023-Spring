(* ****** ****** *)
(*
Programming with combinators
*)
(* ****** ****** *)

(*
Assign04-01:
HX-2023-02-16: 10 points
Please give a NON-RECURSIVE implementation
of isPrime that is based on combinators in the
mysmlib-library for this class.
See MySolution/assign04-01.sml for more details
*)

(* ****** ****** *)

(*
Assign04-02:
HX-2023-02-16: 10 point
//
The function [list_subsets]
returns all the subsets of a given
set (where sets are represented as lists)
//
fun
list_subsets
(xs: 'a list): 'a list list =
(
case xs of
  nil => [[]]
| x1 :: xs =>
  let
    val res = list_subsets(xs)
  in
    res @ list_map(res, fn(xs) => x1 :: xs)
  end
)
//
Please give a NON-RECURSIVE implementation of
list_subsets based on list-combinators. Note that
the order of the elements in a list representation
of a set is insignificant. For instance, [1,2] and
[2,1] represents the same set {1,2}.
//
*)

(* ****** ****** *)

(*
Assign04-03:
HX-2023-02-16: 10 point
//
There is a concept 'exists'
that is dual to the concept of 'forall'.
//
Recall that a forall-function takes a sequence
and a predicate (that is, a test function) and
checks whether ALL the elements in the sequence
satisfy the predicate.
//
An exists-function takes a sequence and a predicate
and checks if there is an element in the sequence that
satisfies the predicate.
//
Please implement the following third-order function
that turns a forall-function into an exists-function
//
type
('xs, 'x0) forall_t =
'xs * ('x0 -> bool) -> bool)
type
('xs, 'x0) exists_t =
'xs * ('x0 -> bool) -> bool)
//
fun
forall_to_exists
(forall: ('xs,'x0)forall_t): ('xs,'x0)exists_t
//
See MySolution/assign04-03.sml for more details.
//
*)

(* ****** ****** *)

(*
//
Assign04-04:
HX-2023-02-16: 30 points + 20 bonus points
//
Here is an implementation of the famous 8-queen puzzle:
https://ats-lang.sourceforge.net/DOCUMENT/INT2PROGINATS/HTML/x631.html
//
Please give a NON-RECURSIVE implementation that solves the 8-queen puzzle.
//
type board_t =
int * int * int * int * int * int * int * int
//
fun
queen8_puzzle_solve(): board_t list =
(*
returns a list of boards consisting of all the solutions to the puzzle.
*)
//
HX: Hint: Please think of programming in terms of combinators.
//
*)

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign04.sml] *)
