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

En **C++**, `f(void)` et `f()` sont strictement équivalent.

Le **C** en revanche, autorise la déclaration d'une fonction sans en préciser le prototype :

```c
// C++ : déclaration de la fonction f ne prenant pas d'argument.
// C   : déclaration de la fonction f, son prototype sera déclaré par la suite.
void f();

// C++ : déclaration de la fonction g ne prenant pas d'argument.
// C   : déclaration de la fonction g ne prenant pas d'argument.
void g(void);

// C++ : déclaration d'une surcharge de la fonction f, prenant un int et un double en argument.
// C   : déclaration de la fonction f et de son prototype, f prends un int et un double en argument.
void f(int i, double d);

// C++ : déclaration d'une surcharge de la fonction g, prenant un int et un double en argument.
// C   : erreur, g a déjà été déclarée et ne prends aucun argument.
void g(int i, double d);
```

̀`f(void)` en **C** est donc la manière correcte de déclarer une fonction ne prenant aucun argument, tandis que `f()` déclare la fonction sans en préciser les éventuels paramètres.


#### Liens et compléments
 - [stackoverflow.com | Understanding the difference between f() and f(void) in C and C++ once and for all](https://stackoverflow.com/questions/13319492/understanding-the-difference-between-f-and-fvoid-in-c-and-c-once-and-for-a)

## Quel est l'intérêt d'un return dans une fonction retournant void ?

Si la question porte sur l'instruction `return;`, alors il s'agit simplement d'un moyen de terminer la fonction dans le cas d'une fonction `void` :

```cpp
void foo() {
    // ...
    if (condition)
        return; // retour de la fonction.
    // ...
}
```
Il est aussi possible de croiser ce genre de code :

```cpp
void foo();

void bah() {
    // ...
    return foo() ; // Retour dans une fonction void.
}
```

Cet exemple est valide en C++. Puisque `foo` retourne `void`, il est possible de retourner `foo()` dans une fonction retournant `void`.

L’intérêt de faire une telle chose est que si un jour on décide de retourner un type `T` dans la fonction `foo` il suffira simplement de modifier le prototype de `bah` sans avoir à changer son corps. Cette notation permet également d'exprimer clairement que le type de retour de `bah` dépends de celui de `foo` d'un point de vue logique.

En pratique, l'inférence de type permet de se passer de ce genre de technique désormais :

```cpp
void foo() {}

auto bah() { // Avec auto (C++14).
    // ...
    return foo();   
}

decltype(foo()) boo(){ // Avec decltype (C++11).
    // ...
    return foo();
}
```
