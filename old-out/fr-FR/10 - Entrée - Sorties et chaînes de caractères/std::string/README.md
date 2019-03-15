# std::string

**En cours d'écriture**

#### Sommaire

**En cours d'écriture**

## Comment créer une string contenant un '\0' ?

Le constructeur de `std::string` prenant un `const char*` s'attend a recevoir une *zero-terminated string*, c'est à dire qu'il va prendre les caractères jusqu'au '\0' final :

```cpp
std::string s{ "Hello \0 world!\0"};

std::cout << s << std::endl; // affiche : "Hello "
```

Vous pouvez utiliser directement un littéral de type `std::string` avec le suffixe `s` :

```cpp
#include <iostream>
#include <string>

using namespace std::string_literals;

int main()
{
    auto s = "Hello \0 world\0!"s;

    std::cout << s << std::endl; // affiche : "Hello  World!";
}
```

#### Liens et compléments
  - **[EN]** [cppreference.com - String literals](https://en.cppreference.com/w/cpp/string/basic\_string/operator%22%22s)
