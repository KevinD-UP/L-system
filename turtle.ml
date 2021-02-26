type command =
| Line of int
| Move of int
| Turn of int
(*| Store
  | Restore inutilisé*)

type position = {
  x: float;      (** position x *)
  y: float;      (** position y *)
  a: int;        (** angle of the direction *)
}

(* Convertit un angle en radiant vers degré *)
let radiant_to_degree angle = 
  let pi = 2. *. asin 1. in
  pi *. float angle /. 180.0

(* Put here any type and function implementations concerning turtle *)

(* position initial de la tortue: position(x0, y0), tourné vers le nord *)
let init x0 y0 =
  {x = float x0;
   y = float y0;
   a = 0
  }

(* Calcule la position que la tortue atteint après l'execution d'une unique commande*)                                                          
let calculate_cmd command position =
  match command with
  | Turn n -> {position with a = (position.a + n)}
  | Line n  | Move n ->
    {x = position.x +. float n *. sin (radiant_to_degree position.a);
     y = position.y +. float n *. cos (radiant_to_degree position.a);
     a = position.a
    }

(* Calcul la position que la tortue atteint après l'execution d'une séquence de commande *)
(* depuis une position initiale *)
let calculate_cmds commands position = List.fold_right calculate_cmd commands position

type dessin = Dessin | Deplacement (*Modélise si la tortue dessine ou se déplace*)
type dessiner = dessin -> position -> unit

(* Fait exécuter à la tortue une commande et retourne la nouvelle position obtenue *)
let exec_cmd dessiner command position =
  let position' = calculate_cmd command position in
  match command with
  | Turn _ -> position'
  | Line _ -> let () = dessiner Dessin position' in position'
  | Move _ -> let () = dessiner Deplacement position' in position'

(* Fait exécuter à la tortue une liste de commande et retourne la position obtenue *)
let exec_mult_cmds dessiner commands position   =
  List.fold_right (exec_cmd dessiner) commands position
