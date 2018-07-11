# Les fonctions

### Sommaire

**En cours d'écriture**

## Pourquoi diviser mon programme en fonctions ?

## Qu'est-ce que la signature d'une fonction ?

## Qu'est-ce que le prototype d'une fonction ?

## Quelles sont les différences entre une fonction, un sous-programme, une méthode et une procédure ?

## Qu'est-ce que le function-try-block ?
Le **function-try-block** est une forme alternative de définition d'une fonction. Celle-ci est destinée à permettre la journalisation (logging) et le traitement d'une exception survenue dans la liste d'initialisation d'un constructeur avant que l'exception ne soit levée à nouveau pour le code appelant :

```cpp
struct A
{
    A(std::size_t count) try : values_(count, 0u) {
    } catch (const std::exception& e) {
        Logger.log(e);
    } // l'exeception est propagée automatiquement.

    std::vector<unsigned> values_;
}
```

Dans cet exemple, l'exception ```e``` est levée à nouveau lorsque  l'accolade fermante du bloc ```catch``` est atteinte. Pour les fonctions autres que les constructeurs et les destructeurs, l'exception n'est pas propagée à la fin du block catch mais un ```return``` implicite est effectué.

Certaines règles particulières s'appliquent au **function-try-block**. Notamment, la portée la durée de vie des variables locales et des paramètres sont étendues jusqu'à la fin du block ```catch``` (celles-ci ne sont pas détruite à la fin de l'accolade fermante du bloc ```try```).

Pour plus d'information sur les fonctionnement du **function-try-block** et des contraintes relatives, référez vous à [http://en.cppreference.com/w/cpp/language/function-try-block](cppreference).

## Quelle est la différence entre f(void); et f() ?

## Quel est l'intérêt d'un return dans une fonction retournant void ?
