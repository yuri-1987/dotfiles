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

# Install brew if needed
# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$(whoami)/.zprofile
fi

# Update homebrew recipes
brew update

# Add font repo
brew tap homebrew/cask-fonts
# Add terraspace repo
brew tap boltops-tools/software
# plumber
brew tap batchcorp/public

# Install CLI tools
clitools="fzf golang python3 sops yq jq gpg gsed kubectl kubernetes-cli git vim curl wget kubectx pipenv\
  pre-commit terraform-docs tflint tfsec coreutils checkov terrascan infracost exa pyenv rbenv\
  tfenv terraspace terraform-docs docker colima neofetch wireguard-tools htop ssh-copy-id diff-so-fancy zsh starship plumber"
installBrewCliPackages "${clitools}"

# Install GUI tools
guitools="iterm2 firefox font-ibm-plex google-cloud-sdk font-hack bitwarden authy karabiner-elements zoom slack spotify 1password"
installBrewGuiPackages "${guitools}"

# Cleanup
brew cleanup

# Install ZSH and ohmyzsh
# brew install zsh
# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
