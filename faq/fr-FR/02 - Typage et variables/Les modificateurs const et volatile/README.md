# Les modificateur const et volatile

### Sommaire

**En cours d'écriture**

## Que signifie le mot clef restrict ?

```restrict``` n'est **pas** un mot-clef en C++ et n'a aucune signification particulière, c'est un mot-clef spécifique au *langage C*.

En C, ```restrict``` est un qualificateur de type complémentaire à ```const``` et ```volatile```, qui est réservé aux pointeurs sur objets. Il permet d'indiquer au compilateur qu'il n'y a pas de risque de **pointer aliasing** avec un pointeur, c'est-à-dire qu'il peut sans crainte partir du principe que cette adresse mémoire ne chevauche pas avec une autre, et par conséquent lui permettre d'effectuer des optimisations supplémentaire. Si deux plages mémoire se chevauchent, il s'agit d'un *comportement indéterminé*.

Ce mot-clef n'existe pas en C++ et c'est d'ailleurs l'une des rares incompatibilités entre le C et le C++. Cela étant, certains compilateur proposent des extensions telles que ```__restrict__``` sur GCC et chez le compilateur d'IBM ou ```__restrict``` sur MSVC.

#### Liens et compléments
 - [[EN] cppreference.com | restrict type qualifier](https://en.cppreference.com/w/c/language/restrict)
 - [[EN] wikipedia.org | Restrict](https://fr.wikipedia.org/wiki/Restrict)
 - [Un programme C est-il valide en C++ ?](https://github.com/cpp-faq/cpp-faq/tree/develop/faq/fr-FR/.faq/404.md)
