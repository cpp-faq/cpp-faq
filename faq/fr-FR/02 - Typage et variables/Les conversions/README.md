# Les conversions

**En cours d'écriture**

#### Sommaire

**En cours d'écriture**

## Quels sont les différents types de conversion disponibles en C++ ?

Le C++ supporte quatre classes majeures de conversion, qui sont chacune explicitées dans cette section : 
 - Les conversions implicites, qui correspondent à toute les conversions effectuées automatiquement par défaut par le compilateur, par exemple la conversion d'un `int` en `double`.
 - Les conversions explicites de type C.
 - Les conversions explicites C++ :
  - `static_cast`.
  - `const_cast`.
  - `dynamic_cast`.
  - `reinterpret_cast`.
 - Les conversions définie par l'utilisateur (*user-defined*), qui peuvent être implicites ou explicites.

Certaines fonctions de la bibliothèque standard, telles que `std::bit_cast` ou `std::any_cast`, peuvent également être rangée dans la catégorie des conversions explicites.

## A quoi sert l'opérateur de conversion reinterpret_cast ?

## Qu'est-ce que la 'strict aliasing rule' ?

## Comment puis-je réinterpréter une séquence de byte vers un autre type ?
