# Inclusion de fichiers

### Sommaire

**En cours d'écriture**

## A quoi sert la directive #include en C++ ?

`#include` est la directive préprocesseur permettant l'inclusion d'un fichier source :

```cpp
#include <iostream> // inclusion de l'entête standard <iostream>
#include "MyList.h" // inclusion d'un entête.
```

Cette directive est principalement utilisée pour inclure des fichiers d'entête, qu'ils soient locals, standard ou viennent d'une bibliothèque tierce.

#### Liens et compléments
- **[EN]** [cppreference.com | Source file inclusion](https://en.cppreference.com/w/cpp/preprocessor/include)

## Quelle est la différence entre #include <header> et #include "header" ?

La différence réside dans le fait que les deux ne vont pas aller chercher le fichier de la même façon.

D'après le standard, la manière dont les fichiers sont recherchés sont définis par l'implémentation et donc laissé au choix du compilateur. Cependant, si `#include "filename"` n'est pas supporté ou ne trouve pas le fichier, le compilateur doit ensuite chercher le fichier comme s'il était inclu avec `#include <filename>`.

En pratique, `#include "filename"` va chercher dans les fichiers locaux du projet pour la majorité des compilateurs puis chercher dans les répertoires prédéfinis, comme le fait `#include <filename>` s'il ne trouve rien.

D'une manière générale, on utiliser donc `#include "filename"` pour les fichiers et bibliothèques locales au projet et `#include <filename>` pour les entêtes standards et ceux des bibliothèques prédéfinies. Voici un exemple :

```cpp
#include <iostream> // entête standard.
#include <QMainWindow> // entête Qt, supposé ici préinstallé dans les répertoires d'include du compilateur.

#include "MyClass.h" // entête local au projet.
#include "boost/program_options.hpp" // entête d'une bibliothèque locale (une grande partie de la bibliothèque est fournie sous forme d'entête autosuffisant, pouvant être simplement ajoutés localement).
```
## Qu'est-ce qu'un header guard ?

Le header guard est une technique permettant de s'assurer qu'un fichier d'entête (un *header*), n'est qu'inclu qu'une seule fois par unité de traduction.

Cela se fait au moyen des directive `#ifdef`, `#define` et `#endif`. L'idée est de définir une variable préprocesseur qui sera définie lors de la première inclusion et qui permettra de vérifier si l'entête a déjà été inclu ou non :

```cpp
#ifndef MON_HEADER_H
#define MON_HEADER_H

// Code du header

#endif // header guard : MON_HEADER_H
```

Les *header guards* peuvent provoquer des bugs inattendus lors de refactoring (cf [Dois-je privilégier les header guards ou #pragma once ?](<404>))

## A quoi sert \__has_include() en C++ ?



## Dois-je privilégier les header guards ou #pragma once ?

Cette question suscite aujourd'hui encore le débat et il n'y a pas de règle universelle. Nous allons présenter ici les différents arguments en faveur des deux techniques.

`#pragma once` est directement dépendent du système de fichier sous-jascent, ce qui peut poser parfois problème (avec des liens symboliques par exemple) et un risque de comportement différent en fonction de la plateforme. `#pragma once`, s'il n'est pas standard, est en pratique supporté par la majorité des compilateurs. [Ce tableau](https://en.wikipedia.org/wiki/Pragma_once#Portability) présente le support de la directive pour 17 compilateurs, parmi lesquels seul *Cray C++ Compiler* ne le supporte pas.

Les *includes guards* peuvent être dangereux, puisque si un identifiant est malencontreusement choisit en double, l'erreur sera difficile à repérer. Ce sont des choses qui peuvent arriver dans de grands projets ou en cas de refactoring. `#pragma once` évite ce genre de problèmes.

Pour autant, les systèmes de builds voir les IDEs peuvent faciliter l'usage des **include guards** en générant par exemple automatiquement l'identifiant (en fonction du nom du fichier, d'un nom de module, de namespace ou encore avec un timestamp). Cela évite le risque de collision des identifiants mais demande l'utilisation d'outils supplémentaires et on peut considérer que cela revient alors aux mêmes problématiques que la dépendance qu'avec le système de fichiers.

Notez enfin `#pragma once` est souvent optimisé par les compilateurs, mais c'est parfois aussi le cas pour les **includes guards**. Il reste aussi envisageable d'utiliser les deux en même temps.

#### Liens et compléments
- **[EN]** [cppreference.com | Implementation defined behavior control - #pragma once](https://en.cppreference.com/w/cpp/preprocessor/impl)
- **[EN]** [stackoverflow.com | #pragma once vs include gaurds ?](https://stackoverflow.com/questions/1143936/pragma-once-vs-include-guards)
- **[EN]** [wikipedia.org | #pragma once](https://en.wikipedia.org/wiki/Pragma_once)
