#!/bin/sh
#

if [ -f $HOME/.local/bin/mise ]; then
	echo "mise is present"
	exit 1
fi

fetchprog=""
if [ -f /bin/fetch ]; then
	echo "using fetch"
	fetch -o - https://mise.run | sh
elif [ -f /bin/curl ]; then
	echo "using curl"
	curl https://mise.run | sh
else
	echo "curl or fetch not found in your system, install it!"
	exit 1
fi

if [ -f /bin/zsh ]; then
	echo "eval \"\$($HOME/.local/bin/mise activate zsh)\"" >> "/$HOME/.zshrc"
fi

echo "mise configured..."
exit 0

