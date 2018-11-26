# Le préprocesseur

### Sommaire

 - [Inclusion de fichiers](Inclusion de fichiers/README.md).
 - [Define et macros](Define et macros/README.md).
 - [Jetons alternatifs](Jetons alternatifs/README.md).
 - **En cours d'écriture**.

## Quelles sont les directives préprocesseur existantes en C++ ?

Le C++ compte 12 directives préprocesseur en C++ :

 - `define` et `undef`,
 - `include`,
 - `if`, `ifdef`, `ifndef`, `else`, `elif` et `endif`,
 - `line`,
 - `error`,
 - `pragma`.

#### Liens et compléments
 - **[EN]** [cppreference.com | Preprocessor](https://en.cppreference.com/w/cpp/preprocessor)

## A quoi servent #define et #unsef en C++ ?

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
