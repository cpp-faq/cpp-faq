# Les opérateurs

**En cours d'écriture**

#### Sommaire

**En cours d'écriture**

## Est-ce que a += b; est équivalent à a = a + b; ?

En général ces deux constructions sont équivalentes (et il en va de même pour les opérateurs `++`, `*=`, `|=` etc...).

Cependant, si l'expression a contient un effet de bord, alors on peut observer un comportement différent puisque l'expression `a` est évaluée deux fois dans `a = a + b;` contre une fois pour `a += b;`.

## Quelle est la différence entre ++i et i++ ?

`++i` et `i++` sont respectivement les opérateurs de *pré-incrémentation* et de *post-incrémentation*.

Avec la *pré-incrémentation*, la variable `i` est incrémentée et l’expression vaut la nouvelle valeur de `i` :

```cpp
int i{};
std::cout << ++i << std::endl; // affiche 1.
std::cout << i << std::endl; //   affiche 1.
```

Pour la *post-incrémentation*, la variable est incrémentée mais l’expression équivaut à la valeur de la variable avant son incrémentation :

```cpp
int i{};
std::cout << ++i << std::endl; // affiche 0.
std::cout << i << std::endl; //   affiche 1.
``` 	

Il est souvent conseillé de privilégier la pré-incrémentation puisque celle-ci [est toujours au moins aussi rapide](404.md) que la post-incrémentation. Cependant, la post-incrémentation a parfois des usages très clairs :

```cpp
std::size_t strlen(const char* s)
{
    std::size_t size{};

    while(*(s++) != '\0') // La post-incrémentation s’impose dans ce cas de manière à s'assurer de tester le premier caractère.
        ++size; // Ici, les deux formes incrémentation sont utilisable, la pré-incrémentation est donc privilégiée.

    return size;      
}
```

De plus, la post-incrémentation a une priorité supérieure à la post-incrémentation. Ces explications sont également valables pour la pré/post-décrémentation.

## Quelle est la priorité des différents opérateurs C++ ?

Ce [tableau](https://en.cppreference.com/w/cpp/language/operator_precedence) sur *cppreference.com* donne la priorité et l'associativité des différents opérateurs.

#### Liens et compléments
- **[EN]** [cppreference.com | Operator Precedence](https://en.cppreference.com/w/cpp/language/operator_precedence)
