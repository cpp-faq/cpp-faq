# L'inférence de type

**En cours d'écriture**

#### Sommaire

**En cours d'écriture**

## Que signifie auto dans les arguments d’une fonction ?

Depuis **C++14**, il est possible de créer des fonctions anonymes (*lambdas*) polymorphiques/génériques (*generic/polymorphic lambda functions*) à l’aide du mot clef `auto`.

Le compilateur peut inférer le type des arguments passé, et même en déduire le type de retour pour les fonctions lambdas :

```cpp
#include <complex>

using namespace std::literals::complex_literals;

auto add = [](auto a, auto b) { return a + b; };

std::cout << add(1.2, 5) << std::endl; // (1)
std::cout << add(0i, 1i) << std::endl; // (2)
```

Dans le premier appel *(1)*, les arguments déduits sont `double` et `int`, le type de retour est donc `double`. Dans le second cas (2), le compilateur déduit `std::complex<double>` pour les deux arguments et donc le type de retour.

Les *generic lambdas* sont donc l’équivalent d’une fonction template pour les lambdas (dans la fonction `add`, le compilateur lèverait une erreur si les types inférés ne supportaient pas l’addition). Le mot clef `auto` est ici utilisé pour préciser l’inférence de type pour les arguments de la fonction. Puisque le type de retour n’est pas précisé, celui-ci est également déduit à partir de l’expression du return.
