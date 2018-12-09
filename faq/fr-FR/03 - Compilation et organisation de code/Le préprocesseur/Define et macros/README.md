# Defines et macros

### Sommaire

**En cours d'écriture**

## Qu'est-ce qu'une macro en C++ ?


## Comment déclarer une fonction macro en C++ ?

## Peut-on écrire une macro sur plusieurs lignes ?

## Quelles sont les différences entre les fonctions classiques et les fonctions macros ?



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
