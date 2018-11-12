# Alias de types

**En cours d'écriture**

#### Sommaire

**En cours d'écriture**

## Comment faire un alias sur un type en C++ ?

Le mot clef `using` permet de créer un alias sur un type en C++ (depuis **C++11**) :

```cpp
using uint = unsigned int;
using str = std::string;

template<typename T> using MyVector = std::vector<T, MyAllocator<T>>;
```

#### Liens et compléments
 - **[EN]** [cppreference.com – type alias](https://en.cppreference.com/w/cpp/language/type_alias)

## Est-ce qu'un alias est un nouveau type ?

## Comment faire un alias avec typedef ?

La syntaxe de création d'alias de type avec `typedef` est semblable à celle de la déclaration d'une variable :

```cpp
typedef unsigned int uint;
typedef std::string str;
```

En théorie, le mot clef `typdef` peut se trouver n'importe où dans la déclaration : `long long typedef unsigned int llui;`. On préférera cependant le spécifier au début de la déclaration pour des raisons de lisibilité.

#### Liens et compléments
 - **[EN]** [cppreference.com – typedef](https://en.cppreference.com/w/cpp/language/typedef)

## Puis-je utiliser typedef pour définir un alias de namespace ou de template ?

using-directive != using declaration != alias de type

## Dois-je préférer typedef ou using ?
