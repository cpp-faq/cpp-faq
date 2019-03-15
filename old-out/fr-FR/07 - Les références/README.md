# Les références

**En cours d'écriture**

## Sommaire

**En cours d'écriture**

## Une référence peut-elle être invalide ?

Oui. Contrairement à un pointeur, une référence ne peut pas se référer à "*rien*". En revanche, il est possible que l'objet auquel auquel elle se réfère n'existe plus :

```cpp
#include <iostream>

int main(int argc, char** argv)
{
    int* ptr = new int(13);
    int& ref = *ptr;

    delete ptr;
    std::cout << ref << std::endl; // ref est invalide.
}
```

Dans l'exemple ci-dessus, `ref` n'est plus valide à partir de l'instruction `delete` puisque l'entier a été détruit. Dans ce cas, l'utilisation de l'objet préalablement détruit correspond à un comportement indéterminé (*undefined behavior*).

Les situations les plus probables ici seront l'affichage de 13, d'une autre valeur ou encore une erreur de segmentation.

L'utilisation d'une référence n'apporte donc pas de garantie sur la validité de l'objet.
