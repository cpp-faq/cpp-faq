# Le préprocesseur

### Sommaire

**En cours d'écriture**

## Qu'est-ce que les opérateurs alternatif en C++ ?

Les

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

int main(int argc, char argv??(??))
??<
  std::cout << "Hello World !??/n";
??>

```


#### Liens et compléments
 - **[EN]** [cppreference.com | Alternative operator representations](https://en.cppreference.com/w/cpp/language/operator_alternative)
 - **[EN]** [open-std.org | "Removing trigraphs ??!"](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2014/n3981.html)
