# La programmation par contrat

### Sommaire

**En cours d'écriture**

## Qu'est-ce que la programmation par contrat ?

**En cours d'écriture**

## Comment puis-je faire une assertion en C++ ?

Les assertions se font avec l'attribut `[[assert]]` ([A quoi  correspond l'attribut assert](https://github.com/cpp-faq/cpp-faq/tree/master/faq/fr-FR/04%20-%20Les%20structures%20du%20langage/Les%20attributs#a-quoi-correspond-lattribut-assert-)) depuis C++20 :

```cpp
int i = foo();
[[assert : i > 0]];
```

L'effective vérification de l'assertion à l'exécution dépends du **niveau d'assertion** et du **niveau de build**.

Avant **C++20**, la macro `assert` issu du C était utilisées :

```cpp
#include <cassert>

// ...

int i = foo();
assert(i > 0);
`

Si la constante préprocesseur `NDEBUG` n'est pas définie, les assertions avec la macro `assert` n'ont pas d'effet (et ne sont donc pas vérifiées à l'exécution).

#### Liens et compléments
 - [A quoi correspondent les niveau d'assertion des attributs des contrats ?](https://github.com/cpp-faq/cpp-faq/tree/develop/faq/fr-FR/.faq/404.md)
 - [Qu'est-ce que le build level?](https://github.com/cpp-faq/cpp-faq/tree/develop/faq/fr-FR/.faq/404.md)

## Dois-je préférer la macro C assert() ou l'attribut [[assert]] ?

**En cours d'écriture**

## Comment définir une pré/postcondition en C++ ?

**En cours d'écriture**

## A quoi correspondent les niveau d'assertion des attributs des contrats ?

Pour les trois attributs de contrats (`expects`, `ensures` `assert`), il est possible d'indiquer un niveau d'assertion : `default`, `audit` et `axiom`. Il ne sont pas des mots-clefs, mais des identificateur avec une signification particulière dans le contexte d'un contrat. L'absence de niveau d'assertion correspond au niveau `default` :

 - `default` : correspond a un predicat dont le coût de vérification est petit comparé à l'exécution de la fonction.
 - `audit` : correspond aux vérifications qui ont un coût non-négligeable.
 - `axiom` : indique que le contrat ne sera jamais vérifié à l'exécution. L'expression doit cependant être du C++ valide (mais elle peut contenir des appels à des fonctions non définies puisqu'elles ne sont pas évaluées).

La vérification des contrat à l'exécution dépends de leur niveau d'assertion et du [build level](https://github.com/cpp-faq/cpp-faq/tree/develop/faq/fr-FR/.faq/404.md).

#### Liens et compléments
 - **[EN]** [cppreference.com – C++ attribute: expects, ensures, assert](https://en.cppreference.com/w/cpp/language/attributes/contract)
 - **[EN]** [open-std.org | p0840r2 "Support for contract based programming in C++"](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2018/p0542r5.html)
 - **[EN]** ["Contracts" programming for C++20 - J. Daniel Garcia](https://github.com/ACCUConf/ACCUConf_PDF-s/blob/master/2017/j-danie-garcia-contracts.pdf)

## Qu'est-ce que le build-level ?

Pour chaque unité de traduction, il est possible de spécifier un **build level** (de manière dépendante du compilateur) :

 - `off` : Aucune vérification n'est faite à l'exécution.
 - `default` (par défaut si rien n'est indiqué) : seules les vérifications des contrats avec un niveau d'assertion `default` sont effectuées.
 - `audit` : seules les vérifications de contrats avec un niveau d'assertion `default` ou `audit` sont faites.

 #### Liens et compléments
  - **[EN]** [cppreference.com – C++ attribute: expects, ensures, assert](https://en.cppreference.com/w/cpp/language/attributes/contract)
  - **[EN]** [open-std.org | p0840r2 "Support for contract based programming in C++"](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2018/p0542r5.html)
  - **[EN]** ["Contracts" programming for C++20 - J. Daniel Garcia](https://github.com/ACCUConf/ACCUConf_PDF-s/blob/master/2017/j-danie-garcia-contracts.pdf)

## Qu'est-ce que le violation continuation mode ?

Le **violation continuation mode** (qui pourrait se traduire par le *mode de récupération d'une violation de contrat*) correspond à l'un des niveau suivant (spécifié de manière dépendante de l'implémentation) :

 - `off` (par défaut) : en cas de violation de contrat, le **violation handler** est appelé, puis `std::terminate` est appelée.
 - `on` : après exécution du **violation handler** est appelé puis le programme reprends son exécution.

 #### Liens et compléments
  - **[EN]** [cppreference.com – C++ attribute: expects, ensures, assert](https://en.cppreference.com/w/cpp/language/attributes/contract)
  - **[EN]** [open-std.org | p0840r2 "Support for contract based programming in C++"](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2018/p0542r5.html)
  - **[EN]** ["Contracts" programming for C++20 - J. Daniel Garcia](https://github.com/ACCUConf/ACCUConf_PDF-s/blob/master/2017/j-danie-garcia-contracts.pdf)

## Qu'est-ce que le violation-handler ?

Le **violation handler** est une fonction ayant pour signature `void (const std::contract_violation&)` pouvant être spécifiée optionnellement `noexcept`. Un seul **violation handler** peut-être défini, d'une manière dépendant de l'implémentation.

Le type `std::contract_violation` est une interface standard pour représenter une violation de contrat :

```cpp
class contract_violation
{
public:
    std::uint_least32_t line_number() const noexcept;
    std::string_view file_name() const noexcept;
    std::string_view function_name() const noexcept;
    std::string_view comment() const noexcept;
    std::string_view assertion_level() const noexcept;
}
```

#### Liens et compléments
 - **[EN]** [cppreference.com – C++ attribute: expects, ensures, assert](https://en.cppreference.com/w/cpp/language/attributes/contract)
 - **[EN]** [open-std.org | p0840r2 "Support for contract based programming in C++"](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2018/p0542r5.html)
 - **[EN]** ["Contracts" programming for C++20 - J. Daniel Garcia](https://github.com/ACCUConf/ACCUConf_PDF-s/blob/master/2017/j-danie-garcia-contracts.pdf)

## Puis-je accéder au build-level et modifier le violation-handler programmatiquement ?

**C++20**

Non, il n'est pas possible d'accéder ou de modifier le build-level et le violation handler programmatiquement. De plus, Les implémentations sont encouragée à ne pas fournir de moyen de le faire.

Le build-level est indiqué pour chaque unité de traduction de manière qui est laissée au choix du compilateur. De la même façon, le violation handler est spécifié au compilateur.

#### Liens et compléments
 - **[EN]** [cppreference.com – C++ attribute: expects, ensures, assert](https://en.cppreference.com/w/cpp/language/attributes/contract)
 - **[EN]** [open-std.org | p0840r2 "Support for contract based programming in C++"](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2018/p0542r5.html)
 - **[EN]** ["Contracts" programming for C++20 - J. Daniel Garcia](https://github.com/ACCUConf/ACCUConf_PDF-s/blob/master/2017/j-danie-garcia-contracts.pdf)
