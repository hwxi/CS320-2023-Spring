(* ****** ****** *)

(*
T(n) = T(n-1) + O(1)
Solution: T(n) = O(n)
*)
fun
fact(n: int): int =
if n > 0 then n * fact(n-1) else 1

(* ****** ****** *)

(*
T(n) = T(n-1) + T(n-2) + O(1)
Solution:
T(n) > 2^{n/2} (exponential time)
*)
fun
fibo(n: int): int =
if n >= 2 then fibo(n-1) + fibo(n-2) else n

(* ****** ****** *)

(*
T(n) = T(n-1) + O(n)
Solution: T(n) = O(n^2) // quadratic-time
We need to know that list_reverse is a length
preserving function in order to set up the above
recurrence equation!
By the way, this implementation is simply for the
purpose of illustration; it is very inefficient and
should NOT be used in practice.
*)
fun
list_reverse [] = []
|
list_reverse (x1 :: xs) = list_reverse(xs) @ [x1]

(* ****** ****** *)

(*
For binary search:
T(n) = T(n/2) + O(1)
Solution: T(n) = O(log(n)) // log-time
*)

(* ****** ****** *)

(*
For mergesort:
T(n) = 2*T(n/2) + O(n)
Solution: T(n) = O(n*log(n)) // log-linear
For k-way mergesort:
T(n) = k*T(n/k) + O(n)
Solution: T(n) = O(n*log(n)) // log-linear
*)

(* ****** ****** *)

(* End of [CS320-2023-Spring-lectures-time-complexities.sml] *)
