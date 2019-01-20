# Les classes

**En cours d'écriture**

### Sommaire

**En cours d'écriture**

## Quelle est la différence entre class et struct ?

En C++, `class` et `struct` sont équivalent à l'exception des points suivants :

 - Les attributs d'une `class` sont privés par défaut tandis que ceux qu'une `struct` sont publics :

```cpp
#include <iostream>

struct S { int i{ 0 }; };

class C { int i{ 0 }; };

int main()
{
    S s;
    std::cout << s.i << std::endl; // Ok, S::i est public.
    C c;
    std::cout << c.i << std::endl; // Erreur, C::i est privé.
}
```

- L'héritage par défaut est `private` pour une `class` et `public` pour une `struct` :

```cpp
#include <iostream>

struct Base { int i{ 0 }; }; // i est public.

struct S : Base {}; // Héritage public, Base::i est public.

class C : Base {}; // Héritage privé, Base::i est privé.

int main()
{
    S s;
    std::cout << s.i << std::endl;
    C c;
    std::cout << c.i << std::endl;
}
```

Notez aussi que le mot clef `struct` ne peut pas être utilisé comme type template :

```cpp
template <typename T> // Ok.
struct A{ };

template <class T> // Ok.
struct B{ };

template <struct T> // Erreur, struct ne peut pas être utilisé comme type template.
struct C{ };
```

Mit à part ces différences, les classes introduites avec les mots clefs `struct` ou `class` peuvent toutes être des types POD, avoir des fonctions membres (incluant les constructeurs, le destructeur etc...), être utilisé pour de l'héritage de du polymorphisme etc...

#### Liens et compléments
 - [[EN] stackoverflow.com | What is the difference between enum struct and enum class?](https://stackoverflow.com/questions/38536571/what-is-the-difference-between-enum-struct-and-enum-class)
