# La fonction main

### Sommaire

**En cours d'écriture**

## Qu'est-ce que la fonction main ?

La fonction ```main``` est le point d'entrée d'un programme C++. Le programme commence au début de la fonction et se termine à la fin (ou presque : [Quel processus ont lieu en dehors de la fonction main ?](https://github.com/cpp-faq/cpp-faq/tree/develop/faq/fr-FR/.faq/404.md)).

Un programme C++ doit être composé d'une et une seule fonction ```main```. Cette fonction doit être une fonction libre de l'espace de nom global et possède certaines particularités ([[EN] cppreference.com | Main function](http://en.cppreference.com/w/cpp/language/main_function)).

## Quels sont les prototypes autorisés pour la fonction main ?

La norme indique que la fonction ```main``` doit toujours retourner un ```int```. Ainsi la signature ```void main()``` est invalide.

Il existe deux prototypes définis par la norme :
 - ```int main()``` : fonction ```main``` sans paramètres.
 - ```int main(int argc, char* argv[])``` : fonction ```main``` avec arguments.

Dans la première version, les arguments du programme sont ignorés.

Dans la seconde, le premier argument est un entier contenant le nombre d'argument du programme (```argc``` signifiant **argument count**). Le second, ```argv```, est un tableau (C-style) de caractère contenant les différents arguments passés au programme (```argv``` signifiant **argument vector**).

Dans la très large majorité des plateformes, le nom du programme (ou plutôt le chemin de l'exécutable) est passé comme premier argument. Avec l'appel d'un programme sur Linux de cette manière, ```./prog --verbose -n=42 "hello"```, ```argv``` sera composé de cinq éléments : ```./prog```, ```--verbose```, ```-n=42``` et ```"hello"```.

Le standard C++ autorise également l'ajout d'arguments supplémentaires, définis par l'implémentation. La signature ```int main(int argc, char* argv[], char* envp[])``` est fréquente sur les systèmes supportant la norme POSIX, tels que Linux et permet de passer au programme les variables d'environnement.

*NOTE : la signature ```int main(void)``` est également valide puisqu'elle est strictement équivalente à ```int main()``` [Quelle est la différence entre foo() et foo(void)](github.com/cpp-faq/cpp-faq/tree/develop/faq/fr-FR/.faq/404.md).*

## Que dois-je mettre dans la fonction main ?

La question est complexe et dépends fortement du problème à traiter.
La fonction ```main``` devrait contenir la logique haut niveau du programme. Cela étant, il est très difficile de décrire plus précisément cette notion de "logique de haut niveau" dans le cas général.

Il y a deux cas extrêmes, qui eux même sont valable dans certaines situations :
 - Mettre la totalité du programme dans la fonction ```main``` : ce qui est justifiable si le programme se contente par exemple de retourner la somme de deux entiers sans aucune vérification :

 ```cpp
 #include <cstdlib> int main(int, char* argv[]) { return std::atoll(argv[1]) + std::atoll(argv[2])}
 ```

 - Utiliser une **God class**, c'est à dire une classe qui contient elle-même la logique haut-niveau de l'application : une application GUI *Qt* tourne souvent est souvent orientée autour de la classe ```QApplication``` et d'une fenêtre principale :

 ```cpp
 #include "MainWindow.hpp"
 #include <QApplication>

 int main(int argc, char *argv[])
 {
     QApplication app{argc, argv};
     MainWindow w;
     w.show();

     return app.exec();
 }
 ```

Entre ces deux extrêmes, il existe un multitude de manière d'organiser son programme et donc la fonction ```main```.

Souvent, la fonction ```main``` contient l'analyse des arguments, l'initialisation des ressources principales (fichier d'initialisation, connexion réseau, etc...) au travers d'appels de fonctions ou de classes.

 D'une manière générale, évitez les fonctions trop longues ([Pourquoi diviser un programme en fonction ?](https://github.com/cpp-faq/cpp-faq/tree/develop/faq/fr-FR/.faq/404.md])) et tenter de limiter les services rendus par une classe ([Que signifie penser une classe en termes de services plutôt que de données ?](https://github.com/cpp-faq/cpp-faq/tree/develop/faq/fr-FR/.faq/404.md)).

## Dois-je intercepter toutes les exception dans la fonction main ?

**En cours d'écriture**

## Puis-je utiliser le function-try-block avec la fonction main ?

**En cours d'écriture**
