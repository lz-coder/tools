#!/bin/sh
#

if [ -d $HOME/.oh-my-zsh ]; then
	echo "Oh my zsh already installed"
	exit 1
fi

if [ ! -f /bin/git ]; then
	echo "git not found, install it"
	exit 1
fi

if [ -f $HOME/.zshrc ]; then
	echo ".zshrc found in $HOME, remove it before running this script"
	exit 1
fi

getcmd=""

if [ -f /bin/fetch ]; then
	getcmd="fetch -o -"
elif [ -f /bin/curl ]; then
	getcmd="curl -fsSL"
else
	echo "fetch and curl not found, install one"
	exit 1
fi

write_zsh_config () {
cat >> "$HOME"/.zshrc << 'EOL'

#PATH env
export PATH=$HOME/.local/bin:$PATH

#Theme
ZSH_THEME="robbyrussell"

#Plugins
plugins=(git zsh-autosuggestions fast-syntax-highlighting autoupdate)

fpath+=~/.oh-my-zsh/custom/plugins/zsh-completions/src

source $ZSH/oh-my-zsh.sh

EOL
}

echo "Configuring Oh-my-zsh..."
echo
sh -c "$($getcmd https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins ~/.oh-my-zsh/custom/plugins/autoupdate
rm $HOME/.zshrc
echo ZSH="${HOME}/.oh-my-zsh" >> "${HOME}"/.zshrc
write_zsh_config
echo
echo "SETUP FINISHED"
