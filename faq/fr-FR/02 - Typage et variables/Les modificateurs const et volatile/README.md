# Les modificateur const et volatile

### Sommaire

**En cours d'écriture**

## Que signifie le mot clef restrict ?

```restrict``` n'est **pas** un mot-clef en C++ et n'a aucune signification particulière, c'est un mot-clef spécifique au *langage C*.

En C, ```restrict``` est un qualificateur de type complémentaire à ```const``` et ```volatile```, qui est réservé aux pointeurs sur objets. Il permet d'indiquer au compilateur qu'il n'y a pas de risque de **pointer aliasing** avec un pointeur, c'est-à-dire qu'il peut sans crainte partir du principe que cette adresse mémoire ne chevauche pas avec une autre, et par conséquent lui permettre d'effectuer des optimisations supplémentaire. Si deux plages mémoire se chevauchent, il s'agit d'un *comportement indéterminé*.

Ce mot-clef n'existe pas en C++ et c'est d'ailleurs l'une des rares incompatibilités entre le C et le C++. Cela étant, certains compilateur proposent des extensions telles que ```__restrict__``` sur GCC et chez le compilateur d'IBM ou ```__restrict``` sur MSVC.

#### Liens et compléments
 - **[EN]** [cppreference.com | restrict type qualifier](https://en.cppreference.com/w/c/language/restrict)
 - **[EN]** [wikipedia.org | Restrict](https://fr.wikipedia.org/wiki/Restrict)
 - [Un programme C est-il valide en C++ ?](https://github.com/cpp-faq/cpp-faq/tree/develop/faq/fr-FR/.faq/404.md)

## Quelle est la différence entre const int et int const ?

```const int``` et ```int const``` sont strictement équivalents et désignent tous les deux un entier dont la valeur ne peut être modifiée. Le modificateur ```const``` qualifie l’élément directement à sa gauche et s’il n’y a rien à gauche, il s’applique à l’élément immédiatement à droite.

 Le choix de positionnement du mot clef const est une question de préférence pour les types simples et les référence (const int& et int const& sont équivalents également), mais il est primordial pour les pointeurs. En effet, si const int* et int const* sont équivalent, ce n’est pas le cas de int* const :
int main()
{
    int i{ 42 };
    int j{ 24 };

    int* p{ &i }; // Déclaration d'un pointeur sur un entier.
    (*p)++; // i vaut désormais 43.

    std::cout << i << std::endl;    

    const int* cp1{ &i }; // Déclaration d'un pointeur sur un entier constant.
    int const* cp2{ &j }; // Déclaration d'un pointeur sur un entier constant.

    // Les instructions (*cp1)++; et (*cp2)++; sont invalide : il n'est pas possible de modifier l'entier.
    cp2 = cp1; // cp2 pointe désormais sur l'entier pointé par cp1, donc sur i, qui vaut 43.
    // L'instruction p = cp1; est invalide : cp1 pointe sur un entier constant contrairement à p (conversion de const int* vers int*) même si p pointe déjà sur i.

    int* const pc{ &i }; // Déclaration d'un pointeur constant sur un entier.
    *pc = j; // i vaut désormais 24.
    // L'instruction pc = &j; est invalide : le pointeur est constant, c'est à dire qu'on ne peut plus changer l'adresse à laquelle il pointe.

    const int* const cpc1{ cp1 }; // Déclaration d'un pointeur constant sur un entier constant.
    // int const* const cpc1{ p }; <-- Equivalent.

    // Les instructions cpc1 = cpc2; et *cpc1 = 0; par exemple sont invalides.
}
La position du modificateur const est donc importante en ce qui concerne les pointeurs. La chose peut d’ailleurs rapidement se compliquer :  
int*const*const**const*const* a; // <- voici du code propre et compréhensible.
En fin de compte, const int et int const sont donc strictement équivalent. Des arguments existent en faveur de chaque notation (lisibilité, universalité …) et le choix est donc personnel (ou défini par les codings rules de votre entreprise). Comme toujours, peu importe le choix que vous faites, essayez de rester cohérent d’utiliser la même notation à chaque fois.

## Quelle est la différence entre const et constexpr ?

Le mot clef ```const``` permet de représenter la constance (l’immuabilité) d’un objet. Il est utilisé comme modificateur de type ou pour spécifier des fonctions membres constantes.

Le mot clef ```constexpr``` permet de déclarer des expressions constantes (constant expression), c’est-à-dire des expressions pouvant être évaluées à la compilation plutôt qu’à l’exécution. Une expression constante est implicitement const.
