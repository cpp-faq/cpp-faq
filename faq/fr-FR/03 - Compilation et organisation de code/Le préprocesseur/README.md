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

## A quoi sert la directive #line en C++ ?

La directive `#line` propose deux fonctions assez proche : modifier le numéro de ligne en cours, qui sera donné par la macro prédéfinie `__LINE__` ou modifier le nom du fichier en cours contenu dans la macro `__FILE__` :

```cpp
#include <iostream>

void print(int line, std::string file)
{
    std::cout << "Current line : " << line << "\nCurrent file : " << file << "\n\n";
}

int main()
{
  print(__LINE__, __FILE__);
#line 41
  print(__LINE__, __FILE__);
#line 999 "Schtroupmf point cpp"
  print(__LINE__, __FILE__);
}
```

Les cas d'usage de cette directive sont assez rare. On peut notamment citer les cas où le code est généré par un outil de manière à ce que l'erreur de compilation affichée affiche celle du code modifié.

Notez que n'importe quel macro qui s’étend en un entier positif est autorisé comme numéro de ligne. Le numéro de ligne maximum autorisé est *2147483647* (et était *32767* avant **C++11**).

#### Liens et compléments
 - **[EN]** [cppreference.com | #line](https://en.cppreference.com/w/cpp/preprocessor/line)

## A quoi sert la directive #pragma en C++ ?

La directive `#pragma` permet de définir un comportement dépendant de l'implémentation. Elle permet aux compilateurs de fournir leurs propres directives préprocesseur :

```cpp
#pragma once // Alternative aux header guards sur la majorité des compilateurs

#pragma warning 5038 // Suppression de l'avertissement 5038 sur MSVC.
#pragma optimise ("O3") // Activation du niveau d'optimisation 3 sur GCC.
...

#pragma omp parallel for // Indique que la boucle for suivante doit être parallèlisée (bibliothèque OpenMP).
for(int i = 0; i < size; ++i)
    ...
```

Si un compilateur ne reconnait pas un pragma, il doit l'ignorer.

#### Liens et compléments
 - **[EN]** [cppreference.com | Implementation defined behavior control](https://en.cppreference.com/w/cpp/preprocessor/impl)

## Qu'est ce que la directive \_Pragma() ?

## A quoi servent #if, #elif et #else ?
