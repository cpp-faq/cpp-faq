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

Notez que le **C++** ne possède pas de littéraux négatifs. `-213` est une expression comportant le littéral entier `213`, de type `int` et l'opérateur unaire `-`.

Le **C++** autorise également les [littéraux multi-caractères](404.md), qui sont de type `int`.

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

## Quels sont les littéraux caractères en C++ ?

Un littéral caractère en C++ est entouré de simple quote `'` :

```cpp
auto c = 'a';
std::cout << c;
```

Par défaut, un littéral caractère est de type `char`. Cependant, des suffixes permettent de modifier le type de la constante littérale :

```cpp
auto a = u8'a'; // char8_t  : encodage UTF8
auto b = u'a';  // char16_t : encodage UCS-2
auto c = U'a';  // char32_t : encodage UCS-4
auto d = L'a';  // wchar_t
```

Les préfixes `u` et `U` ont été introduits avec **C++11**. `u8`, introduit avec **C++17**, correspondait originellement au type `char` et est de type `char8_t` depuis **C++20**.

Le **C++** autorise également les [littéraux multi-caractères](404.md).

#### Liens et compléments
- **[EN]** [cppreference.com - character literal](https://en.cppreference.com/w/cpp/language/character_literal  )

## Qu'est ce que les littéraux char multicaractères ?

Le **C++** autorise un cas assez particulier de littéraux de type `int`. Il s'agit d'une suite de caractères délimité par une simple quote `'`. Le standard indique que la valeur de l'`int` résultant est laissée au choix du compilateur (*implementation-defined*) et que cette fonctionnalité est *conditionnaly supported*, c'est-à-dire qu'un compilateur n'est pas obligé de la proposer.

```cpp
auto a = 'Oui';
auto b = 'C++';     
auto c = 'ABCDEFG';  

std::cout << a << '\n'; // GCC 8.1 : 5207401
std::cout << b << '\n'; // GCC 8.1 : 4401963
std::cout << c << '\n'; // GCC 8.1 : 1145390663
```

Notez que cette fonctionnalité déclenche souvent des avertissements sur un compilateur bien configuré, de manière à pouvoir signaler les erreurs lorsque l'utilisateur voulait en réalité déclarer une chaîne de caractères littérale.

Les *multicharacter literals* trouvent cependant leurs utilités, notamment pour fixer des valeurs entières facilement reconnaissables en binaire :

```
enum class Side { left = 'left', right = 'righ', top = ' top', bottom = ' bot' }

auto side = Side::left;
```

Dans l'exemple ci-dessus, la valeur entières de `side` correspondra à `0x6C656674`, qui correspond à `left` en ASCII et permet donc de faciliter le debugage par exemple.  

#### Liens et compléments
- **[EN]** [cppreference.com - character literal](https://en.cppreference.com/w/cpp/language/character_literal  )
- **[EN]** [wikipedia.org - ASCII](https://en.wikipedia.org/wiki/ASCII)

## Quelles sont les séquences d'échappement autorisées en C++ ?

Les séquences d'échappement (utilisables dans les littéraux caractères et chaînes de caractères) définies par le standard :

|Séquence | Caractère correspondant|
|:-------:|:----------------------:|
|`\'`| `'` (ASCII : 0x27)|
|`\"`| `"` (ASCII : 0x22)|
|`\?`| `?` (ASCII : 0x3f)|
|`\\`| `\` (ASCII : 0x5c)|
|`\a`| alerte (ASCII : 0x07)|
|`\b`| retour arrière (ASCII : 0x08)|
|`\f`| nouvelle page (ASCII : 0x0c)|
|`\n`| saut de ligne (ASCII : 0x0a)|
|`\r`| retour chariot (ASCII : 0x0d)|
|`\t`| tabulation horizontale (ASCII : 0x09)|
|`\v`| tabulation verticale (ASCII : 0x0b)|
|`\nnn`| valeur octale (byte)|
|`\Xnn`| valeur hexadécimale (byte) |
|`\unnnn`| valeur Unicode (**C++11**) |
|`\Unnnnnnnn`| valeur Unicode (**C++11**) |

Pour information, `\a` correspond au signal d'alerte (la carte mère fait un 'bip' d'alarme le plus souvent). `\?` permet d'échapper le caractère `?` lorsqu'on souhaite éviter les [trigraphes](404.md), qui ont été retirés du langage avec **C++17**.

#### Liens et compléments
- **[EN]** [cppreference.com - escape sequences](https://en.cppreference.com/w/cpp/language/escape)
