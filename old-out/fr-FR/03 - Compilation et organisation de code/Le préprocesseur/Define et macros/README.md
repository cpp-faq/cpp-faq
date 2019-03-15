# Defines et macros

### Sommaire

**En cours d'écriture**

## A quoi servent #define et #undef en C++ ?

La directive `#define` permet l'introduction de nouveaux identifiants préprocesseurs, généralement appelés "macros". On distingue les *object-like macros* et les *function-like macros* :

```cpp
#define PI 3.1415 // object-like macro correspondant à la valeur PI
#define MUL(a, b) ((a) * (b)) // function-like macro multipliant les deux paramètres.

std::cout << MUL(PI, PI) << '\n'; // affiche : 9.86902
```

La directive `#undef` permet de supprimer la déclaration d'un identifiant préprocesseur. Si celui-ci n'est pas défini, la directive est ignorée :

```cpp
#define MUL(a, b) ((a) * (b))

std::cout << MUL(3, 2) << '\n';

#undef MUL

std::cout << MUL(4, 3) << '\n'; // Erreur : le symbole MUL n'est pas défini.

#undef MUL // MUL n'est pas défini, la directive est sans effet.
```

#### Liens et compléments
- **[EN]** [cppreference.com | Replacing text macro](https://en.cppreference.com/w/cpp/preprocessor/replace)

## Comment déclarer une fonction macro en C++ ?

La déclaration d'une *function-macro* en C++ se fait à l'aide de la directive `#define` en suivant la syntaxe suivante :

```cpp
#define nom(arg1, arg2) <code>
```

Par exemple, la macro `MAX` suivante permettra d'obtenir le maximum entre deux éléments :

```cpp
#define MAX(a, b) (((a) > (b))? (a) : (b))

auto i = 24;
std::cout << MAX(21, i) << '\n';
// remplacement : std::cout << (((21) > (i))? (21) : (i)) << '\n';
```

Vous constatez qu'ici, des parenthèses qui peuvent sembler superflue sont présentes. Celles-ci de gérer les cas où les arguments sont plus complexes que des littéraux ou des noms de variables. Avec une macro `MULTIPLY`, le problème se présente couramment :

```cpp
#define MULTIPLY(a, b) (a * b)
#define MULTIPLY_S(a, b) ((a) * (b))

std::cout << MULTIPLY(21 + 33, 6) << '\n';
// affiche 219 : std::cout << (21 + 33 * 6) << '\n';
std::cout << MULTIPLY_S(21 + 33, 6) << '\n';
// affiche 324 : std::cout << ((21 + 33) * (6)) << '\n';
```

#### Liens et compléments
- **[EN]** [cppreference.com | Replacing text macro](https://en.cppreference.com/w/cpp/preprocessor/replace)

## Peut-on écrire une macro sur plusieurs lignes ?

Pour écrire une macro sur plusieurs ligne, il faut utiliser le fait que lorsqu'une ligne se termine par le caractère '\' (sauf si on est dans un commentaire ou une chaîne de caractère bien entendu), le préprocesseur va accoler la lignes suivante à la suite de cette ligne (il va supprimer le saut de ligne) :

```cpp
#define DO_X_TIME(n, code) for(auto i = 0; i < (n); ++i) {\
    code\
  }

DO_X_TIME(5, std::cout << "Bonjour !\n";);
// étendu en : for(auto i = 0; i < (5); ++i) {    std::cout << "Bonjour !\n";    }
```

#### Liens et compléments
- **[EN]** [cppreference.com | Replacing text macro](https://en.cppreference.com/w/cpp/preprocessor/replace)

## Quels sont les identifiants autorisés pour les macros ?

Les identifiants de macros suivent pratiquement les mêmes règles que les identifiants classiques C++ :
 - Ils sont composés des caractères alphanumériques (a-z, A-Z, 0-9) et de l'underscore `_` et ne peuvent pas commencer par un chiffre.
 - Les identifiants commençant par un underscore `_` suivit d'une majuscule ou contenant deux underscore jusxtaposés sont reservés.
 - Les mot-clefs et les identifiants reservés (`override`, `final`) ne peuvent être utilisés, à l'exception de `likely` et `unlikely` (introduits avec **C++20**).
 - Les identifiants standard ne peuvent pas être redéfinis (`__LINE__` ou `__cplusplus` par exemple). Notez qu'il n'est pas autorisé d'utiliser `#undef` sur les macros standards.

#### Liens et compléments
 - **[EN]** [cppreference.com | Replacing text macro](https://en.cppreference.com/w/cpp/preprocessor/replace)

## Quelles sont les différences entre les fonctions classiques et les fonctions macros ?

TODO()

## Comment déclarer une macro variadique ?

Depuis **C++11**, il est possible de déclarer une macro variadique en ajoutant `...` comme dernier argument, de la même manière que pour les fonctions variadiques :

```cpp
#define ADD_NULLPTR(fct_name, ...)  fct_name(nullptr, __VA_ARGS__)

ADD_NULLPTR(bar, 32, "Hello", 18 + 1)
// donne : bar(nullptr, 32, "Hello", 18 + 1)
ADD_NULLPTR(bar, do_something(33))
// donne : bar(nullptr, do_something(33))
```

Ici, `__VA_ARGS__` correspond aux arguments variables de la macro. Les arguments sont étendus et séparé par une virgule.

Avant **C++20**, il était obligatoire d'avoir au moins un élément variadique dans une fonction macro variadique (`ADD_NULLPTR()` n'était pas autorisé). **C++20** autorise que __VA_ARG__ soit vide et introduit `__VA_OPT__`, qui est remplacé par son argument que dans le cas où il y a au moins un élément variadique :

```cpp
#define ADD_NULLPTR(fct_name, ...)  fct_name(nullptr __VA_OPT__(,) __VA_ARGS__)

ADD_NULLPTR(bar, 32, "Hello", 18 + 1)
// donne : bar(nullptr, 32, "Hello", 18 + 1)
ADD_NULLPTR()
// donne : bar(nullptr)

#define INHERIT(...) __VA_OPT__( : __VA_ARGS__)

class A INHERIT() {};
// donne : class A {};
class B INHERIT(A, C) {};
// donne : class B : A, C {};
```

## A quoi sert l'opérateur # du préprocesseur ?

L'opérateur `#`, dans une *function-macro*, permet de transformer un jeton préprocesseur en chaîne de caractères entourée par des guillemets :

```cpp
#define STR(x) #x

std::cout << STR(Hello world!\n);
// donne : std::cout << "Hello World!\\n";
std::cout << STR({"name" : "C++"}\n);
// donne : std::cout << "{\"name\" : \"C++\"}\\n";
```

Lorsqu'il est accolé à `__VA_ARGS__`, dans une fonction macro variadique, la totalité de `__VA_ARGS__` est convertie en chaîne de caractère :

```cpp
#define FOO(...) std::cout << #__VA_ARGS__
FOO(12.0, "\n", 32, std::make_pair(2, 2));
// Donne : std::cout << "12.0, \"\\n\", 32, std::make_pair(2, 2)";
```

#### Liens et compléments
- **[EN]** [cppreference.com | Replacing text macro](https://en.cppreference.com/w/cpp/preprocessor/replace)

## Comment concaténer deux jetons préprocesseurs ?
  => alias : "A quoi sert l'opérateur ## du préprocesseur ?"

L'opérateur `##` du préprocesseur permet la concaténation de jetons préprocesseurs. Ci-suit un exemple d'utilisation :

```cpp
#define CREATE_MUL(type) type multiply_##type(type x, type y) {\
  std::cout << "Multiplying " #type << '\n';
  return x * y;\
}\

CREATE_MUL(int)
// donne : int multiply_int(int x, int y) { std::cout << "Multiplying " "int" << '\n'; return x * y;}
CREATE_MUL(float)
// donne : float multiply_float(float x, float y) { std::cout << "Multiplying " "float" << '\n'; return x * y;}

int main()
{
    std::cout << multiply_int(12.0, 33.5) << '\n';
    std::cout << multiply_float(12.0, 33.5) << '\n';
}
/* Affiche :
Multiplying int
396
Multiplying float
402 */
```

La concaténation des jetons doivent former un jeton préprocesseur valide. Notez que les symboles préprocesseurs ne sont pas évalués avant la concaténation. Si vous souhaitez une évaluation des paramètres, il faut passer par une macro intermédiaire qui se chargera de l'expansion des paramètres :

```cpp
#define CONCAT_(x, y) x ## _ ## y
// Macro intermédiaire dans laquelle les paramètres seront évalués :
#define CONCAT(x, y) CONCAT_(x, y)

#define A VALUE_A
#define B VALUE_B

CONCAT_(A, B) // Les paramètres ne sont pas évalués, donne : A_B
CONCAT(A, B) // Les paramètres sont évalués puis passés à CONCAT_, donne : VALUE_A_VALUE_B
```
