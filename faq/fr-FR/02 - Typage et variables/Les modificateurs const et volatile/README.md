# Les modificateur const et volatile

### Sommaire

**En cours d'écriture**

## Que signifie le mot clef restrict ?

Le mot clef ```restrict``` n'est **pas** un mot-clef en C++ et n'a aucune signification particulière, c'est un mot-clef spécifique au *langage C*.

En C, ```restrict``` est un qualificateur de type complémentaire à ```const``` et ```volatile```, qui est réservé aux pointeurs sur objets. Il permet d'indiquer au compilateur qu'il n'y a pas de risque de **pointer aliasing** avec un pointeur, c'est-à-dire qu'il peut sans crainte partir du principe que cette adresse mémoire ne chevauche pas avec une autre, et par conséquent lui permettre d'effectuer des optimisations supplémentaire. Si deux plages mémoire se chevauchent, il s'agit d'un *comportement indéterminé*.

Ce mot-clef n'existe pas en C++ et c'est d'ailleurs l'une des rares incompatibilités entre le C et le C++. Cela étant, certains compilateur proposent des extensions telles que ```__restrict__``` sur GCC et chez le compilateur d'IBM ou ```__restrict``` sur MSVC.

#### Liens et compléments
 - **[EN]** [cppreference.com | restrict type qualifier](https://en.cppreference.com/w/c/language/restrict)
 - **[EN]** [wikipedia.org | Restrict](https://fr.wikipedia.org/wiki/Restrict)
 - [Un programme C est-il valide en C++ ?](https://github.com/cpp-faq/cpp-faq/tree/develop/faq/fr-FR/.faq/404.md)

## Quelle est la différence entre const int et int const ?

 Le modificateur ```const``` qualifie l’élément directement à sa gauche et s’il n’y a rien à gauche, il s’applique à l’élément immédiatement à droite. Les formes ```const int``` et ```int const``` sont donc strictement équivalents et désignent toutes les deux un entier dont la valeur ne peut être modifiée.

Le choix de positionnement du mot clef ```const``` est une question de préférence pour les types simples et les référence (```const int&``` et ```int const&``` sont équivalents également), l'important étant de rester cohérent et de garder une notation homogène. Pour les pointeurs le positionnement a de l'importance :

```cpp
int* p; // Déclaration d'un pointeur sur un entier.  

const int* cp1; // Déclaration d'un pointeur sur un entier constant.
int const* cp2; // Déclaration d'un pointeur sur un entier constant.

int* const pc{ &i }; // Déclaration d'un pointeur constant sur un entier.

const int* const cpc1{ cp1 }; // Déclaration d'un pointeur constant sur un entier constant.
int const* const cpc2{ cp1 }; // Déclaration d'un pointeur constant sur un entier constant.
}
```

La position du modificateur ```const``` a donc une signification en ce qui concerne les pointeurs. La chose peut d’ailleurs rapidement se compliquer :
```cpp
int* const* const** const* const* ptr; // Cas extrème.
```

## Quelle est la différence entre const et constexpr ?

Le mot clef ```const``` permet de représenter la constance (l’immuabilité) d’un objet. Il est utilisé comme modificateur de type ou pour spécifier des fonctions membres constantes.

Le mot clef ```constexpr``` permet de déclarer des expressions constantes (constant expression), c’est-à-dire des expressions pouvant être évaluées à la compilation plutôt qu’à l’exécution. Une expression constante est implicitement const.
