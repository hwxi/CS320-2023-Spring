(* ****** ****** *)
use "./../../MySolution/SML/assign09-02.sml";
(* ****** ****** *)

fun
fgenerator_next(fgen) =
(
case generator_next(fgen) of
  NONE =>
  raise StopIteration | SOME(x1) => x1
)

(* ****** ****** *)

fun
fgenerator_foreach
(fgen: 'a fgenerator, work: 'a -> unit) =
let
fun
loop(): unit =
let
val x1 =
fgenerator_next(fgen) in work(x1); loop()
end
in
  loop() handle StopIteration(*void*) => ()
end

(* ****** ****** *)

val ans1 =
foreach_to_forall
(fgenerator_foreach)
(fgenerator_make_stream
 (stream_tabulate(10, fn i => i+1)), fn i => i > 0)
val ((*void*)) = assert320(ans1)

(* ****** ****** *)

val ans2 =
foreach_to_forall
(fgenerator_foreach)
(fgenerator_make_stream
 (stream_tabulate(1000000000, fn i => i+1)), fn i => i mod 5 > 0)
val ((*void*)) = assert320(not(ans2))

(* ****** ****** *)

val () = print( "Assign09-02-test passed!\n" )

(* ****** ****** *)

(* end of [CS320-2023-Spring-assigns-assign09-02.sml] *)
