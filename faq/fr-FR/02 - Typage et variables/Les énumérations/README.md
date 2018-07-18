# Les énumérations

### Sommaire

**En cours d'écriture**

## Qu'est-ce qu'une énumération ?

**En cours d'écriture**

## Comment déclarer une enum en C++ ?

La déclaration d’une énumération se fait à l’aide du mot clef enum :

```cpp
enum MonEnum {ELEM_1, ELEM_2, ELEM_3};
```

Il est possible de préciser une valeur entière à un élément de l’énumération (appelé « énumérateur ») :
```cpp
enum Flags { FULLSCREEN = 0x1, WINDOWED = 0x2, WINDOWED_FULLESCREEN = 0x4 };
```
Si aucune valeur n’est précisée, le compilateur assigne aux énumérateurs des valeurs croissantes à partir de zéro.

Si seulement certaines valeurs sont précisées, le compilateur calculera les énumérateurs non spécifiés en incrémentant depuis ceux qui sont explicitement définies :

```cpp
enum MonEnum {I1 = -1, I2, I3, I4 = 12, I5, I6 = I4 + I1};

int main()
{
    std::cout << I1 << " " << I2 << " " << I3 << " " << I4 << " " << I5 << " " << I6 << '\n';    
}
```
Ce code affichera: ```-1 0 1 12 13 11```

## Qu’est-ce qu’une enum class (énumération fortement typée) ?

Les énumération fortement typées (*strong-typed enums*) ont été introduite avec le standard **C++11**.

L’objectif est de proposer un typage fort pour les énumérations de manière à les englober dans un espace de nom et à éviter les conversions automatiques non voulues.

Pour déclarer une énumération fortement typée, il faut utiliser le mot clef ```class``` (ou ```struct```, indifféremment) :
```cpp
enum Color { red, blue, green }; // déclaration d’une énumération.
enum class SColor { red, blue, green };  // déclaration d’une énumération fortement typée.
Une enum class n’est pas directement convertible en entier :
Color c;
int i = c; // OK.
bool b{red && blue ^ green}; // OK, même si ça n’a pas de sens.

SColor sc;
i = sc; // Erreur.
i = static_cast<int>(sc); // OK.
if(sc == 2) // Erreur.
    /*do something*/;
Bool b{red && blue ^ green}; // Erreur.
```

Cette sécurité du type à plusieurs avantage, notamment pour éviter d’avoir des valeurs ne correspondant à aucun énumérateur ou pour permettre des surcharges de fonction qui ne seraient pas toujours possible avec des énumérations du **C++03**.

Autre avantage des ```enum class``` est le fait que les énumérateurs appartiennent à un espace de nom (*namespace*) :
```cpp
enum class SColor { red, blue, green };

int main()
{   
    auto red{ SColor::red };
}
```

Il est nécessaire d’accéder aux énumérateurs à l’aide de l’opérateur de résolution de portée. Les identificateurs de énumérateurs sont donc libres pour le namespace global.

Avant **C++11**, il était commun d’envelopper des enum à l’intérieur de namespace ou de classes de manière à proposer cette syntaxe et éviter de polluer le namespace global.

## Comment choisir entre enum et enum class ?

Les ```enum class``` devraient être privilégiées autant que possible par rapport aux enum classiques parce qu’elles sont plus pratiques à utiliser (pas de risque de collision de nom, pas de comportement inattendu) et plus sécurisées (absence de conversion implicite notamment).

Il arrive que les énumérations simples soient préférées aux ```enum class``` lorsque l’arithmétique entier est nécessaire ou pour des raisons de compatibilité.
