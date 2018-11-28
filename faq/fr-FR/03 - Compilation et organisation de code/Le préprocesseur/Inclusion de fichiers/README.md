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

## A quoi sert \__has_include() en C++ ?

## Dois-je privilégier les header guards ou #pragma once ?



## A quoi correspondent #ifdef et #ifndef ?
