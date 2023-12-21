#!/bin/bash

mkdir -p includes bin data

if [ -d SDL ]
then
	echo "SDL already install"
	echo "Do you want to reinstall it ? Y/n"
	read response
	if [ "$response" = "y" ] || [ "$response" = "Y" ]
	then
		echo "Remove SDL..."
		rm -rf SDL
		echo "Done"
	else
		echo "Script stop"
		exit
	fi;
fi;
echo "SDL begin installation"
{
	git clone https://github.com/libsdl-org/SDL.git -b SDL2
	cd SDL;
	mkdir build;
	cd build;
	../configure;
	make;
	sudo make install;
} || (echo "Failure"; exit;)

echo "Do you want to install SDL_Image ? Y/n"
read response
if [ "$response" = "y" ] || [ "$response" = "Y" ]
then
	echo "Begin installation"
else
	echo "Skip installation"
fi;

echo "Do you want to install SDL_TTF ? Y/n"
read response
if [ "$response" = "y" ] || [ "$response" = "Y" ]
then
	echo "Begin installation"
else
	echo "Skip installation"
fi;
