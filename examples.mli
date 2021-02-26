(* Examples tirés du livre "The Algorithmic Beauty of Plants".
   Un exemple consiste en un axiome, un système de réécriture,
   et une interprétation. Pour plus d'exemples, voir les fichiers
   dans le répertoire examples/
*)

(* Pour l'exemple ci-dessous, ces trois symboles suffisent.
   A vous de voir ce que vous voudrez faire de ce type symbol ensuite.
*)

type symbol = A|P|M|B|C

type 's symb = symbol Systems.system -> 's Systems.system
(* snow flake  - Figure 3 du sujet *)

val snow : symbol Systems.system

val br1 : symbol Systems.system

val br2 : symbol Systems.system

val br3 : symbol Systems.system

val koch : symbol Systems.system

val koch1 : symbol Systems.system

val koch2 : symbol Systems.system

val dragon : symbol Systems.system

val htree : symbol Systems.system

val cantor : symbol Systems.system

val ex : (string * symbol Systems.system) list

val couleur : (int * int) list

val isIn : 'a -> 'a list -> bool

val retrieve_system_name: ('a * 'b) list -> 'a list

val is_int: string -> bool

val isKoch: string -> bool

val isDragon: string -> bool