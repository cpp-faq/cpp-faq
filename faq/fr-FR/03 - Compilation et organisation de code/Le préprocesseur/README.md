# Le préprocesseur

### Sommaire

**En cours d'écriture**


## Quelles sont les directives préprocesseur existantes en C++ ?

Le C++ compte 12 directives préprocesseur en C++ :

 - `define` et `undef`,
 - `include`,
 - `if`, `ifdef`, `ifndef`, `else`, `elif` et `endif,`
 - `line`,
 - `error`,
 - `pragma`.

#### Liens et compléments
 - **[EN]** [cppreference.com | Preprocessor](https://en.cppreference.com/w/cpp/preprocessor)

## A quoi servent #define et #unsef en C++ ?

## A quoi sert la directive #include en C++ ?

`#include` est la directive préprocesseur permettant l'inclusion d'un fichier source :

```cpp
#include <iostream> // inclusion de l'entête standard <iostream>
#include "MyList.h" // inclusion d'un entête.
```

Cette directive est principalement utilisée pour inclure des fichiers d'entête, qu'ils soient locals, standard ou viennent d'une bibliothèque tierce. 

## Quelle est la différence entre #include <header> et #include "header" ?

## A quoi sert \__has_include() en C++ ?

## A quoi sert la directive #error en C++ ?

`#error` permet de déclencher une erreur lors du passage du préprocesseur. Il met fin au processus de compilation qui termine avec le message d'erreur précisé :

```cpp
// gcc 8.1 : error: #error Windows non supported in this version
// clang 5 : error: Windows non supported in this version
// MSVC 19.12 : C1189 : #error: Windows not supported in this version
#ifdef Windows
#error Windows non supported in this version
#endif
```

Certains compilateurs supportent `#warning` permettant de ne déclencher qu'un avertissement, mais cette directive n'est pas standard.

#### Liens et compléments
 - **[EN]** [cppreference.com | #error](https://en.cppreference.com/w/cpp/preprocessor/error)

## A quoi sert la directive #pragma en C++ ?

## Qu'est ce que la directive \_Pragma() ?

## A quoi servent #if, #elif et #else ?

## A quoi correspondent #ifdef et #ifndef ?

## Dois-je privilégier les header guards ou #pragma once ?

## Qu'est-ce que les opérateurs alternatif en C++ ?

Le **C++** propose un certain nombre d'opérateurs alternatifs permettant de remplacer certains symboles qui ne sont pas accessible sur certains claviers n'utilisant pas la norme ASCII 7-bits :

 - `&&` : `and`.
 - `||` : `or`.
 - `!`  : `not`.
 - `&` : `bit_and`.
 - `|` : `bit_or`.
 - `^` : `xor`.
 - `~` : `compl`.
 - `&=` : `and_eq`.
 - `|=` : `or_eq`.
 - `!=` : `not_eq`.
 - `^=` : `xor_eq`.

Les *opérateurs alternatifs* font parties des *jetons alternatifs*, avec les digraphes.

#### Liens et compléments
 - **[EN]** [cppreference.com | Alternative operator representations](https://en.cppreference.com/w/cpp/language/operator_alternative)

## Dois-je privilégier les opérateurs alternatifs (and) aux opérateurs classiques (&&) ?

Les **opérateurs alternatifs** sont très peu utilisés de nos jours. Les développeurs sont largement plus habitué à l'utilisation des opérateurs classiques qu'à leur équivalent sous forme de mot clefs.

Il est donc conseillé d'utiliser les opérateurs classiques plutôt que les opérateurs alternatifs puisque ceux qui liront votre code seront plus à l'aise avec les premiers, ce qui facilitera la compréhension et la maintenance de votre code.

## Qu'est ce que les digraphes en C++ ?

Les **digraphes** sont des *jetons alternatifs* au même titre que les *opérateurs alternatifs*. Les digraphes permettent de remplacer des symboles de ponctuation plutôt que des opérateurs :

| Digraphe | Symbole |
|:--------:|:-------:|
|    <%    |    {    |
|    %>    |    }    |
|    <:    |    [    |
|    :>    |    ]    |
|    %:    |    #    |
|   %:%:   |   ##    |

Ci suit un exemple de code C++ utilisant les digraphes :

```cpp
%:include <iostream>

int main(int argc, char* argv<::>)
<%
  std::cout << "Hello World !n";
%>
```

#### Liens et compléments
 - **[EN]** [cppreference.com | Alternative operator representations](https://en.cppreference.com/w/cpp/language/operator_alternative)

## Qu'est-ce que les trigraphes en C++ ?

Les trigrahes (supprimés avec **C++17**), sont des jetons préprocesseurs à trois symboles remplaçant certains symboles qu'il n'était pas possible de faire avec certains anciens claviers non standards :

| Trigraphe | Symbole |
|:---------:|:-------:|
|    ??<    |    {    |
|    ??>    |    }    |
|    ??(    |    [    |
|    ??)    |    ]    |
|    ??=    |    #    |
|    ??/    |    \    |
|    ??'    |    ^    |
|    ??!    |  \barre  |
|    ??-    |    ~    |


Les trigraphes sont remplacés avant la reconnaissance des commentaires et des chaînes de caractères. Certains comportements inattendus peuvent se produire à cause des trigraphes :

```cpp
// Will this line be executed ????/
std::cout << "Hello";
```

Dans l'exemple ci-dessus, le trigraphe `??/` à la fin du commentaire est transformé en `\`. La ligne suivant avec `std::cout` est donc accolée à la ligne précédente et l'instruction fait alors partie du commentaire et n'est pas exécutée (ni même compilée).

Ci-suit un exemple de code C++ utilisant les trigraphes :

```cpp
??=include <iostream>

int main(int argc, char* argv??(??))
??<
  std::cout << "Hello World !??/n";
??>
```

#### Liens et compléments
 - **[EN]** [cppreference.com | Alternative operator representations](https://en.cppreference.com/w/cpp/language/operator_alternative)
 - **[EN]** [open-std.org | "Removing trigraphs ??!"](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2014/n3981.html)
