# SDL2_Base
Repo servant de base a un projet C ou C++ avec la SDL2.

## Configuration
```
./setup.sh
```
*Cela va installer la SDL2, puis vous proposez d'installer SDL_Image, SDL_TTF et SDL_Mixer*

## Environement

Le projet est séparant en plus fichiers :
 - .build -> C'est dans ce dossier qu'ira tous les .o et .d issu de la compilation
 - bin -> C'est dans ce dossier que ce trouvera l'éxécutable du projet
 - data -> C'est ici que vous pourrez mettre vos données pour le projet
 - includes -> C'est le dossier où ranger ces headers (.h/.hpp)
 - SDL -> C'est le dossier de la SDL2
 - srcs -> C'est ici que vous pouvez mettre tous vos fichiers sources (.c/.cpp)

## Makefile
Un Makefile pour compiler un projet en C est déjà présent.

Une version pour le C++ est aussi présente. Renommez Makefile-cpp en Makefile.

Vous pouvez changer le nom de l'éxécutable en modifiant la variable **NAME** ligne 24 du Makefile

Pour compiler, tapez
```
make
```
Pour lancer le projet, tapez
```
make run
```
Vous pouvez retirer les .o et .d en tapant
```
make clean
```
Vous pouvez retirer les .o, .d et le binaire en tapant
```
make fclean
```
Vous pouvez recompiler tous le projets en tapant
```
make re
```
