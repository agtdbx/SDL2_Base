#!/bin/bash

mkdir -p includes bin data

if [ -d SDL2 ]
then
	echo "SDL already install"
	echo "Do you want to reinstall it ? Y/n"
	read response
	if [ "$response" = "y" ] || [ "$response" = "Y" ]
	then
		echo "Remove SDL..."
		rm -rf SDL2
		echo "Done"
	else
		echo "Script stop"
		exit
	fi;
fi;
echo "SDL begin installation"
mkdir -p SDL2
cd SDL2
SDLdir=$(pwd)
{
	git clone https://github.com/libsdl-org/SDL.git -b SDL2
	cd SDL;
	mkdir build;
	cd build;
	../configure;
	make;
	sudo make install;
} || (echo "Failure"; exit;)

echo "Do you want to install SDL_image ? Y/n"
read response
if [ "$response" = "y" ] || [ "$response" = "Y" ]
then
	echo "Begin installation"
	cd $SDLdir
	git clone https://github.com/libsdl-org/SDL_image.git -b SDL2
	cd SDL_image
	mkdir build
	cd build
	../configure
	make
	sudo make install
	echo "Done"
else
	echo "Skip installation"
fi;

echo "Do you want to install SDL_ttf ? Y/n"
read response
if [ "$response" = "y" ] || [ "$response" = "Y" ]
then
	echo "Begin installation"
	cd $SDLdir
	git clone https://github.com/libsdl-org/SDL_ttf.git -b SDL2
	cd SDL_ttf
	mkdir build
	cd build
	../configure
	CFLAGS="-isystem /usr/include/harfbuzz" cmake .. \
	-DCMAKE_INSTALL_PREFIX='/usr' \
	-DUSE_SHARED_ENET='TRUE' \
	-DDISTRIBUTOR='aur.archlinux.org'
	make
	sudo make install
	echo "Done"
else
	echo "Skip installation"
fi;

echo "Do you want to install SDL_mixer ? Y/n"
read response
if [ "$response" = "y" ] || [ "$response" = "Y" ]
then
	echo "Begin installation"
	cd $SDLdir
	git clone https://github.com/libsdl-org/SDL_mixer.git -b SDL2
	cd SDL_mixer
	mkdir build
	cd build
	../configure
	make
	sudo make install
	echo "Done"
else
	echo "Skip installation"
fi;


echo "Do you want to install SDL_net ? Y/n"
read response
if [ "$response" = "y" ] || [ "$response" = "Y" ]
then
	echo "Begin installation"
	cd $SDLdir
	git clone https://github.com/libsdl-org/SDL_net.git -b SDL2
	cd SDL_net
	mkdir build
	cd build
	../configure
	make
	sudo make install
	echo "Done"
else
	echo "Skip installation"
fi;
