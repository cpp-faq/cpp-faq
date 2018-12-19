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

## Quels sont les littéraux flottants autorisés en C++ ?

Un littéral flottant est composé d'une partie entière (avec le signe) et d'une partie réelle séparé par un point ainsi que d'un exposant :

```
auto d1 = 0.1;
audo d2 = .5e-1;
auto d3 = -10.;
auto d4 = 123e2;
```

Seule l'une des deux parties (entière et réelle) est obligatoire. Le point n'est pas obligatoire lorsque l'exposant est spécifié. L'exposant correspond au symbole `e` ou `E` (ou `p` et `P` en notation hexadécimale depuis **C++17**) et de la valeur de l'exposant. La partie avant l'exposant est la *mantisse*. Le nombre a pour valeur `n ~= mantisse * 10 ^ exposant` (en réalité ce n'est pas un égalité stricte puisqu'il peut s'agir d'une valeur approchée, le nombre étant stocké en binaire) :

```
auto d1 = 1e3;      // d1 ~= 1   * 10^3   = 1000.
auto d2 = -0.5e-10;  // d2 ~= 0.5 * 10^-10 = -0.00000000005;
auto d3 = 6.02214086e23 // constante d'Avogadro.
```

Par défaut, un littéral flottant est de type `double`, les suffixes suffixes `f` et `l` (et leurs équivalents en majuscule) permettent d'obtenir respectivement un littéral de type `float` et `long double`.

```cpp
auto f   = 42.f;    // float
auto d   = 42;      // double
auto ld  = 42.l;    // long double
auto e   = 42f;     // erreur, litéral entier avec suffixe 'f'
auto l   = 42L;     // long
```

Tout comme pour les littéraux entiers, il est possible d'utiliser des *simple quotes* comme séparateur de chiffre, à la fois pour la mantisse et pour l'exposant :

```
auto ld = 142'849.124'774'1e1'1L;
```

Depuis **C++17**, il est également possible d'écrire les littéraux flottant en [notation hexadécimale](faq://hexa-float) avec le préfixe `0x`.

#### Liens et compléments
- **[EN]** [cppreference.com - floating point literal](https://en.cppreference.com/w/cpp/language/floating_literal)

## Comment fonctionne un littéral flottant hexadécimal ?

Le suffixe `0x` peut-être utilisé pour écrire un littéral flottant en notation hexadécimale depuis **C++17**. Cette notation a l'avantage de permettre d'éviter les conversions dues à l’imprécision des flottants.

Étant donné que `e` est un chiffre hexadécimal, `p` (et `P`) est utilisé pour indiquer l'exposant dans ce cas. En notation hexadécimale, l'exposant est obligatoire :

```cpp
auto d = 0xA0p2;
```

La **mantisse** est écrite en base hexadécimale, l'**exposant** quant à lui est en décimal. Le nombre vaut `n ~= mantisse * 2^exposant` :
 - mantisse = `0xA0` = `0b10100000` = `160`.
 - exposant = `2`.
 - d = `160 * 2^2 = 640`.

Ci-suit quelques exemples de flottant en hexadécimal :

```cpp
std::cout << std::setprecision(30); // #include <iomanip>
std::cout << 0xFFp0 << '\n';                    
std::cout << 0x0.1p0 << '\n';
std::cout << 0x100p6 << '\n';
std::cout << 0x1p-1 << '\n';
std::cout << 0xae3p2 << '\n';
std::cout << 0x7'123'456'1BC'DEF << '\n';
std::cout << 142'849e20l;
/* affiche :
255
0.0625
16384
0.5
11148
1990340829236719
14284900000000000000000000
*/
```

#### Liens et compléments
- **[EN]** [cppreference.com - floating point literal](https://en.cppreference.com/w/cpp/language/floating_literal)
