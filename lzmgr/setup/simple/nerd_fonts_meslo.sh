#!/bin/sh

if [ ! -f /bin/unzip ]; then
	echo "unzip is needed, install it!!!";
	exit 1
fi

getcmd="curl -Lo"

if [ ! -d $HOME/.local/share/fonts ]; then
	mkdir -p $HOME/.local/share/fonts
fi

action=""
message=""
if [ -d $HOME/.local/share/fonts/meslo-nerd ]; then
	message="updated"
	action="updating"
else
	message="installed"
	action="installing"
fi

echo
echo "$action Meslo Nerd Font"
$getcmd $HOME/.local/share/fonts/Meslo.zip "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Meslo.zip"
unzip $HOME/.local/share/fonts/Meslo.zip -d $HOME/.local/share/fonts/meslo-nerd
rm -rf $HOME/.local/share/fonts/Meslo.zip
fc-cache -f

echo "Meslo Nerd Font $message"

