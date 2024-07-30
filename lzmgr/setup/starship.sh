#!/bin/sh

getcmd=""
if [ -f /bin/fetch ]; then
	getcmd="fetch -o"
elif [ -f /bin/curl ]; then
	getcmd="curl -Lo"
else
	echo "Need curl or fetch installed"
	exit 1
fi

tmpdir="$HOME/.local"
bindir="$HOME/.local/bin"

message=""
action=""

if [ -f $HOME/.local/bin/starship ]; then
	message="updated"
	action="updating"
else
	action="installing"
	message="installed"
fi

echo
echo "$action starship prompt"
$getcmd $tmpdir/starship.tar.gz "https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-gnu.tar.gz"
tar -xzf $tmpdir/starship.tar.gz -C $bindir
rm -rf $tmpdir/starship.tar.gz

if [ "$message" = "installed" ]; then
	if [ -f $HOME/.zshrc ]; then
		if grep -q '^ZSH_THEME=' "$HOME/.zshrc"; then
    			sed -i "s/^ZSH_THEME=.*/ZSH_THEME=\"\"/" "$HOME/.zshrc"
		fi
		echo 'eval "$(starship init zsh)"' >> $HOME/.zshrc
	fi
	if [ -f $HOME/.bashrc ]; then
		echo 'eval "$(starship init bash)"' >> $HOME/.bashrc
	fi
fi

echo "starship $message"
