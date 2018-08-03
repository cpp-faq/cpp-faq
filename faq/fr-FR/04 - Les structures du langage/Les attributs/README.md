# Les attributs

### Sommaire



## Qu'est ce qu'un attribut ?

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

## Est-ce que using namespace s'applique aussi aux attributs ?

## Quels sont les attributs standards en C++ ?

## A quoi correspond l'attribut [[noreturn]] ?

**En cours d'écriture**

## A quoi correspond l'attribut [[carries_dependency]] ?

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
