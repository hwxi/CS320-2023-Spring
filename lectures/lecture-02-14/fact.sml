fun
list_reduce_left
( r0: 'r, xs: 'a list
, fopr: 'r * 'a -> 'r): 'r =
(
case xs of
  nil => r0
| x1 :: xs =>
  list_reduce_left(fopr(r0, x1), xs, fopr)
)

val fact10 =
list_reduce_left
(1, [1,2,3,4,5,6,7,8,9,10], fn(r, x) => r * x)
