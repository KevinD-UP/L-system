open Graphics
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

(** Put here any type and function implementations concerning systems *)


(* substitution: Effectue les substitutions sur un L-Systems*)
let substitution init sys i x restore  =
  let rec loop i init = function
    | Seq ws -> List.fold_left (loop i) init ws
    | Branch w -> let init' = loop i init w in restore init' init
    | Symb s ->
      if i > 0 then loop (i-1) init (sys.rules s) else x (sys.interp s) init
  in
  loop i init sys.axiom
