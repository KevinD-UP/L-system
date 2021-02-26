(** Words, rewrite systems, and rewriting *)

type 's word =
  | Symb of 's
  | Seq of 's word list
  | Branch of 's word

type 's rewrite_rules = 's -> 's word

type 's system = {
    axiom : 's word;
    rules : 's rewrite_rules;
    interp : 's -> Turtle.command list }

(** Put here any type and function interfaces concerning systems *)
(*val lazy_fold : 's system -> int -> (Turtle.drawer -> Turtle.command list -> Turtle.position -> Turtle.position) -> Turtle.position -> (int -> int -> Turtle.position) -> unit*)
  val substitution : 'b -> 'a system ->int ->(Turtle.command list -> 'b -> 'b) -> ('b -> 'b -> 'b) -> 'b
