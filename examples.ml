open Systems
open Turtle

(* Examples tirés du livre "The Algorithmic Beauty of Plants".
   Un exemple consiste en un axiome, un système de réécriture,
   et une interprétation. Pour plus d'exemples, voir les fichiers
   dans le répertoire examples/
*)

(* Pour l'exemple ci-dessous, ces trois symboles suffisent.
   A vous de voir ce que vous voudrez faire de ce type symbol ensuite.
*)

type symbol = A|P|M|B|C

(* snow flake  - Figure 3 du sujet *)
type 's symb = symbol system -> 's system

let snow : symbol system =
  let a = Symb A in
  let p = Symb P in
  let m = Symb M in
  {
    axiom = Seq [a;p;p;a;p;p;a];
    rules =
      (function
       | A -> Seq [a;m;a;p;p;a;m;a]
       | s -> Symb s
      );
    interp =
      (function
       | A -> [Line 30]
       | P -> [Turn 60]
       | M -> [Turn (-60)]
       | s -> [Move 0]
      )
  }

let br1 : symbol system =
  let a = Symb A in
  let p = Symb P in
  let m = Symb M in
  {
    axiom = Seq [a];
    rules =
      (function
        | A -> Seq [a; Branch(Seq [p;a]); a; Branch(Seq [m;a]); Branch(Seq[a])]
        | s -> Symb s
      );
    interp =
      (function
        | A -> [Line 10]
        | P -> [Turn 25]
        | M -> [Turn (-25)]
        | s -> [Move 0]
      )
  }


let br2 : symbol system =
  let a = Symb A in
  let p = Symb P in
  let m = Symb M in
  {
    axiom = Seq [a];
    rules =
      (function
        | A -> Seq [a; Branch(Seq [p;a]); a; Branch(Seq [m;a]); Branch(Seq[a])]
        | s -> Symb s
      );
    interp =
      (function
        | A -> [Line 10]
        | P -> [Turn 20]
        | M -> [Turn (-20)]
        | s -> [Move 0]
      )
  }

let br3 : symbol system =
  let a = Symb A in
  let p = Symb P in
  let m = Symb M in
  let b = Symb B in
  {
    axiom = Seq [a];
    rules =
      (function
        | A -> Seq [a;b; Branch(Seq [p;a]); a; Branch(Seq [m;a]); Seq[b;a]]
        | B -> Seq [b;b]
        | s -> Symb s
      );
    interp =
      (function
        | A -> [Line 5]
        | B -> [Line 5]
        | P -> [Turn 25]
        | M -> [Turn (-25)]
        | s -> [Move 0]
      )
  }

let dragon: symbol system =
  let a = Symb A in
  let p = Symb P in
  let m = Symb M in
  let b = Symb B in
  {
    axiom = Seq [a];
    rules =
      (function
        | A -> Seq [a;p;b;p]
        | B -> Seq [m;a;m;b]
        | s -> Symb s
      );
    interp =
      (function
        | A -> [Line 10]
        | B -> [Line 10]
        | P -> [Turn 90]
        | M -> [Turn (-90)]
        | s -> [Move 0]
      )
  }

let htree: symbol system =
  let a = Symb A in
  let p = Symb P in
  let m = Symb M in
  let b = Symb B in
  let c = Symb C in
  {
    axiom = Seq [a];
    rules =
      (function
        | A -> Seq [b; Branch(Seq[p;a]); m; a]
        | B -> Seq [c;c]
        | C -> Seq [b]
        | s -> Symb s
      );
    interp =
      (function
        | A -> [Line 10]
        | B -> [Line 14]
        | C -> [Line 10]
        | P -> [Turn 90]
        | M -> [Turn (-90)]
      )
  }



let koch : symbol system =
  let a = Symb A in
  let m = Symb M in
  let p = Symb P in
  {
    axiom = Seq [a;m;a;m;a;m;a];
    rules =
      (function
        | A -> Seq [a;m;a;a;p;a;a;p;a;p;a;m;a;m;a;a;p;a;p;a;m;a;m;a;a;m;a;a;p;a]
        | s -> Symb s
      );
    interp =
      (function
        | A -> [Line 10]
        | P -> [Turn 90]
        | M -> [Turn (-90)]
        | s -> [Move 0]
      )
  }

let koch1 : symbol system =
  let a = Symb A in
  let m = Symb M in
  let p = Symb P in
  let b = Symb B in
  {
    axiom = Seq [a;p;a;p;a;p;a];
    rules =
      (function
        | A -> Seq [a;p;b;m;a;a;p;a;p;a;a;p;a;b;p;a;a;m;b;p;a;a;m;a;m;a;a;m;a;b;m;a;a;a]
        | B -> Seq [b;b;b;b;b;b]
        | s -> Symb s
      );
    interp =
      (function
        | A -> [Line 10]
        | P -> [Turn 90]
        | M -> [Turn (-90)]
        | B -> [Move 10]
        | s -> [Move 0]
      )
  }
let koch2 : symbol system =
  let a = Symb A in
  let m = Symb M in
  let p = Symb P in
  {
    axiom = Seq [a;p;a;p;a;p;a];
    rules =
      (function
        | A -> Seq [a;a;p;a;p;a;p;a;p;a;p;a;m;a]
        | s -> Symb s
      );
    interp =
      (function
        | A -> [Line 10]
        | P -> [Turn 90]
        | M -> [Turn (-90)]
        | s -> [Move 0]
      )
  }


let cantor : symbol system =
  let a = Symb A in
  let m = Symb M in
  {
    axiom = Seq [a];
    rules =
      (function
        | A -> Seq [a;m;a]
        | M -> Seq [m;m;m]
        | s -> Symb s
      );
    interp =
      (function
        | A -> [Line 10]
        | M -> [Move 10]
        | _ -> [Line 0]
      )
  }

(*Liste des exemples dessinables*)
let ex = [
  ("snow",snow);
  ("br1",br1);
  ("br2",br2);
  ("br3",br3);
  ("cantor",cantor);
  ("koch",koch);
  ("koch1",koch1);
  ("koch2",koch2);
  ("htree",htree);
  ("dragon",dragon);

]

(*Liste des couleurs*)
let couleur = [
  (0,0xd6482a); 
  (1,0x1c5ecb); 
  (2,0xc61f7f);
  (3,0xffe10c);
  (4,0x43e314);
  (5,0x19dbb5);
  (6,0xff0078)
]

(* Renvoit la liste des noms des Lsystems disponible dans le fichier examples.ml*)
let retrieve_system_name l =
  let rec retrieve_system_name_aux acc = function
  | [] -> acc
  | h::q -> retrieve_system_name_aux ((fst h) :: acc) q
  in
  retrieve_system_name_aux [] l

(* Vérifie qu'un élement est dans une liste *)
let rec isIn x = function
  | [] -> false
  | h::q -> if h = x then true else isIn x q


(* Vérifie qu'une chaîne est un entier *)
let is_int s =
  try ignore (int_of_string s); true
  with _ -> false

(* Vérifie que le L-system dessiné est un des L-systems de Koch *)
let isKoch s = 
  let listKoch = ["koch"; "koch2"; "koch3"] in
  if isIn s listKoch then true 
  else false

(* Vérifie que le L-system dessiné est dragon*)
let isDragon s = 
  if s = "dragon" then true 
  else false
