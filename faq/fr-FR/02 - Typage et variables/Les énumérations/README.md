# Les énumérations

### Sommaire

**En cours d'écriture**

## Qu'est-ce qu'une énumération ?

**En cours d'écriture**

## Comment déclarer une enum en C++ ?

La déclaration d’une énumération se fait à l’aide du mot clef enum :

```cpp
enum MonEnum {ELEM_1, ELEM_2, ELEM_3} ;
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
