# Non classé

Cette section comporte les questions qui ne sont pas encore classées.

### Sommaire

**En cours d'écriture**


## Comment tester si un std::optional<T> contient une valeur ?

`std::optional<T>` propose la fonction membre `has_value` qui est précisément destinée à cela :

```cpp
if(opt.has_value())
    std::cout << opt << std::endl;
```

Tout `optional` est aussi implicitement convertible en `bool` dans le contexte d'une condition :

```cpp
if(opt)
    std::cout << opt << std::endl;
```

Enfin, on peut également comparer un `optional` avec `std::nullopt` :

```
if(opt != std::nullopt)
    std::cout << opt << std::endl;
```

#### Liens et compléments
- [[EN] cppreference.com | std::optional::operator bool, std::optional::has_value](https://en.cppreference.com/w/cpp/utility/optional/operator_bool)
 - [[EN] cppreference.com | operator==, !=, <, <=, >, >=(std::optional)](https://en.cppreference.com/w/cpp/utility/optional/operator_cmp)

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

## Quel est l'objectif de std::monostate ?

## Comment fonctionne la comparaison entre deux std::variant ?



## Comment récupérer la valeur d'un std::variant ?

La valeur d'un `std::variant` peut être accédée avec les fonctions `std::get` et `std::get_if`, soit en spécifiant l'index d'un type voulu, soit ce type directement.

`std::get` retourne une référence et lève une exception [std::bad_variant_access](https://en.cppreference.com/w/cpp/utility/variant/bad_variant_access) si le type demandé n'est pas le type actuel.

```cpp
std::variant<int, double> v{ 2 };

int i = std::get<int>(v);
int i = std::get<0>(v);

// auto s = std::get<2>(v); : error: index out of bound.

try {
    auto d = std::get<double>(v);
} catch (std::bad_variant_access& e) {
    std::cout << e.what() << std::endl;
}
```  

`std::get_if` retourne un pointeur qui est nul si le type n'est pas le bon :

```cpp
std::variant<int, double> v{ 2.0 };

if(auto d = std::get_if<double>(&v)) {
    std::cout << *d << std::endl;
} else {
    std::cout << "bad type." << std::endl;
}

std::cout << *(std::get_if<1>(&v)) << std::endl;
```

La fonction *`std::visit`* permet également d'accéder à la valeur contenue.

#### Liens et compléments
 - [[EN] cppreference.com | std::get](https://en.cppreference.com/w/cpp/utility/variant/get)
 - [[EN] cppreference.com | std::get_if](https://en.cppreference.com/w/cpp/utility/variant/get_if)
 - [[EN] cppreference.com | std::bad_variant_access](https://en.cppreference.com/w/cpp/utility/variant/bad_variant_access)

## Comment modifier la valeur d'un std::variant ?

`std::variant` propose cinq manière de modifier la valeur contenue :
 - `std::get`, qui retourne une référence.
 - `std::get_if`, retournant un pointeur.
 - l'affectation, depuis un autre `std::variant` ou un T.
 - la fonction membre `emplace`.
 - [std::visit](404.md , local).

```cpp
std::variant<int, std::string> v{ "C++" };
std::variant u{ v };

v = 12; // v contient maintenant un int.
v = u;  // v contient à nouveau une string.

std::get<1>(v) = "\0";          // modification de la string contenue.
std::get_if<1>(&v)->clear();    // appel d'une fonction membre.

std::variant<int, double, Something> w{ 2.0 };

// emplace fait une construction in-place.
w.emplace<int>(3);
w.emplace<2>(255, 245, 198);
```

#### Liens et compléments
 - [[EN] cppreference.com | std::get](https://en.cppreference.com/w/cpp/utility/variant/get)
 - [[EN] cppreference.com | std::get_if](https://en.cppreference.com/w/cpp/utility/variant/get_if)
 - [[EN] cppreference.com | std::variant::emplace](https://en.cppreference.com/w/cpp/utility/variant/emplace)

## Comment simuler std::overload ?

`std::overload`, qui n'est pour le moment qu'à l'état de [proposition](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2018/p0051r3.pdf), peut être reproduite avec le code suivant :

```cpp
template<class... Ts> struct overload : Ts... { using Ts::operator()...; };
template<class... Ts> overload(Ts...) -> overload<Ts...>;

std::variant<char, int, float, double, std::string, std::vector<int>> v;
std::visit(overload(
    [](const std::string& s) { std::cout << std::quoted(s) << '\n'; },
    [](const std::vector<int>& v) { std::cout << v.size() << '\n'; },
    [](const auto& a) { std::cout << a << '\n'; }
), v);
```

#### Liens et compléments
 - [[EN] openstd.org - P0051R3 "C++ generic overload function"](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2018/p0051r3.pdf)
