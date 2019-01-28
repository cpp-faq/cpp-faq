# Non classé

Cette section comporte les questions qui ne sont pas encore classées

### Sommaire

**En cours d'écriture**

## Comment récupérer la valeur d'un std::optional<T> ?

`std::optional<T>` fourni les fonctions membres `value_or`, `value` ainsi que les opérateurs `*` et `->`.

`value_or` prends en paramètre un objet de type `T` correspondant à la valeur qui sera retournée si l'`optional` n'a pas de valeur :

```cpp
std::optional i{ 25 };
std::optional<int> j{ std::nullopt };

// Affiche : 25 42
std::cout << i.value_or(42) << " " << j.value_or(42) << std::endl;
```

`value` lève une exception de type `std::bad_optional_access` si l'`optional` n'a pas de valeur :

```cpp
std::optional i{ 25 };
std::optional<int> j{ std::nullopt };

try {
    std::cout << i.value() << std::endl;
    std::cout << j.value() << std::endl;
} catch (std::bad_optional_access& e) {
    std::cout << e.what() << std::endl;   
}
// Affiche :
// 25
// bad optional access
```

Enfin, les opérateurs `*` et `->` permettent de manipuler l'objet courant à la manière d'un pointeur. Il s'agit d'un *undefined behavior* si l'`optional` ne contient pas de valeur :

```cpp
std::optional o{ "Hello"s };

std::cout << *o << std::endl; // Affiche: Hello
std::cout << o->size() << std::endl; // Affiche: 5
```

En bref, privilégiez `value` et `*` / `->` si vous avez la certitude que l'objet que vous manipulez contient une valeur. `value_or` est un raccourcis permettant d'éviter de faire sois-même la condition sur l'existence d'une valeur.

Les opérateurs `*` et `->` devraient être privilégié si vous ne souhaitez pas d'exception pour traiter le cas d'erreur par rapport à `value`.

#### Liens et compléments
 - [[EN] cppreference.com | std::optional::value_or](https://en.cppreference.com/w/cpp/utility/optional/value_or)
 - [[EN] cppreference.com | std::optional::value](https://en.cppreference.com/w/cpp/utility/optional/value)
 - [[EN] cppreference.com | std::optional::operator->, std::optional::operator*](https://en.cppreference.com/w/cpp/utility/optional/operator*)
