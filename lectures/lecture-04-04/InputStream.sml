(* ****** ****** *)

use "./../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

fun
stdin_input_lines
(): string stream = fn() =>
let
val lopt =
TextIO.inputLine(TextIO.stdIn)
in
case lopt of
  NONE => strcon_nil
| SOME(line) => strcon_cons(line, stdin_input_lines())
end

(* ****** ****** *)

(*
fun
echo(inputs: string stream): unit =
(
case inputs() of
  strcon_nil => println("Game Over!")
| strcon_cons(line, inputs) => (println(line); echo(inputs))
)
*)
fun
myecho() =
let
val inputs =
stdin_input_lines()
in
(stream_foreach(inputs, fn(line) => print(line)); println("Game Over!"))
end

(* ****** ****** *)

(* end of [CS320-2023-Spring-lectures-InputStream.sml] *)
