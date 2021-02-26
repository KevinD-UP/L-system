# Identifiants
DANG Kévin, @dang, 71801283 

PHOTHIRATH Anthony, @phothirath, 71702143
# Fonctionnalités
## Sujet minimal
Voici la liste des fonctionnalités par rapport au sujet minimal qui ont été réalisés (pour plus de clarté nous allons reprendre point par point le sujet minimal):
* 1 - Le projet est présenté sous la même forme que proposé de base c'est-à-dire réparti en plusieurs fichiers *.ml* avec leurs fichier interfaces *.mli*, prêt à compiler en tapant `make`.
* 2 - L'ensemble des L-systèmes a été cablé en dur dans le fichier `example.ml`.
* 3 - Nous interprétons les chaînes parenthésées en suites de **commandes** pour la Tortue. 
* 4 - Nous utilisons la librairie **Graphics** d'OCmal pour réalisé le dessin.
* 5 - Nous affichons une animation qui correspond à une suite jusqu'a la profondeur souhaitée
* 6 - Une tentative de calcul automatique pour choisir une échelle raisonnable a été implémentée mais est un peu bancale donc pas tout à fait fonctionnelle. En effet, notre implémentation dépend du L-System dessiné. Certains grandissant de façon exponentielle, nous avons eu du mal à équilibré les échelles entre ces L-System et d'autre grandissant plus lentement. Nous avons décider de dégager les L-systems de *Koch* et *dragon* comme étant des cas particulier, le premier grandissant très vite et le deuxième très lentement.
* 7 - Enfin nous avons évidemment veillé à respecter les principes de bases de la programmation avec des noms de variables et de fonctions parlantes, et des commentaires uniquement lorsque nécessaire. 

## Extensions réalisés
Nous avons pu réaliser deux extensions:
* La première a introduit les figures en *couleur* tout simplement.
* La deuxième permet, via la librairie `Graphicspdf`, d'enregistrer sous format **PDF** le résultat visuel d'une itération.

# Compilation et exécution
Pour compiler le projet, il suffit de taper:
```make```

Pour l'exécution nous prenons les arguments de la forme:

```./run [Nom d'un l-System] [profondeur]```

Exemple:
```./run snow 4```
```./run dragon 12```

`./run` prend également en argument la commande `-help` (ou `--help`) qui rappel la procédure d'exécution et affiche également la liste des L-systems dessinables.
Une librairie externe appelé `Graphicspdf` a été utilisé pour exporter le dessin vers un format **PDF**:

* Dépôt Github: https://github.com/johnwhitington/graphicspdf

Cette dernière dépend également d'une autre librairie appelé camlpdf:

* Dépôt Github: https://github.com/johnwhitington/camlpdf
* Documentation de l'API: https://www.coherentpdf.com/camlpdf/

Ces deux librairies ont été installés via la commande suivante:

```opam install graphicspdf```

Pour assurer la conversion du dessin en pdf et pour terminer le programme en général, cliquer n'importe où appuyer sur n'importe quel touche.

`Eviter de passer par le bouton croix rouge qui ne réalisera pas la conversion vers le pdf`

# Découpage modulaire
Nous avons travaillé uniquement grâce à l'embryon de projet proposé. Voici les traitements pris en charge par chaques modules du projet:
* **turtle.ml**: Ce module prend en charge tout les calculs de position de la tortue lors de l'execution d'une ou de plusieurs commandes. Elle ne se charge donc pas de dessiner mais de déterminer les futurs position de la tortue.
* **systems.ml**: Ce module possède une unique fonction qui étant donné un L-systeme effectue les substitutions correspondant.
* **examples.ml**: Ce module contient les L-systèmes cablés en dur, une liste de paire (nom, l-system) regroupant tout les L-systems dessinable ainsi que des fonctions usuelles sur cette liste. Elle contient également une liste de couleur pour la couleur des lignes dessinés.
* **main.ml**: Le module principal se charge donc de l'affichage et de la réalisation des dessins ainsi que de la conversion en PDF en vérifiant au préalable l'existence des arguments.

# Organisation du travail
En partant de l'embryon du programme proposé, nous avons d'abord voulu accomplir le plus rapidement possible le sujet minimal et en plus, nous voulions avoir la possibilité de pouvoir le tester sur différents L-Systems. 
Un étudiant s'est d'abord chargé de la théorie et comment était effectuer les substitions dans les L-Systems tandis que l'autre a commencer à câblé quelques exemples supplémentaires et à initialiser la fenêtre et le dessin.

Nous avons ensuite mis en commun nos travails afin de répondre au sujet minimal.

Pour ensuite compléter le projet nous avons choisis des extensions dont nous étions sûrs de pouvoir réaliser rapidement (c'est-à-dire la conversion vers un PDF et les couleurs). Deux extensions donc nous nous les sommes réparties entre nous évidemment.

Enfin tout au long du projet, nous nous sommes évertuer à relire le code du camarade afin de corriger des commentaires ou changer des noms de variables afin d'être plus lisible et compréhensible.

# Misc
Voici une liste de chose de choses que nous aurions aimer améliorer:
 * Faire en sorte d'avoir un meilleur redimensionnement pour les L-systems dont la taille augmente très rapidement.
 * Pouvoir écrire un analyseur permettant de charger des données depuis un fichier.
