(* ****** ****** *)

(*
HX-2023-02-07: 40 points
*)

(* ****** ****** *)

datatype suit =
Spade | Heart | Diamond | Club

datatype rank =
  Ace | Two | Three
| Four | Five | Six
| Seven | Eight | Nine
| Ten | Jack | Queen | King

type card = (suit * rank)

(* ****** ****** *)

val S1 = (Spade, Ace)
val S2 = (Spade, Two)
val S3 = (Spade, Three)
val S4 = (Spade, Four)
val S5 = (Spade, Five)
val S6 = (Spade, Six)
val S7 = (Spade, Seven)
val S9 = (Spade, Eight)
val S9 = (Spade, Nine)
val ST = (Spade, Ten)
val SJ = (Spade, Jack)
val SQ = (Spade, Queen)
val SK = (Spade, King)

(* ****** ****** *)

val H1 = (Heart, Ace)
val H2 = (Heart, Two)
val H3 = (Heart, Three)
val H4 = (Heart, Four)
val H5 = (Heart, Five)
val H6 = (Heart, Six)
val H7 = (Heart, Seven)
val H9 = (Heart, Eight)
val H9 = (Heart, Nine)
val HT = (Heart, Ten)
val HJ = (Heart, Jack)
val HQ = (Heart, Queen)
val HK = (Heart, King)

(* ****** ****** *)

val D1 = (Diamond, Ace)
val D2 = (Diamond, Two)
val D3 = (Diamond, Three)
val D4 = (Diamond, Four)
val D5 = (Diamond, Five)
val D6 = (Diamond, Six)
val D7 = (Diamond, Seven)
val D9 = (Diamond, Eight)
val D9 = (Diamond, Nine)
val DT = (Diamond, Ten)
val DJ = (Diamond, Jack)
val DQ = (Diamond, Queen)
val DK = (Diamond, King)

(* ****** ****** *)

val C1 = (Club, Ace)
val C2 = (Club, Two)
val C3 = (Club, Three)
val C4 = (Club, Four)
val C5 = (Club, Five)
val C6 = (Club, Six)
val C7 = (Club, Seven)
val C9 = (Club, Eight)
val C9 = (Club, Nine)
val CT = (Club, Ten)
val CJ = (Club, Jack)
val CQ = (Club, Queen)
val CK = (Club, King)

(* ****** ****** *)

fun
suit2int(s0: suit): int =
(
case s0 of
  Spade => 1
| Heart => 2
| Diamond => 3 | Club => 4)

(* ****** ****** *)

fun rank2int(f0: rank): int =
(
case f0 of
  Ace => 1
| Two => 2
| Three => 3
| Four => 4
| Five => 5
| Six => 6
| Seven => 7
| Eight => 8
| Nine => 9
| Ten => 10
| Jack => 11
| Queen => 12
| King => 13
)

(* ****** ****** *)

fun
card_suit(x1: card) = #1(x1)
fun
card_rank(x1: card) = #2(x1)

(* ****** ****** *)

type int2 = int * int
type int3 = int * int * int
type int4 = int * int * int * int
type int5 = int * int * int * int * int

(* ****** ****** *)
(*
//
The following function int5_sort
is based on ListMergeSort.sort, which is
defined recursively. Given a tuple of 5
integers, int5_sort returns an order tuple
of the same 5 integers. For instance,
int5_sort(3, 1, 2, 5, 4) = (1, 2, 3, 4, 5)
//
*)
val
int5_sort =
fn(xs: int5): int5 =>
let
val (x1, x2, x3, x4, x5) = xs
val ys =
ListMergeSort.sort
(op>=)[x1,x2,x3,x4,x5]
val y1 = hd(ys) and ys = tl(ys)
val y2 = hd(ys) and ys = tl(ys)
val y3 = hd(ys) and ys = tl(ys)
val y4 = hd(ys) and ys = tl(ys)
val y5 = hd(ys) and ys = tl(ys) in (y1, y2, y3, y4, y5)
end (* end-of-[int5_sort]: let *)

(* ****** ****** *)

type
card5 = card*card*card*card*card

(* ****** ****** *)

(*
Please implement [card5_fullhouse]
which tests if a tuple of 5 cards forms
a full house (that is, 3 of the cards have
the same rank value and the rest 2 also have
the same rank value). For instance,
(S-7, H-J, D-7, C-7, C-J) forms a fullhouse:
3 7's and 2 J's. You may assume that the 5 cards
in the given tuple are from the same deck.
//
fun card5_fullhouse(cs: card5): bool
//
*)

fun
card5_fullhouse(cs: card5): bool =
(*
Please Give your implementation as follows:
*)

(* ****** ****** *)

(* end of [CS320-2023-Spring-quiz01-card5_fullhouse.sml] *)
