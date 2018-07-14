# Les compilateurs

### Sommaire

**En cours d'écriture**

## Est-ce que mon compilateur supporte la dernière norme C++ ?

Tous les compilateurs n'ont pas un support complet du standard C++, cependant les compilateurs majeurs ont un très bon support des dernières normes et certains proposent des implémentations de certaines fonctionnalités à venir, proposées sous le namespace ```std::experimental```.

cppreference.com maintient [cette page](http://en.cppreference.com/w/cpp/compiler_support) qui tente de référencer le support des différentes parties du langage par les compilateurs majeurs.

Dans tous les cas, il est souhaitable de mettre à jour son compilateur quel qu'il soit à la dernière version de façon à profiter de toutes les dernières fonctionnalités et résolutions de bugs.

## Existe-t-il des compilateurs C++ en ligne ?

Il existe en effet plusieurs plateformes webs permettant de compiler du code C++ en ligne :
 - [http://coliru.stacked-crooked.com/](http://coliru.stacked-crooked.com/).
 - [http://cpp.sh/](http://cpp.sh/).
 - [https://www.onlinegdb.com/online_c++_compiler](https://www.onlinegdb.com/online_c++_compiler).
 - [https://www.jdoodle.com/online-compiler-c++](https://www.jdoodle.com/online-compiler-c++).
 - [https://www.tutorialspoint.com/compile_cpp_online.php](https://www.tutorialspoint.com/compile_cpp_online.php).
 - [https://www.onlinegdb.com/online_c++_compiler](https://www.onlinegdb.com/online_c++_compiler).
 - [http://rextester.com/l/cpp_online_compiler_gcc](http://rextester.com/l/cpp_online_compiler_gcc) et [http://rextester.com/l/cpp_online_compiler_visual](http://rextester.com/l/cpp_online_compiler_visual).

Les compilateurs en lignes constituent un bon moyen d'essayer un morceau de code ou de tester des fonctionnalité sans nécessiter la mise en place d'un environnement de programmation. Néanmoins, ils souffrent de certaines limitations et ne sont pas aussi configurable qu'un environnement personnel. Les bibliothèques tierces sont notamment difficile voir impossible à utiliser et la subdivision du programme en fichiers n'est que partiellement disponible. Évitez donc d'utiliser un compilateur en ligne pour un véritable projet.


## Quel est le meilleur compilateur C++ ?

## Qu'est ce que g++ ?

## Qu'est-ce que gcc et GCC ?

En général, **GCC** fait référence à *GNU Compiler Collection*, la suite de compilateur du projet *GNU (GNU's Not Unix)*, tandis que **gcc** correspond à *GNU C Complier*.

**gcc** et **g++**, font donc partie des compilateurs de la suite **GCC** respectivement pour les langages C et C++.

Ces définitions ne sont pas universelles. GCC signifiait également *GNU C Compiler* à l'origine, lorsqu'il consistait simplement en un compilateur C. GCC inclue maintenant des compilateurs pour les langages C, Fortran, C++, Ada et Go.
