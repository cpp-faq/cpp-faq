# Les attributs

### Sommaire

- [Qu'est-ce qu'un attribut ?](https://github.com/cpp-faq/cpp-faq/tree/master/faq/fr-FR/04%20-%20Les%20structures%20du%20langage/Les%20attributs#quest-ce-quun-attribut-).
- [Quels sont les attributs standards en C++ ?](https://github.com/cpp-faq/cpp-faq/tree/master/faq/fr-FR/04%20-%20Les%20structures%20du%20langage/Les%20attributs#quels-sont-les-attributs-standards-en-c-).
- [Est-ce que using namespace s'applique aussi aux attributs ?](https://github.com/cpp-faq/cpp-faq/tree/master/faq/fr-FR/04%20-%20Les%20structures%20du%20langage/Les%20attributs#est-ce-que-using-namespace-sapplique-aussi-aux-attributs-).
- [A quoi correspond l'attribut [[noreturn]] ?](https://github.com/cpp-faq/cpp-faq/tree/master/faq/fr-FR/04%20-%20Les%20structures%20du%20langage/Les%20attributs#a-quoi-correspond-lattribut-noreturn-).
- [A quoi correspond l'attribut [[carries_dependency]] ?](https://github.com/cpp-faq/cpp-faq/tree/master/faq/fr-FR/04%20-%20Les%20structures%20du%20langage/Les%20attributs#a-quoi-correspond-lattribut-carries_dependency-).
- [A quoi correspond l'attribut [[deprecated]] ?](https://github.com/cpp-faq/cpp-faq/tree/master/faq/fr-FR/04%20-%20Les%20structures%20du%20langage/Les%20attributs#a-quoi-correspond-lattribut-deprecated-).
- [A quoi correspond l'attribut [[fallthrough]] ?](https://github.com/cpp-faq/cpp-faq/tree/master/faq/fr-FR/04%20-%20Les%20structures%20du%20langage/Les%20attributs#a-quoi-correspond-lattribut-fallthrough-).
- [A quoi correspond l'attribut [[nodiscard]] ?](https://github.com/cpp-faq/cpp-faq/tree/master/faq/fr-FR/04%20-%20Les%20structures%20du%20langage/Les%20attributs#a-quoi-correspond-lattribut-nodiscard-).
- [A quoi correspond l'attribut [[maybe_unused]] ?](https://github.com/cpp-faq/cpp-faq/tree/master/faq/fr-FR/04%20-%20Les%20structures%20du%20langage/Les%20attributs#a-quoi-correspond-lattribut-maybe_unused-).
- [A quoi correspond les attributs [[likely]] et [[unlikely]] ?](https://github.com/cpp-faq/cpp-faq/tree/master/faq/fr-FR/04%20-%20Les%20structures%20du%20langage/Les%20attributs#a-quoi-correspond-les-attributs-likely-et-unlikely-).
- [A quoi correspond l'attribut [[no_unique_address]] ?](https://github.com/cpp-faq/cpp-faq/tree/master/faq/fr-FR/04%20-%20Les%20structures%20du%20langage/Les%20attributs#a-quoi-correspond-lattribut-no_unique_address-).
- [A quoi correspondent les attributs [[expects]] [[ensures]] et [[assert]] ?](https://github.com/cpp-faq/cpp-faq/tree/master/faq/fr-FR/04%20-%20Les%20structures%20du%20langage/Les%20attributs#a-quoi-correspondent-les-attributs-expects-ensures-et-assert-).

## Qu'est-ce qu'un attribut ?

Les attributs ont été introduit avec **C++11**. Ils fournissent une syntaxe unifiée pour les attributs des compilateurs (```__attribute__``` sur GCC et Clang, ```__declspec()``` pour MSVC). Le standard propose également des attributs standards.

Si un attribut n'est pas reconnu par le compilateur, celui-ci est ignoré. Les attributs sont déclarés entre deux crochets ```[[attribute]]``` et peuvent être associés à la majorité des constructions du langage. Ci suit un exemple avec quelques attributs standards :

```cpp
[[noreturn, deprecated("Superseded by foo(bool)")]]
void foo();

[[nodiscard]] error_code bar([[carries_dependency]] int* x)
    [[expects: *x >= 0]]
    [[ensures ec : ec != error_code::unknown]]
{
    [[maybe_unused]] error_code ec{};
    if([[likely]] *x == 0)
        ec = do_something();
    else
        switch(*x) {
            [[unlikely]] case 1:
                x = 0;
                [[fallthrough]]                    
             default:
                x = 1;                        
        }

    [[assert: x == 0 || x == 1]]

    ec = do_something_else(x);
    return ec;
}
```

## Quels sont les attributs standards en C++ ?

Les attributs standards (à l'heure de **C++20**) sont au nombre de treize :

 - *(C++11)* ```[[noreturn]]```.
 - *(C++11)* ```[[carries_dependency]]```.
 - *(C++14)* ```[[deprecated]]```.
 - *(C++17)* ```[[fallthrough]]```.
 - *(C++17)* ```[[nodiscard]]```.
 - *(C++17)* ```[[maybe_unused]]```.
 - *(C++20)* ```[[likely]]``` et ```[[unlikely]]```.
 - *(C++20)* ```[[no_unique_address]]```.
 - *(C++20)* ```[[expects]]```.
 - *(C++20)* ```[[assert]]```.
 - *(C++20)* ```[[ensures]]```.
 - *(C++20)* ```[[expects]]```.

## Comment déclarer plusieurs attributs en même temps ?

Il est possible de spécifier une liste d'attributs dans une même déclaration. Les attributs de contrat (```[[assert]]```, ```[[ensures]]``` et ```[[expects]]```) font exception et doivent être déclarés seuls :

```cpp
[[nodiscard, deprecated, gnu::always_inline, gnu::hot]]
int foo();
```

## Pourquoi using namespace s'applique pas aux attributs ?

Les espaces de noms d'attributs (*attribute-namespace*) sont distincts des espaces de nom habituels et donc la directive ```using namespace``` ne s'applique pas aux attributs.

Cependant, il est possible d'extraire tous les attributs d'un *attribute-namespace* à l'aide de la directive ```using``` dans la déclaration des attributs ```[[ using attribute-namespace : attribute-list ]]``` :

```cpp
using namespace gnu; // Ici, l'espace de nom gnu est importé.

[[unused, const]] int x; // les attributs sont non reconnus et donc ignorés.
[[gnu::unused, gnu::const]] int y; // OK
[[using gnu : unused, const]] int z; // OK
```

## A quoi correspond l'attribut [[noreturn]] ?

L'attribut ```[[noreturn]]```, introduit avec **C++11**, permet de signaler qu'une fonction ne retourne pas. Il peut s'agir d'une fonction qui lève une exception dans tous les cas ou d'un appel à une fonction qui termine le programme (par exemple ```std::terminate```) ou qui change le contexte d'exécution (```std::longjmp```).

Si la fonction peut effectivement se retourner, il s'agit d'un **undefined behavior**.

```cpp
std::jmp_buf jmp_buf;
[[noreturn]] foo(int a) {
    /* ... */
    std::longjmp(jmp_buf, a);
}

[[noreturn]] bar() { throw false; }
```

La liste des fonctions standards marquées ```[[noreturn]]``` sont listées sur [cette page](https://en.cppreference.com/w/cpp/language/attributes/noreturn).

#### Liens et compléments
 - **[EN]** [cppreference.com – C++ attribute: noreturn](https://en.cppreference.com/w/cpp/language/attributes/noreturn)

## A quoi correspond l'attribut [[carries_dependency]] ?

**En cours d'écriture**

## A quoi correspond l'attribut [[deprecated]] ?

L'attribut ```[[deprecated]]```, depuis **C++14**, permet d'indiquer qu'un élément est déprécié et optionnellement d'en indiquer la raison.

Ci suit des exemples d'utilisation de cet attribut :

```cpp
namespace [[deprecated("old API")]] ns { // depuis C++17

template<typename T>
struct [[deprecated]] A
{
    using [[deprecated]] size_type = typename T::size_type;
    [[deprecated] T t;

    enum class [[deprecated]] color {
        BLUE,
        [[deprecated]] INDIGO = 2 // depuis C++17
    };
};

[[deprecated]] constexpr auto k = 22;

template<>
struct [[deprecated]] A<void> {
    [[deprecated("1234")]] void foo(int& a) {
        [[deprecated]] auto i = 1 + a;
        a = i % 22;
    }
};

}
```

#### Liens et compléments
 - **[EN]** [cppreference.com – C++ attribute: deprecated](https://en.cppreference.com/w/cpp/language/attributes/deprecated)

## A quoi correspond l'attribut [[fallthrough]] ?

L’attribut ```[[fallthrough]]``` (depuis **C++17**) est destiné aux instructions ```switch```. L’objectif est de préciser au compilateur qu’une absence de saut du flot de contrôle est volontaire (que ce soit avec ```break``` ou ```return```).

Les compilateurs signalent souvent les *fallthroughs*, c’est à dire lorsque le programme passe d’une ```case``` à l’autre sans saut. Si il s’agit en effet d’une erreur de programmation assez classique, il est également possible que celle-ci soit intentionnelle.

```[[fallthrough]]``` indique au compilateur que le *fallthrough* est intentionnel et ne doit pas être considéré comme une erreur. Il permet ainsi d’éviter un *warning* de la part du compilateur. Celui-ci doit précéder un  case :

```cpp
action handle_event(event my_event) {
    switch(my_event) {
      case event::mouse_click: [[fallthrough]]; // fallthrough explicite, pas de warning.
      case event::mouse_wheel:          
          auto mouse_button = get_mouse_button();
          return action(action::event::mouse, mouse_button);
      case event::button_click:
          auto& b = get_clicked_button();
          // fallthrough : warning possible du compilateur.
      default:
         return action(action::event::unknown);
    }
}
```

#### Liens et compléments
 - **[EN]** [cppreference.com – C++ attribute: fallthrough](https://en.cppreference.com/w/cpp/language/attributes/fallthrough)
 - **[EN]** [open-std.org | p0188r1 "Wording for [[fallthrough]] attribute."](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2016/p0188r1.pdf)

## A quoi correspond l'attribut [[nodiscard]] ?

L’attribut ```[[nodiscard]]```, ajouté avec **C++17**, permet de refuser le droit du programmeur d’ignorer le retour d’une fonction.

Assez simplement, une fonction peut être marquée avec ```[[nodiscard]]``` ce qui indique au compilateur que le retour ne devrait pas être ignoré :

```cpp
[[nodiscard]] error_code f();

int main() {
   f(); // GCC-7.2 : warning: ignoring return value of 'error_code f()',
        // declared with attribute nodiscard [-Wunused-result]
}
```

L’attribut ```[[nodiscard]]``` peut également être appliqué à un type. Dans ce cas, toutes les fonctions retournant un objet de ce type sont implicitement marquées ```[[nodiscard]]``` :

```struct [[nodiscard]] error_code {};

error_code f();
error_code g();

int main() {
   f(); // warning [[nodiscard]].
   g(); // warning [[nodiscard]].
}
```

## Est-ce que les attributs sont hérités ?

Les attributs ne jamais hérité. Ci-suit un exemple avec ```[[nodiscard]]``` :

```cpp
struct [[nodiscard]] error_code {};
struct critical_error_code : error_code {};

struct A
{
    virtual [[nodiscard]] bool foo() = 0;
};

struct B : a
{
    bool foo() override;
};

critical_error_code foo();

int main() {
   h(); // pas de warning.
   A{}.foo(); // pas de warning.
}
```

## A quoi correspond l'attribut [[maybe_unused]] ?

L’attribut ```[[maybe_unused]]``` (depuis **C++17**), signale au compilateur qu’une variable peut être inutilisée et qu’il n’y a pas lieu de s’inquiéter. Le compilateur ne signalera pas d’avertissement si la variable est effectivement inutilisée.

```cpp
void f([[maybe_unused]] bool thing1,
                        [[maybe_unused]] bool thing2)
{
   [[maybe_unused]] bool b = thing1 && thing2;
   assert(b);
}
```

Dans cet exemple issu de *cppreference*, l’attribut est appliqué aux arguments de ```f``` et à la variable locale ```b```.

Ici, dans le cas d’une compilation en mode *release*, la macro ```assert``` va disparaître et par conséquent la variable ```b``` sera inutilisée. Puisque l’attribut ```[[maybe_unused]]``` est spécifié, le compilateur ne générera pas d’avertissement. Par ricochet, les arguments de ```f ```seront eux aussi inutilisés, d’où l’application de l’attribut à nouveau.

```[[maybe_unused]]``` peut aussi s'appliquer à d'autres entités, notamment les fonction et les classes :

```cpp
[[maybe_unused]] class C {}
[[maybe_unused]] void foo()
```

On peut comparer ```[[maybe_unused]]``` à l’annotation **Java** ```@SupressWarning("unused")```, qui fait sensiblement la même chose.

#### Liens et compléments
 - **[EN]** [cppreference.com – C++ attribute: maybe_unused](https://en.cppreference.com/w/cpp/language/attributes/maybe_unused)
 - **[EN]** [open-std.org | p0212r1 "Wording for [[maybe_unused]] attribute."](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2016/p0212r1.pdf)

## A quoi correspond les attributs [[likely]] et [[unlikely]] ?

Ces deux attributs ont été introduits avec **C++20** pour permettre d’indiquer au compilateur qu’une branche est plus probable que l’autre.

```[[likely]]```, respectivement ```[[unlikely]]```, peut être assigné à une étiquette ou une expression pour indiquer que le résultat sera le plus souvent  ```true```, respectivement ```false``` :

```cpp
int foo(int i) {
    switch(i) {
                    case 1: return 1;
      [[likely]]    case 2: return 2;
      [[unlikely]]  default: return 3;
    }
    return 2;
}

void bar(int i) {
    if ([[unlikely]] !foo(i)) {
      do_something();
    }
}
```

Ici, le compilateur sait que la valeur 2 est la plus probable, et que les valeurs autres que 1 et 2 sont peu probable. Il peut alors effectuer des optimisations avec ces informations supplémentaires sur le flot de contrôle.

Ces attributs sont à utiliser après une étude d'un code existant à l'aide d'un *profiler* par exemple, lorsqu'il est clair qu'une branche est plus souvent accédée que l'autre. L'usage prématuré de ces attributs peut fortement détériorer les performances

#### Liens et compléments
 - **[EN]** [cppreference.com – C++ attribute: likely, unlikely](https://en.cppreference.com/w/cpp/language/attributes/likely)
 - **[EN]** [open-std.org | p0479r0 "Attributes for Likely and Unlikely Branches"](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2016/p0479r0.html)

## A quoi correspond l'attribut [[no_unique_address]] ?

L’attribut ```[[no_unique_address]]```, ajouté avec **C++20**, est destiné à indiquer qu’une variable membre n’a pas besoin d’avoir une adresse séparée des autres membres de la classes. Cela revient à autoriser un équivalent de l’[Empty Base Optimisation](https://github.com/cpp-faq/cpp-faq/tree/develop/faq/fr-FR/.faq/404.md) pour un membre d’une classe.

```
struct Empty {}; // empty class

struct X {
    int i;
    Empty e;
};

struct Y {
    int i;
    [[no_unique_address]] Empty e;
};

int main()
{
    // the size of any object of empty class type is at least 1
    static_assert(sizeof(Empty) >= 1);

    // at least one more byte is needed to give e a unique address
    static_assert(sizeof(X) >= sizeof(int) + 1);

    // empty member optimized out
    static_assert(sizeof(Y) == sizeof(int));
}
```

Dans cet exemple tiré de *cppreference*, ```Empty``` est une **empty class**, c’est à dire qu’elle ne contient aucune donnée membre. Puisque le C++ impose que même une classe vide fasse une taille d’au moins 1 byte, la première assertion est donc vraie.

La classe ```X``` contient une donnée membre de type ```Empty```, la classe ```X``` a donc une taille au moins égale à la taille d’un ```int``` plus un byte, soit ```sizeof(int) + 1``` comme le confirme la seconde assertion.

La classe ```Y``` contient elle aussi une donnée membre de type ```Empty```, mais accompagnée de l’attribut ```[[no_unique_address]]```. Dans ce cas, le compilateur est autorisé à optimiser ce membre de manière à ne lui faire occuper aucune place. Par conséquent, la taille de ```Y``` est égale à la taille d’un ```int```, le membre ```e``` n’occupant pas d’espace en mémoire.

#### Liens et compléments
 - **[EN]** [cppreference.com – C++ attribute: no_unique_address](https://en.cppreference.com/w/cpp/language/attributes/no_unique_address)
 - **[EN]** [open-std.org | p0840r2 "Language support for empty objects"](http://open-std.org/JTC1/SC22/WG21/docs/papers/2018/p0840r2.html)

## A quoi correspond l'attribut [[assert]] ?

L'attribut ```[[assert]]``` fait partie des ajouts de **C++20** pour le support de la programmation par contrat. Cet attribut permet de déclarer une assertion, il peut être vu comme une version moderne de la macro **C** ```assert()```.

Cet attribut est assez particulier puisqu'il s'utilise à la manière d'une instruction et est suivis par un point-virgule :

```cpp
void foo(int i = 0) {
    /* ... */
    [[assert: x >= 0]];
    /* ... */
    [[assert: !something()]];
    /* ... */
}
```

```[[assert]]``` permet de vérifier la validité d'un prédicat à un point donné d'une fonction. Comme les autres attributs liés aux contrats, il est possible de spécifier un niveau de contrat (*contract-level*), ```default``` étant implicite.

Par rapport à l'ancien ```assert``` hérité du **C**, cet attribut apporte quelques avantages non négligeables. Déjà, il ne s'agit pas d'une macro et il permet d'éviter les risques associés (```[[assert: c == std::complex<float>{0, 0}]]``` compile contrairement à ```assert(c == std::complex<float>{0,0})```). Ensuite, les *contract-level* ainsi que la possibilité de régler le niveau de vérification voulu (associé à la possibilité de fournir un gestionnaire de violation de contrat personnalisé). Enfin, ```[[assert]]``` permet à l'optimiseur et aux outils d'analyse statique d'avoir des informations précises sur l'assertion ce qui facilite l'analyse et peut ouvrir la voie à des optimisations supplémentaires.

#### Liens et compléments
 - [Comment faire une assertion en C++ ?](https://github.com/cpp-faq/cpp-faq/tree/develop/faq/fr-FR/.faq/404.md)
 - **[EN]** [cppreference.com – C++ attribute: expects, ensures, assert](https://en.cppreference.com/w/cpp/language/attributes/contract)
 - **[EN]** [open-std.org | p0840r2 "Support for contract based programming in C++"](http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2018/p0542r5.html)

## A quoi correspondent les attributs [[expects]] et [[ensures]] ?

**En cours d'écriture**

## Qu'est-ce que le contract-level des attributs des contrats ?