#!/usr/bin/env bash

installBrewCliPackages() {
  local pkgs="${1}"
  for pkg in ${pkgs[@]}; do
    if ! brew install "${pkg}"; then
      echo -e "Unable to install ${pkg}.\n"
    fi
  done
}

installBrewGuiPackages() {
  local pkgs="${1}"
  for pkg in ${pkgs[@]}; do
    if ! brew install "${pkg}" --cask; then
      echo -e "Unable to install ${pkg}.\n"
    fi
  done
}

# Install brew
echo -e "Installing brew\n"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add font repo
brew tap homebrew/cask-fonts

# Install ZSH and ohmyzsh
brew install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install CLI tools
clitools="fzf golang python3 yq jq gpg kube-ps1 kubectl kubernetes-cli git vim curl wget kubectx pipenv tfenv docker colima neofetch wireguard-tools htop ssh-copy-id diff-so-fancy"
installBrewCliPackages "${clitools}"

# Install GUI tools
guitools="iterm2 firefox font-ibm-plex google-cloud-sdk font-hack vscodium bitwarden authy karabiner-elements zoom slack spotify spotify 1password"
installBrewGuiPackages "${guitools}"

# Cleanup
brew cleanup