# Les littéraux

**En cours d'écriture**

#### Sommaire

**En cours d'écriture**

## Quels sont les litéraux booléens en C++ ?

`true` et `false` sont les deux litéraux booléens en C++. Cependant, en raison des règles de [conversion implicites](404), des constantes entières peuvent être utilisée pour initialiser des booléens. Toute valeur différente est converti en `true` et une valeur nulle est convertie en `false` :

```cpp
bool b = 0;
bool b2 = 42;
bool b3 = -33;

std::cout << std::boolalpha << b << " " << b2 << " " << b3 << '\n';
// affiche : false true true
```

A l'inverse, `true` est converti en `1` dans un contexte entier et `false` est converti en `0`.

#### Liens et compléments
  - **[EN]** [cppreference.com - Boolean literals](https://en.cppreference.com/w/cpp/language/bool_literal)

## Quels sont les littéraux entiers autorisés en C++ ?

Les suffixes (*integer-suffix*) `u`, `l` et `ll` (et leurs équivalents en majuscule) permettent de définir le type correspondant du littéral entier. Ils peuvent être combinés :

```cpp
auto i   = 13;      // int
auto ui  = 13u;     // unsigned int
auto l   = 13l;     // long int
auto ul  = 13ul;   // unsigned long int
auto ll  = 13ll;   // long long int
auto ull = 13ull;  // unsigned long long int
```

Notez qu'il n'existe pas de littéral entier pour le type `short` en **C++** (`static_cast<short>(13)` est de type `short` en revanche).

Il est également possible d'utiliser les préfixes `0`, ̀`0x`, `0b` (**C++14**) pour modifier la base :

```cpp
auto i = 42;    // littéral en base 10 (par défaut).
auto i = 0b10;  // littéral en base 2  (binaire). depuis C++14
auto i = 07182;   // littéral en base 8  (octale).
auto i = 0xAB33;  // littéral en base 16 (hexadécimale).
```

Les chiffres ̀`a`, `b`, `c`, `d`, `e`, `f` peuvent être écrits indifféremment en minuscule ou en majuscule. En raison de la notation de la base 8, `0123` et `123` ne sont pas équivalents en **C++**.

Enfin, il est possible d'insérer des quotes `'`, non consécutives, dans une constante littérale entière depuis **C++14** pour simplifier la lisibilité des très grands nombres : `std::cout << "J'ai gagné : " << 18'207'395'723'507ll << " euros !\n";`

#### Liens et compléments
  - **[EN]** [cppreference.com - Integer literals](https://en.cppreference.com/w/cpp/language/integer_literal)
