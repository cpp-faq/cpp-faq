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

Il est possible de spécifier une liste d'attributs dans une même déclaration. Les attributs de contrat (```[[assert]]```, ```[[assert]]``` et ```[[assert]]```) font exception et doivent être déclarés seuls :

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

**En cours d'écriture**

## A quoi correspond l'attribut [[carries_dependency]] ?

**En cours d'écriture**

## A quoi correspond l'attribut [[deprecated]] ?

**En cours d'écriture**

## A quoi correspond l'attribut [[fallthrough]] ?

L’attribut ```[[fallthrough]]``` est destiné aux instructions ```switch```. L’objectif est de préciser au compilateur qu’une absence de saut du flot de contrôle est volontaire (que ce soit avec ```break``` ou ```return```).

Les compilateurs signalent souvent les *fallthroughs*, c’est à dire lorsque le programme passe d’une ```case``` à l’autre sans saut. Si il s’agit en effet d’une erreur de programmation assez classique, il est également possible que celle-ci soit intentionnelle.

```[[fallthrough]]``` indique au compilateur que le *fallthrough* est intentionnel et ne doit pas être considéré comme une erreur. Il permet ainsi d’éviter un *warning* de la part du compilateur. Celui-ci doit précéder un  case.

```cpp
action handle_event(event my_event) {
    switch(my_event) {
      case event::mouse_click:
          [[fallthrough]]; // fallthrough explicite, pas de warning.
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

## A quoi correspond l'attribut [[nodiscard]] ?

**En cours d'écriture**

## A quoi correspond l'attribut [[maybe_unused]] ?

**En cours d'écriture**

## A quoi correspond les attributs [[likely]] et [[unlikely]] ?

**En cours d'écriture**

## A quoi correspond l'attribut [[no_unique_address]] ?

**En cours d'écriture**

## A quoi correspondent les attributs [[expects]] [[ensures]] et [[assert]] ?

**En cours d'écriture**
