# Les attributs

### Sommaire

- [Qu'est-ce qu'un attribut ?](https://github.com/cpp-faq/cpp-faq/tree/master/faq/fr-FR/04%20-%20Les%20structures%20du%20langage/Les%20attributs#quest-ce-quun-attribut-).
- [Quels sont les attributs standards en C++ ?](https://github.com/cpp-faq/cpp-faq/tree/master/faq/fr-FR/04%20-%20Les%20structures%20du%20langage/Les%20attributs#quels-sont-les-attributs-standards-en-c-).
- [Est-ce que using namespace s'applique aussi aux attributs ?](https://github.com/cpp-faq/cpp-faq/tree/master/faq/fr-FR/04%20-%20Les%20structures%20du%20langage/Les%20attributs#est-ce-que-using-namespace-sapplique-aussi-aux-attributs-).
- [A quoi correspond l'attribut [[noreturn]] ?](https://github.com/cpp-faq/cpp-faq/tree/master/faq/fr-FR/04%20-%20Les%20structures%20du%20langage/Les%20attributs#a-quoi-correspond-lattribut-noreturn-).
- [A quoi correspond l'attribut [[carries_dependency]] ?](https://github.com/cpp-faq/cpp-faq/tree/master/faq/fr-FR/04%20-%20Les%20structures%20du%20langage/Les%20attributs#a-quoi-correspond-lattribut-carries_dependency-).
- [A quoi correspond l'attribut [[deprecated]] ?](https://github.com/cpp-faq/cpp-faq/tree/master/faq/fr-FR/04%20-%20Les%20structures%20du%20langage/Les%20attributs#a-quoi-correspond-lattribut-deprecated-).
- [A quoi correspond l'attribut [[falltrough]] ?](https://github.com/cpp-faq/cpp-faq/tree/master/faq/fr-FR/04%20-%20Les%20structures%20du%20langage/Les%20attributs#a-quoi-correspond-lattribut-falltrough-).
- [A quoi correspond l'attribut [[nodiscard]] ?]().
- [A quoi correspond l'attribut [[maybe_unused]] ?]().
- [A quoi correspond les attributs [[likely]] et [[unlikely]] ?]().





## Qu'est-ce qu'un attribut ?

Les attributs ont été introduit avec **C++11**. Ils fournissent une syntaxe unifiée pour les attributs des compilateur (```__attribute__``` sur GCC et Clang, ```__declspec()``` pour MSVC). Le standard propose également des attributs standards.

Si un attribut n'est pas reconnu par un compilateur, celui-ci est ignoré. Les attributs sont déclarés entre deux crochets ```[[attribute]]``` et peuvent être associés à la majorité des constructions du langage. Ci suit un exemple avec quelques attributs standards :

```cpp
[[deprecated("Superseded by foo(bool))]]
[[noreturn]] void foo();

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
                [[falltrough]]                    
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
 - *(C++17)* ```[[falltrough]]```.
 - *(C++17)* ```[[nodiscard]]```.
 - *(C++17)* ```[[maybe_unused]]```.
 - *(C++20)* ```[[likely]]``` et ```[[unlikely]]```.
 - *(C++20)* ```[[no_unique_address]]```.
 - *(C++20)* ```[[expects]]```.
 - *(C++20)* ```[[assert]]```.
 - *(C++20)* ```[[ensures]]```.
 - *(C++20)* ```[[expects]]```.

## Est-ce que using namespace s'applique aussi aux attributs ?

**En cours d'écriture**

## A quoi correspond l'attribut [[noreturn]] ?

**En cours d'écriture**

## A quoi correspond l'attribut [[carries_dependency]] ?
A quoi correspond l'attribut [[noreturn]] ?
Quels sont les attributs standards en C++ ?
Est-ce que using namespace s'applique aussi aux attributs ?
**En cours d'écriture**

## A quoi correspond l'attribut [[deprecated]] ?

**En cours d'écriture**

## A quoi correspond l'attribut [[falltrough]] ?

**En cours d'écriture**

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
