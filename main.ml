open Graphics
open Lsystems (* Librairie regroupant le reste du code. Cf. fichier dune *)
open Systems (* Par exemple *)
open Turtle
open Examples
open Unix

(* Création de la fenêtre *)
let create_window w h =
  open_graph (" " ^ string_of_int w ^ "x" ^ string_of_int h);
  auto_synchronize false

(* Fermeture de la fenetre: clic ou appuie sur une touche*)
let close_after_event () =
  ignore (wait_next_event [Button_down ; Key_pressed])

open Lsystems (* Librairie regroupant le reste du code. Cf. fichier dune *)
open Systems (* Par exemple *)
open Turtle

(** Gestion des arguments de la ligne de commande.
    Nous suggérons l'utilisation du module Arg
    http://caml.inria.fr/pub/docs/manual-ocaml/libref/Arg.html
*)

let usage = (* Entete du message d'aide pour --help *)
  "Interpretation de L-systemes et dessins fractals\n
  ./run [LSYSTEM] [DEPTH]: Draw a Lsystem with the depth given\n
  List of available L-system:\n  snow\n  br1\n  br2\n  br3\n  cantor\n  koch1\n  koch2\n  koch3\n  htree\n  dragon\n"

let action_what () = Printf.printf "%s\n" usage; exit 0

let cmdline_options = [
("--what" , Arg.Unit action_what, "Display description");
]


let extra_arg_action = fun s ->
  if not (isIn s (Examples.ex |> retrieve_system_name)) && not (is_int s) then failwith ("Argument inconnu :"^s)

let w = 1920;; (* largeur standard*)
let h = 1080;; (* hauteur standard*)

(* Fonction principal qui dessine le L-system*)
let dessine drawing s i =
  let init = 
    if isDragon Sys.argv.(1) then init (w/2) (h/2) 
    else if isKoch Sys.argv.(1) then if i < 3 then init (w/2) (h/2) else init (w*2) (h*2)
    else init (w/2) 300 in
  let commands_list = exec_mult_cmds drawing in
  let restore = (fun _ position  -> let () = drawing Deplacement position in position) in
  let () = drawing Deplacement init in
  let res = substitution init s i commands_list restore in ()

let sys (s :symbol system) =
  {
    axiom = s.axiom;
    rules = s.rules;
    interp = s.interp;
  }

(* Dessine ou survole en fonction de types *)
let drawing i types position =
  let resize = 
    if isDragon Sys.argv.(1) then 1 
    else if isKoch Sys.argv.(1) then 
      if i < 3 then 1 else (2+i/2) 
    else if i <= 5 then 1 else 2 in
  let redim = resize in
  set_line_width 1;
  set_color (List.assoc (Random.int(6)) Examples.couleur);
  if types = Dessin then
    lineto ((Float.to_int position.x)/redim) ((Float.to_int position.y)/redim)
  else if types = Deplacement then
    moveto ((Float.to_int position.x)/redim) ((Float.to_int position.y)/redim)

(* Dessine dans le pdf*)
let drawingPDF i types position =
  let resize = 
    if isDragon Sys.argv.(1) then 1 
    else if isKoch Sys.argv.(1) then 
      if i < 3 then 1 else (2+i/2) 
    else if i <= 5 then 1 else 2 in
  let redim = resize in
  Graphicspdf.set_line_width 1;
  Graphicspdf.set_color (List.assoc (Random.int(6)) Examples.couleur);
  if types = Dessin then
    Graphicspdf.lineto ((Float.to_int position.x)/redim) ((Float.to_int position.y)/redim)
  else if types = Deplacement then
    Graphicspdf.moveto ((Float.to_int position.x)/redim) ((Float.to_int position.y)/redim)

let main () =
  Arg.parse cmdline_options extra_arg_action usage;

  create_window w h;
  clear_graph();
  let syst = List.assoc (Sys.argv.(1)) Examples.ex in
  let z = sys(syst) in
  let iter = int_of_string Sys.argv.(2) in
  for i = 0 to iter do
    dessine (drawing iter) z i;
    synchronize();
    Unix.sleep 1;
    clear_graph();
  done;
  close_after_event();
  Printf.printf "Le dessin a été convertie vers le fichier lsystem.pdf\n";
  Graphicspdf.open_pdf "lsystem.pdf";
  Graphicspdf.open_graph "1920x1080";
  Graphicspdf.set_window_title "lsystem in pdf";
  dessine (drawingPDF iter) z iter;
  Graphicspdf.close_graph ()



(** On ne lance ce main que dans le cas d'un programme autonome
    (c'est-à-dire que l'on est pas dans un "toplevel" ocaml interactif).
    Sinon c'est au programmeur de lancer ce qu'il veut *)

let () = if not !Sys.interactive then main ()
