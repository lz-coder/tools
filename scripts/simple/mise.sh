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

if [ "$SHELL" = "/usr/bin/zsh" ] || [ "$SHELL" = "/bin/zsh" ]; then
	echo "Activating for zsh"
	echo "eval \"\$($HOME/.local/bin/mise activate zsh)\"" >> "/$HOME/.zshrc"
elif [ "$SHELL" = "/usr/bin/fish" ] || [ "$SHELL" = "/usr/bin/fish-shell" ]; then
	echo "Activating for fish"
	echo '~/.local/bin/mise activate fish | source' >> "$HOME/.config/fish/conf.d/mise.fish"
elif [ "$SHELL" = "/usr/bin/bash" ] || [ "$SHELL" = "/bin/bash" ]; then
	echo "Activation for Bash"
	echo "eval \"\$($HOME/.local/bin/mise activate bash)\"" >> "/$HOME/.bashrc"
fi

echo "mise configured..."
exit 0

