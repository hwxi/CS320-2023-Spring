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

fun echo() =
stream_foreach(stdin_input_lines(), fn(line) => print(line))

(* ****** ****** *)

(* end of [CS320-2023-Spring-lectures-InputStream.sml] *)
