#!/usr/bin/bash

to_install=()

echo ">> Notice that i3 has to be installed already"
echo ">> Checking if packages: feh, scrot, picom, kitty exist"

installed=$(ls /bin)

if [[ "${installed[*]}" =~ "feh" ]]; then
	echo "feh exists"
else
	echo "feh not found"
	to_install+=feh
fi

if [[ "${installed[*]}" =~ "picom" ]]; then
	echo "picom exists"
else
	echo "picom not found"
	to_install+=picom
fi

if [[ "${installed[*]}" =~ "kitty" ]]; then
	echo "kitty exists"
else
	echo "kitty not found"
	to_install+=kitty
fi

if [[ "${installed[*]}" =~ "scrot" ]]; then
	echo "scrot exists"
else
	echo "scrot not found"
	to_install+=scrot
fi

if [[ -z $to_install ]]; then
	echo ">> All packages are installed"
else
	echo ">> Packages to install: $to_install"
	sudo apt install $to_install
fi

echo ">> Creating config backup for i3"
mv $HOME/.config/i3/config $HOME/.config/i3/config.bak
echo ">> Replacing default config"
cp ./config ~/.config/i3/config
echo ">> Done."
