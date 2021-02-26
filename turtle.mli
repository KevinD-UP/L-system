
(** Turtle graphical commands *)
type command =
| Line of int      (** advance turtle while drawing *)
| Move of int      (** advance without drawing *)
| Turn of int      (** turn turtle by n degrees *)

(** Position and angle of the turtle *)
type position = {
  x: float;        (** position x *)
  y: float;        (** position y *)
  a: int;          (** angle of the direction *)
}

(** Put here any type and function signatures concerning turtle *)
type dessin = Dessin | Deplacement
type dessiner = dessin -> position -> unit

val init : int -> int -> position

val calculate_cmd : command -> position -> position

val calculate_cmds: command list -> position -> position

val exec_cmd : dessiner -> command -> position -> position

val exec_mult_cmds : dessiner -> command list -> position -> position
