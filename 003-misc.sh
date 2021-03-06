#!/usr/bin/env bash

# Create temp dir
tempDir=$(mktemp -d)
mkdir -p ~/.zsh/plugins

# Install fzf
$(brew --prefix)/opt/fzf/install

# Install chroma for zsh plugin
wget https://github.com/alecthomas/chroma/releases/download/v0.9.4/chroma-0.9.4-darwin-arm64.tar.gz -P "${tempDir}"
tar -xf "${tempDir}"/chroma-0.9.4-darwin-arm64.tar.gz -C "${tempDir}"
sudo mv "${tempDir}"/chroma /usr/local/bin/

# Setup git
git config --global core.excludesfile gitignore
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global interactive.diffFilter "diff-so-fancy --patch"
# Setup git colors:
git config --global color.ui true
git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"
git config --global color.diff.meta       "11"
git config --global color.diff.frag       "magenta bold"
git config --global color.diff.func       "146 bold"
git config --global color.diff.commit     "yellow bold"
git config --global color.diff.old        "red bold"
git config --global color.diff.new        "green bold"
git config --global color.diff.whitespace "red reverse"
git config --global user.name "yuri-1987"
git config --global user.email "27512519+yuri-1987@users.noreply.github.com"

# handle multi kube context
mkdir -p ~/.kube/kubeconfig.d
cp misc/multi-kube.sh ~/.zsh/multi-kube.sh

mkdir -p ~/.starship/
cp starship/config.toml ~/.starship/

# Instrall awesome vim
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# Install latest stable TF
tfenv install

# zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ~/.zsh/plugins/zsh-completions
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/colorize/colorize.plugin.zsh -P ~/.zsh/plugins/

# replace zshrc
cp zshrc ~/.zshrc

# Setup iTerm2
# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/github/dotfiles/iterm2"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# Cleanup
rm -rf "${tempDir}"
