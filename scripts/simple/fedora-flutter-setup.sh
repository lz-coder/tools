#!/bin/sh

echo -e "\n## Installing VScode ##\n"
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf install -y code

echo -e "\n## Installing VScode Extensions ##\n"
code --install-extension Dart-Code.dart-code
code --install-extension Dart-Code.flutter
code --install-extension Google.arb-editor
code --install-extension usernamehw.errorlens
code --install-extension formulahendry.code-runner
code --install-extension vscode-icons-team.vscode-icons

echo -e "\n## Installing development packages ##\n"
sudo dnf install -y clang cmake git-core gh gtk3-devel ninja-build pkgconf-pkg-config xz-devel libstdc++-devel pinentry-gnome3 libsecret chromium gnome-themes-extra google-droid-sans-mono-fonts
