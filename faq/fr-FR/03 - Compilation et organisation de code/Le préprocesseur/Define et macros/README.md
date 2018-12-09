# Defines et macros

### Sommaire

**En cours d'écriture**

## Qu'est-ce qu'une macro en C++ ?

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

## Peut-on écrire une macro sur plusieurs lignes ?

Pour écrire une macro sur plusieurs ligne, il faut utiliser le fait que lorsqu'une ligne se termine par le caractère '\' (sauf si on est dans un commentaire ou une chaîne de caractère bien entendu), le préprocesseur va accoler la lignes suivante à la suite de cette ligne (il va supprimer le saut de ligne) :

```cpp
#define DO_X_TIME(n, code) for(auto i = 0; i < (n); ++i) {\
    code\
  }

DO_X_TIME(5, std::cout << "Bonjour !\n";);
// étendu en : for(auto i = 0; i < (5); ++i) {    std::cout << "Bonjour !\n";    }
```

## Quelles sont les différences entre les fonctions classiques et les fonctions macros ?

## Comment déclarer une macro variadique ?

## A quoi sert l'opérateur # du préprocesseur ?

L'opérateur `#`, dans une *function-macro*, permet de transformer un jeton préprocesseur en chaîne de caractères entourée par des guillemets :

```cpp
#define STR(x) #x

std::cout << STR(Hello world!\n);
// donne : std::cout << "Hello World!\n";
std::cout << STR({"name" : "C++"}\n);
// donne : std::cout << "{\"name\" : \"C++\"}\n";
```

#### Liens et compléments
- **[EN]** [cppreference.com | Replacing text macro](https://en.cppreference.com/w/cpp/preprocessor/replace)

## Comment concaténer deux jetons préprocesseurs ?
  => alias : "A quoi sert l'opérateur ## du préprocesseur ?"
