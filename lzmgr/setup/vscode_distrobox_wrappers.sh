#!/bin/sh

setup_vscode_wrappers() {
  if [ ! -f $HOME/.local/bin/podman-host ]; then
    echo "Configuring podman-host wrapper"
    echo "https://github.com/89luca89/distrobox/blob/main/docs/posts/integrate_vscode_distrobox.md#third-step-podman-wrapper"
    curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/extras/podman-host -o ~/.local/bin/podman-host
    chmod +x ~/.local/bin/podman-host
    echo "podman-host wrapper configured"
    echo
  else
    echo "podman-host wrapper already configured in your system"
  fi
  if [ ! -f $HOME/.local/bin/vscode-distrobox ]; then
    echo
    echo "Configuring vscode-distrobox wrapper"
    echo "https://github.com/89luca89/distrobox/blob/main/docs/posts/integrate_vscode_distrobox.md#open-vscode-directly-attached-to-our-distrobox"
    echo
    curl -s https://raw.githubusercontent.com/89luca89/distrobox/main/extras/vscode-distrobox -o ~/.local/bin/vscode-distrobox
    chmod +x ~/.local/bin/vscode-distrobox
    echo "vscode-distrobox wrapper configured"
    echo
  else
    echo "vscode-distrobox wrapper already configured in your system"
  fi
  
}


setup_vscode_wrappers
